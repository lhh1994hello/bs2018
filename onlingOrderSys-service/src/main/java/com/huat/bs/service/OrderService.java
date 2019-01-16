//创建时间：2018年4月10日,下午8:45:23
package com.huat.bs.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huat.bs.bean.Category;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.Orderitem;
import com.huat.bs.bean.OrderitemExample;
import com.huat.bs.bean.Orders;
import com.huat.bs.bean.OrderitemExample.Criteria;
import com.huat.bs.bean.OrdersExample;
import com.huat.bs.bean.User;
import com.huat.bs.bean.UserException;
import com.huat.bs.dao.CategoryMapper;
import com.huat.bs.dao.MenuMapper;
import com.huat.bs.dao.OrderitemMapper;
import com.huat.bs.dao.OrdersMapper;
import com.huat.bs.dao.UserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.ExcelUtil;
import com.huat.bs.util.IPUtil;
import com.huat.bs.util.PaymentUtil;
import com.huat.bs.util.RedisUtilsIO;

/**
 * 
 * @author 李红辉 订单模块
 */
@Service
@SuppressWarnings("all")
public class OrderService extends RedisUtilsIO<Orders> {
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private OrderitemMapper orderitemMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CategoryMapper categoryMapper;

	@Autowired
	private JedisClient jedisClient;// =new JedisClientSingle();
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;

	@Value("${p1_MerId}")
	private String p1_MerId;

	@Value("${p8_Url}")
	private String p8_Url;

	@Value("${eurl}")
	private String eurl;

	@Value("${keyValue}")
	private String keyValue;

	// 查询出所有未付款的订单
	public List<Orders> selectAllOrdersNoPayment() {
		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andPaystateEqualTo(0);// 状态为0表示未付款
		List<Orders> orderslist = ordersMapper.selectByExample(example);
		// System.out.println("*******查询,集合长度:......"+orderslist.size());
		return orderslist;
	}

	// 插入订单
	public void insertOrder(Orders orders, String uid) {
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, uid);
		}catch(Exception e){
			System.out.println("插入订单，删除缓存失败....");
		}
	
		// 插入订单
		ordersMapper.insertSelective(orders);
		// 循环插入订单
		List<Orderitem> orderItemList = orders.getOrderItemList();
		System.out.println("订单条目内容:" + orderItemList);
		for (Orderitem orderItem : orderItemList) {
			System.out.println("循环插入订单项.....................");
			orderitemMapper.insertSelective(orderItem);
		}
	}

	// 生成URL,访问易宝
	public String getURL(Orders order, String pd_FrpId) {
		// TODO Auto-generated method stub
		// 准备13参数
		String p0_Cmd = "Buy";
		// 从配置问文件中得到 p1
		// String p2_Order = order.getOid();// 订单编号
		String p2_Order = order.getOid();// 订单编号
		// String p3_Amt = order.getTotal().toString();// 订单金额
		String p3_Amt = "0.01";// 订单金额
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		p8_Url = MessageFormat.format(p8_Url, IPUtil.getComputerIP());
		System.out.println("回调地址:" + p8_Url);
		String p9_SAF = "";// 送货地址
		String pa_MP = "";
		// String pd_FrpId2=pd_FrpId;
		String pr_NeedResponse = "1";
		// 计算hmac
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc,
				p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		// 连接易宝支付的网址
		StringBuffer url = new StringBuffer(eurl);
		url.append("?p0_Cmd=").append(p0_Cmd);
		url.append("&p1_MerId=").append(p1_MerId);
		url.append("&p2_Order=").append(p2_Order);

		url.append("&p3_Amt=").append(p3_Amt);
		url.append("&p4_Cur=").append(p4_Cur);
		url.append("&p5_Pid=").append(p5_Pid);

		url.append("&p6_Pcat=").append(p6_Pcat);
		url.append("&p7_Pdesc=").append(p7_Pdesc);
		url.append("&p8_Url=").append(p8_Url);

		url.append("&p9_SAF=").append(p9_SAF);
		url.append("&pa_MP=").append(pa_MP);
		url.append("&pd_FrpId=").append(pd_FrpId);

		url.append("&pr_NeedResponse=").append(pr_NeedResponse);
		url.append("&hmac=").append(hmac);
		return url.toString();
	}

	// 修改订单状态，根据编号
	public void updateOrderPayState(String r6_Order, Integer payState) throws UserException {
		// 先根据订单编号查询订单，获取订单目前的状态
		// 0:未付款，1：已付款未发货，2：已发货未收货，3:已收货
		Orders order = ordersMapper.selectByPrimaryKey(r6_Order);
		System.out.println("订单编号:" + r6_Order);
		System.out.println("查看状态:...........:" + order);
		int oldState = -100;// order.getPaystate();
		if (order != null) {
			oldState = order.getPaystate();
		}
		if (payState - oldState != 1 && payState - oldState != -1) {
			throw new UserException("订单目前的状态不是" + (payState - 1) + "不能修改为" + payState);
		}
		// payState = order.getPaystate();
		order.setPaystate(payState);
		System.out.println("订单编号:" + r6_Order + "," + "传入的订单状态" + payState);
		ordersMapper.updateByPrimaryKeySelective(order);
	}

	// 根据用户id查询订单,如果uid为空，就查询所有订单
	public List<Orders> getMyOrdersByUid(String uid) {

		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		example.setOrderByClause("createtime  desc");

		List<Orders> orderList = null;
		if (uid == null || uid.equals("")) {
			orderList = ordersMapper.selectByExample(null);
		} else {
			System.out.println("用户编号:" + uid);
			orderList = ordersMapper.selectByExample(example);
		}
		for (Orders order : orderList) {
			// 给一个订单，查询出这个订单对应的订单项和菜品集合
			List<Orderitem> orderItemList = selectOrderItemByOrder(order);
			order.setOrderItemList(orderItemList);
		}

		return orderList;
	}

	// 根据订单编号查询订单,顶多只有一个
	public Orders findOrdersByOid(String oid) {

		Orders order = ordersMapper.selectByPrimaryKey(oid);
		// 再根据订单号查询出对应的订单项
		OrderitemExample example = new OrderitemExample();
		Criteria criteria = example.createCriteria();
		criteria.andOidEqualTo(oid);
		List<Orderitem> orderItemList = orderitemMapper.selectByExample(example);
		// 查询出订单项对应的菜品，主键查询
		for (Orderitem orderItem : orderItemList) {
			Menu menu = menuMapper.selectByPrimaryKey(orderItem.getMid());
			orderItem.setMenu(menu);
		}
		order.setOrderItemList(orderItemList);

		/*
		 * String jsonString = JSONObject.toJSONString(order);
		 * setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, oid,
		 * jsonString);
		 */
		return order;
	}

	// 根据订单条件查询订单，方法的重载
	public List<Orders> selectOrderListByPaystate(Integer paystate, String beginTime, String endTime, String stext) {
		stext = stext.trim();
		System.out.println("AAA：" + paystate + ",开始时间:" + beginTime + ",结束时间:" + endTime + ",内容:" + stext);

		OrdersExample example = new OrdersExample();
		example.setOrderByClause("createtime  desc");
		OrdersExample.Criteria criteria = example.createCriteria();
		OrdersExample.Criteria criteria2 = example.createCriteria();
		OrdersExample.Criteria criteria3 = example.createCriteria();
		OrdersExample.Criteria criteria4 = example.createCriteria();

		if (paystate != -100) {
			System.out.println("分类查询.....付款状态码:" + paystate);
			criteria.andPaystateEqualTo(paystate);
			criteria2.andPaystateEqualTo(paystate);
			criteria3.andPaystateEqualTo(paystate);
			criteria4.andPaystateEqualTo(paystate);
		}

		DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd");
		DateTime dateTime = null;
		// 如果开始时间参数不为空
		if (!StringUtils.isBlank(beginTime)) {
			dateTime = DateTime.parse(beginTime, format);
			criteria.andCreatetimeGreaterThanOrEqualTo(dateTime.toDate());
			criteria2.andCreatetimeGreaterThanOrEqualTo(dateTime.toDate());
			criteria3.andCreatetimeGreaterThanOrEqualTo(dateTime.toDate());
			criteria4.andCreatetimeGreaterThanOrEqualTo(dateTime.toDate());
		}
		if (!StringUtils.isBlank(endTime)) {
			dateTime = DateTime.parse(endTime, format).plusDays(1);
			criteria.andCreatetimeLessThanOrEqualTo(dateTime.toDate());
			criteria2.andCreatetimeLessThanOrEqualTo(dateTime.toDate());
			criteria3.andCreatetimeLessThanOrEqualTo(dateTime.toDate());
			criteria4.andCreatetimeLessThanOrEqualTo(dateTime.toDate());
		}

		if (!StringUtils.isBlank(stext)) {
			criteria.andPurchaserEqualTo(stext);// 按下单人
			criteria2.andOidEqualTo(stext);// 按订单编号
			criteria3.andUserphoneEqualTo(stext);// 按手机号
			criteria4.andUidEqualTo(stext);// 按下单账号
			example.or(criteria2);
			example.or(criteria3);
			example.or(criteria4);
		}

		List<Orders> orderList = ordersMapper.selectByExampleWithBLOBs(example);
		User user = null;
		for (Orders order : orderList) {
			user = userMapper.selectByPrimaryKey(order.getUid());
			order.setUser(user);
			List<Orderitem> orderItemList = selectOrderItemByOrder(order);
			order.setOrderItemList(orderItemList);
		}
		return orderList;
	}

	// 根据订单状态查询订单 ,String beginTime,String endTime,String stext
	public List<Orders> selectOrderListByPaystate(Integer paystate) {
		// System.out.println("AAA："+paystate+",开始时间:"+beginTime+",结束时间:"+endTime+",内容:"+stext);

		OrdersExample example = new OrdersExample();
		example.setOrderByClause("createtime  desc");
		OrdersExample.Criteria criteria = example.createCriteria();
		// criteria.andCreatetimeBetween(new Date(), new Date());
		if (paystate != -100) {
			System.out.println("分类查询.....付款状态码:" + paystate);
			criteria.andPaystateEqualTo(paystate);
		}
		List<Orders> orderList = ordersMapper.selectByExampleWithBLOBs(example);
		User user = null;
		for (Orders order : orderList) {
			user = userMapper.selectByPrimaryKey(order.getUid());
			order.setUser(user);
			List<Orderitem> orderItemList = selectOrderItemByOrder(order);
			order.setOrderItemList(orderItemList);
		}
		return orderList;
	}

	// 根据订单ID的集合查询订单
	public List<Orders> getOrderListByOidList(List<String> oids) {
		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andOidIn(oids);
		List<Orders> orderList = ordersMapper.selectByExampleWithBLOBs(example);
		for (Orders order : orderList) {
			List<Orderitem> orderItemList = selectOrderItemByOrder(order);
			order.setOrderItemList(orderItemList);
			User user = userMapper.selectByPrimaryKey(order.getUid());
			order.setUser(user);
		}
		return orderList;
	}

	// 参数是一个List
	public HSSFWorkbook getHSSFWorkbook(List<Orders> orderList, String sheetName) {
		String[][] values = new String[orderList.size()][];
		String[] title = new String[] { "订单号", "下单账号", "收货人", "手机号", "下单时间", "收货地址", "订单金额", "订单状态", "留言" };// 标题
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < orderList.size(); i++) {
			values[i] = new String[title.length];
			Orders order = orderList.get(i);
			values[i][0] = order.getOid();
			values[i][1] = order.getUser().getuLoginid();
			values[i][2] = order.getPurchaser();
			values[i][3] = order.getUserphone();
			values[i][4] = sdf.format(order.getCreatetime());
			values[i][5] = order.getAddress();
			values[i][6] = order.getTotals() + "";
			values[i][7] = order.getPaystate().toString();
			values[i][8] = order.getNotes();
		}
		HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, values, null);
		return wb;
	}

	// 查询订单对应的订单项，
	public List<Orderitem> selectOrderItemByOrder(Orders order) {
		if (order == null) {
			return null;
		}
		String oid = order.getOid();
		OrderitemExample example = new OrderitemExample();
		Criteria criteria = example.createCriteria();
		criteria.andOidEqualTo(oid);
		List<Orderitem> orderItemList = orderitemMapper.selectByExample(example);
		for (Orderitem orderItem : orderItemList) {
			Menu menu = menuMapper.selectByPrimaryKey(orderItem.getMid());
			Category category = categoryMapper.selectByPrimaryKey(menu.getMcId());
			menu.setCategory(category);
			orderItem.setMenu(menu);
		}
		return orderItemList;
	}

	// 根据订单ID查询订单
	public Orders selectOrdersByOid(String oid) {
		Orders order = ordersMapper.selectByPrimaryKey(oid);
		List<Orderitem> orderItemList = selectOrderItemByOrder(order);
		order.setOrderItemList(orderItemList);
		User user = userMapper.selectByPrimaryKey(order.getUid());
		order.setUser(user);
		return order;
	}

	// 获得订单总数量
	public long geOrderNum() {
		return ordersMapper.countByExample(null);
	}

	// 获得今日订单
	public long getTodayOrderNum() {
		DateTime nowTime = new DateTime();
		DateTime startOfDay = nowTime.withTimeAtStartOfDay();
		DateTime endOfDay = nowTime.millisOfDay().withMaximumValue();
		Date start = startOfDay.toDate();
		Date end = endOfDay.toDate();
		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andCreatetimeBetween(start, end);
		long todayRegistNum = ordersMapper.countByExample(example);
		//System.out.println("今日订单:"+todayRegistNum);
 		return todayRegistNum;
	}
	//今日销售额
	public double getTodaySalary() {
		double salaryCount=0.00;
		DateTime nowTime = new DateTime();
		DateTime startOfDay = nowTime.withTimeAtStartOfDay();
		DateTime endOfDay = nowTime.millisOfDay().withMaximumValue();
		Date start = startOfDay.toDate();
		Date end = endOfDay.toDate();
		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andCreatetimeBetween(start, end);
		criteria.andPaystateEqualTo(3);
		List<Orders> orderList = ordersMapper.selectByExample(example);
		for(Orders item:orderList){
			if(item==null) break;
			salaryCount=salaryCount+item.getTotals();
		}
		return salaryCount;
	}
	//获得总的销售额
	public double getTotalSalary() {
		double salaryCount=0.00;
		OrdersExample example = new OrdersExample();
		OrdersExample.Criteria criteria = example.createCriteria();
		criteria.andPaystateEqualTo(3);
		List<Orders> orderList = ordersMapper.selectByExample(example);
		for(Orders item:orderList){
			if(item==null) break;
			salaryCount=salaryCount+item.getTotals();
		}
		return salaryCount;
	}

}
