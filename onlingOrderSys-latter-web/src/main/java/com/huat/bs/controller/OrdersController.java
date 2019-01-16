//创建时间:2018年4月27日 下午9:58:28 
package com.huat.bs.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.Orders;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.MenuService;
import com.huat.bs.service.OrderService;
import com.huat.bs.util.NumberUtils;

@Controller
@SuppressWarnings("all")
public class OrdersController {
	// 倒计时开始常量
	private static final long COUNTDOWN_TIME = 30;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MenuService menuService;

	@Value("${keyValue}")
	private String keyValue;
	
	
	//管理员对付款后的订单发货
	@RequestMapping(value = "/sendGoods/{oid}", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg sendGoods(@PathVariable(value="oid")String oid){
		System.out.println("发货，订单编号:"+oid);
		try {
			orderService.updateOrderPayState(oid, 2);
		} catch (UserException e) {
			String message = e.getMessage();
			return Msg.fail().add("msg", message);
			//e.printStackTrace();
		}
		return Msg.Success().add("msg", "状态修改成功");
	}
	//总销售额
	@RequestMapping(value = "/getTotalSalary", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg getTotalSalary(){
		double totalSalary=orderService.getTotalSalary();
		return Msg.Success().add("totalSalary", totalSalary);
	}
	//获得今日销售额
	@RequestMapping(value = "/getTodaySalary", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg getTodaySalary(){
		double todaySalay=orderService.getTodaySalary();
		return Msg.Success().add("todaySalay", todaySalay);
	}
	//getTodayOrderNum
	@RequestMapping(value = "/getTodayOrderNum", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg getTodayOrderNum(){
		long todayOrderNum=orderService.getTodayOrderNum();
		return Msg.Success().add("todayOrderNum", todayOrderNum);
	}
	//查询订单总数量
	@RequestMapping(value = "/geOrderNum", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg geOrderNum(){
		long totalNum=orderService.geOrderNum();
		return Msg.Success().add("totalNum", totalNum);
	}
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

	// 后台应用，订单操作，根据payState查询订单
	@RequestMapping(value = "/getOrderByPayState", method = RequestMethod.GET)
	public String getOrderByPayState(@RequestParam(value = "paystate", defaultValue = "-100") Integer paystate,
			HttpServletRequest request) {
		System.out.println("订单状态码:" + paystate);
		List<Orders> orderList = orderService.selectOrderListByPaystate(paystate);
		request.setAttribute("orderList", orderList);
		// return "adminpage/order/orderList";
		return "adminpage/order/orderList";
	}

	// 导出当前页面数据到Excel
	@ResponseBody
	@RequestMapping(value = "/ImportThisPageToExcel", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg ImportThisPageToExcel(@RequestParam(value = "oidList", defaultValue = "") String oidList,
			HttpServletResponse response) throws IOException {
		// response.setContentType("application/x-msdownload");
		System.out.println("导出当前页面...");
		if (StringUtils.isBlank(oidList)) {
			return Msg.fail().add("msg", "参数为空");
		}
		String[] oidArray = oidList.split("-");
		List<String> oids = new ArrayList<String>();
		for (String str : oidArray) {
			oids.add(str);
		}
		// 标题，路径，
		List<Orders> orderList = orderService.getOrderListByOidList(oids);
		String numberStr = NumberUtils.getImageName().substring(0, 14);
		String sheetName = "订单_" + numberStr;
		HSSFWorkbook wb = orderService.getHSSFWorkbook(orderList, sheetName);
		String fileName = "myOrder_" + numberStr + ".xls";
		OutputStream os = new FileOutputStream("D:/myexcel/currentPage/" + fileName);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		System.out.println("测试:" + wb);
		wb.write(bos);
		bos.flush();
		bos.close();

		return Msg.Success().add("msg", "导出成功!!!");
	}

	// 导出数据到Excel中
	@ResponseBody
	@RequestMapping(value = "/ImportDataToExcelByCondition", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg ImportDataToExcelByCondition(@RequestParam(value = "paystate", defaultValue = "-100") Integer paystate,
			HttpServletRequest request, @RequestParam(value = "beginTime", defaultValue = "") String beginTime,
			@RequestParam(value = "endTime", defaultValue = "") String endTime,
			@RequestParam(value = "stext", defaultValue = "") String stext) throws IOException {
		List<Orders> orderList = orderService.selectOrderListByPaystate(paystate, beginTime, endTime, stext);
		String numberStr = NumberUtils.getImageName().substring(0, 14);

		String sheetName = "订单_" + numberStr;
		HSSFWorkbook wb = orderService.getHSSFWorkbook(orderList, sheetName);
		String fileName = "myOrder_" + numberStr + ".xls";
		OutputStream os = new FileOutputStream("D:/myexcel/byCondition/" + fileName);
		BufferedOutputStream bos = new BufferedOutputStream(os);
		System.out.println("测试:" + wb);
		wb.write(bos);
		bos.flush();
		bos.close();
		return Msg.Success().add("msg", "导出所有符合条件的");
	}

	// 后台应用，订单操作，根据payState查询订单
	@ResponseBody
	@RequestMapping(value = "/getOrderByPayStateWithAjax", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg getOrderByPayStateWithAjax(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "paystate", defaultValue = "-100") Integer paystate, HttpServletRequest request,
			@RequestParam(value = "beginTime", defaultValue = "") String beginTime,
			@RequestParam(value = "endTime", defaultValue = "") String endTime,
			@RequestParam(value = "stext", defaultValue = "") String stext,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
		System.out.println("通过AJAX调用..." + "页号:" + pn + ",订单状态:" + paystate);
		PageHelper.startPage(pn, pageSize);// pn是页号，
		List<Orders> orderList = orderService.selectOrderListByPaystate(paystate, beginTime, endTime, stext);
		PageInfo pageInfo = new PageInfo(orderList, 5);
		return Msg.Success().add("pageInfo", pageInfo);
	}

}
