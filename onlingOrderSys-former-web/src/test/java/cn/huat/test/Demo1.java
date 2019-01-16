//创建时间:2018年5月25日下午1:11:43
//用户:lihonghui
package cn.huat.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.Orders;
import com.huat.bs.bean.User;
import com.huat.bs.service.OrderService;
@SuppressWarnings("all")
public class Demo1 {
	private OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value="/getMyOrdersWithAjax")
	public Msg getMyOrdersWithAjax(HttpServletRequest request,
			Integer pn, Integer pageSize){
	User user = (User) request.getSession()
				.getAttribute("session_user");
	if (user == null || user.equals(""))  
		return Msg.fail().add("msg", "尚未登录");
	String	uid = user.getuId();
	PageHelper.startPage(pn, pageSize);// 分页，5代表每页显示的条目数量
	//根据用户ID查询用户订单
	List<Orders> ordersList = orderService.getMyOrdersByUid(uid);
	PageInfo pageInfo = new PageInfo(ordersList, 5);
  	return Msg.Success().add("pageInfo", pageInfo);
	}
}
