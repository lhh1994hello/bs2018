//创建时间:2018年4月27日 下午9:36:14 
package com.huat.bs.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Cart;
import com.huat.bs.bean.CartItem;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.Orderitem;
import com.huat.bs.bean.Orders;
import com.huat.bs.bean.User;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.MenuService;
import com.huat.bs.service.OrderService;
import com.huat.bs.util.PayPalBackParam;
import com.huat.bs.util.PaymentUtil;

import cn.itcast.commons.CommonUtils;

@Controller
@SuppressWarnings("all")
public class OrderController {
	
	private Integer pageSizes=3;
	private Integer navigate_page=5;
	
	// 倒计时开始常量
	private static final long COUNTDOWN_TIME = 30*60;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MenuService menuService;

	@Value("${keyValue}")
	private String keyValue;
	
	@Value("${countDownTime}")
	private Integer countDownTime;

	// 根据订单id查询订单
	@RequestMapping(value = "/getOrdersByOid/{oid}", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg getOrdersByOid(@PathVariable(value = "oid") String oid) {
		System.out.println("订单编号" + oid);
		if (StringUtils.isBlank(oid)) {
			return Msg.fail().add("msg", "订单号为空");
		}
		Orders order = orderService.selectOrdersByOid(oid);
		return Msg.Success().add("order", order);
	}

	@RequestMapping("/toConfirmPage")
	public String toConfirmPage(HttpServletRequest request) {
		System.out.println("到订单确认页面");
		return "userpage/order/confirmOrder";

	}

	// 确认收货，感觉写重复了，先不改了
 	@RequestMapping(value="/confirmRec",method={RequestMethod.POST,RequestMethod.GET})
	public String confirmRec(HttpServletRequest request, String oid) {
		System.out.println("确认收货：" + oid);
		try {
			orderService.updateOrderPayState(oid, 3);
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
		}
		return "userpage/public/msg";
	}
	//确认收货，异步请求
 	@ResponseBody
 	@RequestMapping(value="/confirmRecWithAjax",method={RequestMethod.POST,RequestMethod.GET})
 	public Msg confirmRecWithAjax(String oid, @RequestParam(value="paystate",defaultValue="3")Integer paystate){
 		System.out.println("确认收货，异步,订单编号:"+oid+",状态:"+paystate);
 		if(StringUtils.isBlank(oid)){
 			return Msg.fail().add("msg", "请提供要修改的订单ID");
 		}
 		try {
			orderService.updateOrderPayState(oid, 3);
		} catch (UserException e) {
 			//e.printStackTrace();
			String errorInfo = e.getMessage();
			return Msg.fail().add("msg", errorInfo);
		}
 		
 		return Msg.Success().add("msg", "修改成功");
 	}
 	
	// 从我的订单中进行下单
	@RequestMapping("/findOrdersByOid")
	public String findOrdersByOid(HttpServletRequest request, String oid) {
		if(StringUtils.isBlank(oid)){
			request.setAttribute("msg", "参数为空");
			return "userpage/public/msg";
			
		}
		System.out.println("从我的订单列表中下单:" + oid);
		Orders order = orderService.findOrdersByOid(oid);
		request.getSession().setAttribute("order", order);
		return "userpage/order/payMent";
	}

	// 订单页面倒计时刷新 ,produces="text/plain;charset=UTF-8"
	@RequestMapping(value = "/countDown", method = RequestMethod.POST)
	@ResponseBody
	public long CountDown(HttpServletRequest request) {
		
		
		Orders order = (Orders) request.getSession().getAttribute("order");
		if (order == null || order.equals("")) {
			return -100;
		}
		// 获得订单时间
		Date createtime = order.getCreatetime();
		Date currentTime = new Date();
		long timediff = currentTime.getTime() - createtime.getTime();
		timediff = timediff / 1000;
		// 半小时减时间差，倒计时的显示值
		//timediff = COUNTDOWN_TIME - timediff;
		timediff = countDownTime - timediff;
		System.out.println("倒计时测试:"+countDownTime+",timediff:"+timediff);
		return timediff;
	}

	// 查看我的订单，通过用户id查询
	@RequestMapping("/getMyOrders")
	public String getMyOrders(HttpServletRequest request, String uid,@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 用户的Id从Session中获取，管理员调用这个方法时，就传入用户Id
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null || user.equals("")) {
			request.setAttribute("msg", "请先登录");
			return "userpage/user/login";
		}
		uid = user.getuId();
		//分页
		PageHelper.startPage(pn, pageSizes);// 分页，5代表每页显示的条目数量
		List<Orders> ordersList = orderService.getMyOrdersByUid(uid);
		PageInfo pageInfo = new PageInfo(ordersList, navigate_page);
		System.out.println("测试，我的订单:"+pageInfo);
		request.setAttribute("ordersList", ordersList);
		request.setAttribute("pageInfo", pageInfo);
		return "userpage/order/myOrderList";
	}
	
	
	//异步方式获得我的订单
	@ResponseBody
	@RequestMapping(value="/getMyOrdersWithAjax",method={RequestMethod.POST,RequestMethod.GET})
	public Msg getMyOrdersWithAjax(HttpServletRequest request,@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "pageSize", defaultValue = "3") Integer pageSize){
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null || user.equals("")) { 
			System.out.println("尚未登录");
			return Msg.fail().add("msg", "尚未登录");
		}
		String	uid = user.getuId();
		PageHelper.startPage(pn, pageSize);// 分页，5代表每页显示的条目数量
		List<Orders> ordersList = orderService.getMyOrdersByUid(uid);
		PageInfo pageInfo = new PageInfo(ordersList, 5);
		System.out.println("测试异步，我的订单:"+pageInfo);
 		return Msg.Success().add("pageInfo", pageInfo);
	}
	
	// 付款之后易宝回调这个方法
	@RequestMapping(value = "/orderBack")
	public String orderBack(HttpServletRequest request, HttpServletResponse response ,ServletRequest application, PayPalBackParam payPalBack) {
		System.out.println("付款之后的回调函数......................" + payPalBack);
		//User user= (User) request.getSession().getAttribute("session_user");
		//System.out.println("回调后用户登录:"+user);
		boolean callback = PaymentUtil.verifyCallback(payPalBack.getHmac(), payPalBack.getP1_MerId(),
				payPalBack.getR0_Cmd(), payPalBack.getR1_Code(), payPalBack.getR2_TrxId(), payPalBack.getR3_Amt(),
				payPalBack.getR4_Cur(), payPalBack.getR5_Pid(), payPalBack.getR6_Order(), payPalBack.getR7_Uid(),
				payPalBack.getR8_MP(), payPalBack.getR9_BType(), keyValue);

		if (!callback) {
			System.out.println("易宝支付回调校验失败...........................");
			request.setAttribute("msg", "易宝支付回调校验失败");
			return "userpage/public/msg";
		}
		// http://192.168.1.7:8088/onlingOrderSys/orderBack?p1_MerId=10001126856&r0_Cmd=Buy&r1_Code=1&r2_TrxId=868934303852252C&r3_Amt=0.01&r4_Cur=RMB&r5_Pid=&r6_Order=8FB46B307C514C358B6DB5A075C78230&r7_Uid=&r8_MP=&r9_BType=1&ru_Trxtime=20180413215116&ro_BankOrderId=5228763512180413&rb_BankId=CCB-NET&rp_PayDate=20180413215106&rq_CardNo=&rq_SourceFee=0.0&rq_TargetFee=0.0&hmac=3f5386f4107392209667f9d10aa0c2f1&hmac_safe=39a1ef9041bf041de67457a44ca2cb5e
		// 验证成功，修改订单状态
		String r6_Order = payPalBack.getR6_Order();
		System.out.println("回调过来的订单编号:" + r6_Order);
		Integer payState = 1;
		try {
			orderService.updateOrderPayState(r6_Order, payState);
		} catch (UserException e1) {
			request.setAttribute("msg", e1.getMessage());
			return "userpage/public/msg";
		}
		request.setAttribute("msg", "支付成功，等待卖家派送.....");
		// 4.判断当前回调方式，如果是点对点需要回馈以SUCCESS开头的字符串
		if (payPalBack.getR9_BType().equals("2")) {
			try {
				response.getWriter().print("success");
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		Orders order = orderService.selectOrdersByOid(r6_Order);

		if (order == null) {
			request.setAttribute("msg", "有错误了............");
			return "userpage/public/msg";
		}
		List<Orderitem> orderItemList = order.getOrderItemList();
		menuService.updateMenu(orderItemList);
		request.getSession().setAttribute("order", null);
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart != null) {
			cart.clear();
		}
		
		User user= (User) request.getSession().getAttribute("session_user");
		System.out.println("回调后用户登录,在方法结尾2:"+user);
		User fromAppUser= (User) application.getServletContext().getAttribute("application_user");
		System.out.println("从application获得的User："+fromAppUser);
		if(user==null){
			request.getSession().setAttribute("session_user",fromAppUser );
		}
		return "userpage/public/msg";
	}

	// 付款
	@RequestMapping(value = "/payMoney", method = RequestMethod.GET)
	public String payMoney(Orders order, String pd_FrpId, HttpServletResponse response) {
		// 传递过来的有银行编码，就先默认工行,还有订单编号，订单总金额，order里面的参数就只有订单编号，订单总金额
		if (pd_FrpId == null || pd_FrpId.equals("")) {
			pd_FrpId = "CCB-NET-B2C";
		}
		System.out.println("易宝支付....................");
		System.out.println("订单编号:" + order.getOid()+",总金额:" + order.getTotals()+"银行类别:" + pd_FrpId);
  		// pd_FrpId = "CCB-NET-B2C";
		String url = orderService.getURL(order, pd_FrpId);
		System.out.println("URL路径:" + url);
		// https://www.yeepay.com/app-merchant-proxy/node?p0_Cmd=Buy&p1_MerId=10001126856&p2_Order=38E2E68C6FDD40B5A815B43BF5C10DE0&p3_Amt=0.01&p4_Cur=CNY&p5_Pid=&p6_Pcat=&p7_Pdesc=&p8_Url=http://localhost:8080/mybook/orderBack&p9_SAF=&pa_MP=&pd_FrpId=null&pr_NeedResponse=1&hmac=76c3b33e14cb42b8179e5c79a66780cb
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "userpage/public/msg";
	}

	// 确认下单
	@RequestMapping(value = "/confirmOrder")
	public String confirmOrder(Orders form, HttpServletRequest request) {
		// get请求乱码问题
		try {
			form.setAddress(new String(form.getAddress().getBytes("ISO-8859-1"), "UTF-8"));
			form.setNotes(new String(form.getNotes().getBytes("ISO-8859-1"), "UTF-8"));
			form.setUserphone(new String(form.getUserphone().getBytes("ISO-8859-1"), "utf-8"));
			form.setPurchaser(new String(form.getPurchaser().getBytes("ISO-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		System.out.println("生成订单" + form);
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null || cart.equals("")) {
			request.setAttribute("msg", "购物车为空");
			return "userpage/public/msg";
		}
		// 判断是否已经有订单了，如果有就直接去付款页面
		Orders Session_order = (Orders) request.getSession().getAttribute("order");
		if (Session_order != null && !Session_order.equals("")) {
			// 清空购物车
			cart.clear();
			return "userpage/order/payMent";
		}
		// get提交乱码，转码
		if (form.getAddress() == null || form.getAddress().equals("")) {
			request.setAttribute("msg", "不能直接访问，");
			return "userpage/public/msg";
		}

		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null || user.equals("")) {
			request.setAttribute("msg", "还没登录!!!");
			return "userpage/user/login";
		}
		// 接下来开始拼凑订单和订单项
		Orders order = new Orders();// 订单
		order.setUser(user);
		order.setPurchaser(form.getPurchaser());
		order.setUid(user.getuId());
		order.setOid(CommonUtils.uuid().substring(0, 16));// 设置订单id
		BigDecimal totals = new BigDecimal(cart.getTotal());
		order.setTotals(totals.doubleValue());// 订单总金额
		order.setAddress(form.getAddress());
		order.setUserphone(form.getUserphone());
		order.setNotes(form.getNotes());
		order.setCreatetime(new Date());// 订单时间
		order.setPaystate(0);// 支付状态，默认是0，代表未支付，-1代表超时，0：未付款，1:已付款未发货，2:已发货未确认收货，3:确认收货，
		order.setOstate(1);// 暂时用不到，
		// 开始循环拼凑订单项
		List<Orderitem> orderItemList = new ArrayList<Orderitem>();
		// 从购物车中取出商品信息
		Orderitem orderItem = null;
		BigDecimal subTotals = null;
		for (CartItem cartItem : cart.getCartItems()) {
			orderItem = new Orderitem();
			orderItem.setOiid(CommonUtils.uuid().substring(0, 16));// 订单项主键
			orderItem.setCount(cartItem.getCount());// 设置数量
			subTotals = new BigDecimal(cartItem.getSubtotal());
			orderItem.setSubtotal(subTotals.doubleValue());// 设置小计
			// 设置所属订单
			orderItem.setOrder(order);
			orderItem.setOid(order.getOid());
			// 设置所属菜品
			orderItem.setMenu(cartItem.getMenu());
			orderItem.setMid(cartItem.getMenu().getMid());
			long time = new Date().getTime();
			orderItem.setInfo("订单信息:" + time);
			orderItemList.add(orderItem);
		}
		order.setOrderItemList(orderItemList);
		orderService.insertOrder(order,user.getuId());
		request.getSession().setAttribute("order", order);
		// 清空购物车
		cart.clear();
		return "userpage/order/payMent";
	};

}
