package com.huat.bs.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyuncs.exceptions.ClientException;
import com.huat.bs.bean.Cart;
import com.huat.bs.bean.Collects;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.CollectService;
import com.huat.bs.service.UserService;
import com.huat.bs.util.FtpUtil;
import com.huat.bs.util.NumberUtils;
import com.huat.bs.util.SMSUtil;

/**
 * 
 * @author lihonghui 前台用户
 */
@Controller
@SuppressWarnings("all")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private CollectService collectService;

	// 检查邮件是否过期
	@RequestMapping(value = "/emailcallback", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg emailcallback(HttpServletRequest request, String uId) {
		System.out.println("检查邮件是否过期...");
		if (StringUtils.isBlank(uId))
			return Msg.fail().add("msg", "参数为空");
		System.out.println("参数;" + uId);
		long sendEmailTime = (long) request.getSession().getAttribute("sendEmailTime");
		System.out.println("发送时间:" + sendEmailTime);
		long currentTime = System.currentTimeMillis();
		long timeDiff = currentTime - sendEmailTime;
		// 设置邮件5分钟有效5*60*1000
		if (timeDiff > 300000) {
			System.out.println("是否超时.");
			return Msg.fail().add("msg", "邮件已经过期了");
		}
		User user = userService.findUserByID(uId);
		if (user == null)
			return Msg.fail().add("msg", "账号不存在");
		return Msg.Success().add("user", user);
	}

	// 到忘记密码页面
	@RequestMapping(value = "/toForgetPassword", method = { RequestMethod.GET, RequestMethod.POST })
	public String toForgetPassword(HttpServletRequest request) {
		return "userpage/user/forgetPassword";
	}

	// 到登录页面
	@RequestMapping(value = "/toLoginPage")
	public String toLoginPage(String msg, HttpServletRequest request) {
		request.setAttribute("msg", "请先登录");
		return "userpage/user/login2";
	}

	// 校验手机是否正确验证码
	@RequestMapping(value = "/checkPhoneRandom", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg checkPhoneRandom(String phoneCode, HttpServletRequest request) {
		System.out.println("比较验证码:" + phoneCode);
		if (StringUtils.isBlank(phoneCode))
			return Msg.fail().add("msg", "参数为空");

		String randomCode = (String) request.getSession().getAttribute("randomCode");
		if (randomCode == null)
			return Msg.fail().add("msg", "操作失败");
		long sendTime = (long) request.getSession().getAttribute("sendTime");
		long currentTime = System.currentTimeMillis();
		long timediff = currentTime - sendTime;
		if (!randomCode.equals(phoneCode))
			Msg.fail().add("msg", "验证码不对");
		if (timediff > 300000)
			Msg.fail().add("msg", "验证码已失效");
		return Msg.Success().add("msg", "校验成功");
	}

	// 发送验证码
	@RequestMapping(value = "/transmitVerificationCode", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg transmitVerificationCode(String uPhone, String uId, HttpServletRequest request) throws ClientException {
		System.out.println("准备发送验证码");
		System.out.println("手机号：" + uPhone + "，主键:" + uId);
		int len = uPhone.length();
		if (len != 11)
			return Msg.fail().add("msg", "手机位数不足");
		User user = userService.sendPhoneCode(uId, uPhone);
		if (user == null)
			return Msg.fail().add("msg", "预留手机不一致");
		// 在这里发送手机验证码
		String randomCode = SMSUtil.sendPhoneCode(uPhone);
		if (randomCode != null) {
			System.out.println("验证码是:" + randomCode);
			long sendTime = System.currentTimeMillis();
			request.getSession().setAttribute("randomCode", randomCode);
			request.getSession().setAttribute("sendTime", sendTime);
			return Msg.Success().add("msg", "发送成功");
		}
		return Msg.fail().add("msg", "验证码发送失败");
	}

	// 通过邮箱修改重置密码
	@RequestMapping(value = "/backPasswordByEmail", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg backPasswordByEmail(String uEmail, String uId, HttpServletRequest request) {
		System.out.println("通过邮箱修改密码:" + uEmail + ",uId:" + uId);
		if (StringUtils.isBlank(uId) || StringUtils.isBlank(uEmail))
			return Msg.fail().add("msg", "参数为空");
		String contextPath = request.getContextPath();
		int localPort = request.getLocalPort();
		// System.out.println("端口号:"+localPort);
		// System.out.println("项目名:"+contextPath);
		User selectUser = userService.findUserByEmail(uEmail);
		if (selectUser == null)
			return Msg.fail().add("msg", "邮箱不存在");
		if (!selectUser.getuId().equals(uId))
			return Msg.fail().add("msg", "与预留邮箱不一致");
		User user = userService.sendEmail(uId, uEmail, localPort, contextPath);
		if (user == null)
			return Msg.fail().add("msg", "发送失败");
		long activeTime = user.getActiveTime();// 这个是邮件发送的时间，保存到session中
		request.getSession().setAttribute("sendEmailTime", activeTime);
		return Msg.Success();
	}

	// 找回密码，按密保问题找回
	@RequestMapping(value = "/backPasswordByMibao", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg backPasswordByMibao(String inputContext, String uSafequest, String uSafeanswer) {
		if (StringUtils.isBlank(inputContext) || StringUtils.isBlank(uSafequest) || StringUtils.isBlank(uSafeanswer)) {
			return Msg.fail().add("msg", "参数为空");
		}
		User user = userService.backPasswordByMibao(inputContext, uSafequest, uSafeanswer);
		System.out.println("按密保问题修改:" + user);
		if (user == null)
			return Msg.fail().add("msg", "验证失败");
		return Msg.Success().add("user", user);
	}

	// 找回密码后设置新密码
	@RequestMapping(value = "/setNewPassword", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg setNewPassword(String uLoginid, String uPassword, String uRePassword) {
		if (StringUtils.isBlank(uLoginid) || StringUtils.isBlank(uPassword) || StringUtils.isBlank(uRePassword)) {
			return Msg.fail().add("msg", "参数为空");
		}
		if (!uPassword.equals(uRePassword)) {
			return Msg.fail().add("msg", "两次密码不同");
		}
		User user = userService.setNewPassword(uLoginid, uPassword);
		if (user == null)
			return Msg.fail().add("msg", "没有找打用户");
		return Msg.Success().add("msg", "密码修改成功");
	}

	// 找回密码前先查找有关信息
	@RequestMapping(value = "/findUserInfoByInputContext", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg findUserInfoByInputContext(
			@RequestParam(value = "inputContext", defaultValue = "") String inputContext) {
		System.out.println("传入的参数:" + inputContext);
		if (StringUtils.isBlank(inputContext))
			return Msg.fail().add("msg", "传入的参数为空");
		User user = userService.findUserByInputContext(inputContext);
		if (user == null)
			return Msg.fail().add("msg", "账号不存在");
		return Msg.Success().add("user", user);
	}

	// 更新个人资料
	@RequestMapping(value = "/updateMyInfo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg updateMyInfo(User form, HttpServletRequest request) {
		System.out.println("数据:" + form);
		User selectUser = (User) request.getSession().getAttribute("session_user");
		if (selectUser == null) {
			return Msg.fail().add("msg", "尚未登录");
		}
		userService.updateUserInfo(form);
		return Msg.Success();
	}

	// 检查邮箱有没有被其他人使用
	@RequestMapping(value = "/checkEmailIsUserByOther", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg checkEmailIsUserByOther(HttpServletRequest request, String uEmail) {
		System.out.println("个人中心:检查邮箱有没有被他人使用:" + uEmail);
		User user = (User) request.getSession().getAttribute("session_user");
		if (StringUtils.isBlank(uEmail))
			return Msg.Warning().add("msg", "参数为空");
		if (user == null)
			return Msg.Warning().add("msg", "尚未登录");

		User selectUser = userService.findUserByEmail(uEmail);
		// 当查询不为空，比较是不是该用户的邮箱
		if (selectUser != null) {
			String selectUid = selectUser.getuId();
			String sessionUid = user.getuId();
			if (!selectUid.equals(sessionUid))
				return Msg.fail().add("msg", "邮箱已被别人使用");
		}

		return Msg.Success().add("msg", "可以使用");
	}

	// 检查手机有没有被其他人使用
	@RequestMapping(value = "/checkPhoneIsUserByOther", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg checkPhoneIsUserByOther(HttpServletRequest request, String uPhone) {
		System.out.println("个人中心:检查手机有没有被他人使用:" + uPhone);
		User user = (User) request.getSession().getAttribute("session_user");
		if (StringUtils.isBlank(uPhone))
			return Msg.Warning().add("msg", "参数为空");
		if (user == null)
			return Msg.Warning().add("msg", "尚未登录");

		User selectUser = userService.findUserByPhone(uPhone);
		// 当查询不为空，比较是不是该用户的邮箱
		if (selectUser != null) {
			String selectUid = selectUser.getuId();
			String sessionUid = user.getuId();
			if (!selectUid.equals(sessionUid))
				return Msg.fail().add("msg", "手机已被别人使用");
		}
		return Msg.Success().add("msg", "可以使用");
	}

	// 获得用户个人信息
	@RequestMapping(value = "/fillMyDetailMsgInfo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg fillMyDetailMsgInfo(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			System.out.println("用户查看个人信息时，没有登录");
			return Msg.fail().add("msg", "用户尚未登录");
		}
		User selectUser = userService.findUserByID(user.getuId());
		return Msg.Success().add("user", selectUser);
	}

	// 修改密码
	@RequestMapping(value = "/changePassword", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg changePassword(@RequestParam(value = "oldPassword", defaultValue = "") String oldPassword,
			@RequestParam(value = "newPassword", defaultValue = "") String newPassword,
			@RequestParam(value = "rePassword", defaultValue = "") String rePassword, HttpServletRequest request) {
		System.out.println(
				"输入的参数:" + "oldPassword:" + oldPassword + ",newPassword:" + newPassword + ",rePassword:" + rePassword);

		if (StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword) || StringUtils.isBlank(rePassword)) {
			return Msg.fail().add("msg", "参数为空");
		}
		if (!newPassword.equals(rePassword)) {
			return Msg.fail().add("msg", "密码和确认密码不一致");
		}
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			return Msg.fail().add("msg", "用户还没登录");
		}
		System.out.println("用户数据:" + user);
		String password = user.getuPassword();
		System.out.println("原来的密码:" + password + "输入的原密码:" + oldPassword);
		if (!password.equals(oldPassword)) {
			return Msg.Warning().add("msg", "原密码不正确");
		}
		// 开始修改密码
		user.setuPassword(newPassword);
		userService.changePassword(user);
		return Msg.Success().add("msg", "密码修改成功");
	}

	// 根据用户Id获得用户数据
	@RequestMapping(value = "/findUserInfo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg findUserInfo(HttpServletRequest request) {
		System.out.println("当页面加载完成后显示用户信息.....");
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			return Msg.fail().add("msg", "尚未登录");
		}
		User selectUser = userService.findUserByID(user.getuId());
		System.out.println("查询出来的用户:" + selectUser);
		return Msg.Success().add("user", selectUser);
	}

	// 前台用户修改头像
	@RequestMapping(value = "/changeUserImage", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg addUserImage(MultipartFile file, HttpServletRequest request, User form) throws IOException {
		System.out.println("前台用户修改头像....");
		if (file == null) {
			System.out.println("file为空了...");
			return Msg.fail();
		}
		String filename = file.getOriginalFilename();
		// 判断上传的文件是否是图片，通过后缀名判断，
		// boolean suffixFlag = judgeImageSuffix(filename);
		boolean suffixFlag = NumberUtils.judgeImageSuffix(filename);
		if (!suffixFlag) {
			return Msg.fail().add("msg", "上传的不是图片");
		}
		filename = NumberUtils.getImageName() + "_" + filename;
		// savaFile(file,request,filename);
		FtpUtil.uploadFile("localhost", 21, "ftp", "123", "/", "/headImage/", filename, file.getInputStream());
		form.setImage("http://localhost/headImage/" + filename);
		// form.setImage(request.getContextPath() + "/" + "images" + "/" +
		// "head" + "/" + filename);
		// 把图片路径存到数据库中
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			return Msg.fail().add("msg", "用户尚未登录");
		}
		user.setImage(form.getImage());
		userService.updateUserInfo(user);
		System.out.println("数据库图片路径:" + form.getImage());
		return Msg.Success().add("user", form);
	}

	// 前台判断用户是否登录userIsLogin
	@ResponseBody
	@RequestMapping(value = "/userIsLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public Msg userIsLogin(HttpServletRequest request) {
		// session_user
		User user = (User) request.getSession().getAttribute("session_user");
		System.out.println("用户:" + user);
		if (user == null) {
			return Msg.fail().add("msg", "用户尚未登录");
		}
		return Msg.Success().add("msg", "用户已经登录");
	}

	// 用户登录
	@RequestMapping("/login")
	public String login(User form, HttpServletRequest request, ServletRequest application) {
		String verifCode = (String) request.getSession().getAttribute("verifCode");
		System.out.println("verifCode1:" + verifCode + ",verifCode2:" + form.getVerifCode());
		if (!verifCode.equalsIgnoreCase(form.getVerifCode())) {
			System.out.println("验证码错误");
			request.setAttribute("form", form);
			request.setAttribute("msg", "验证码错误2!");
			return "userpage/user/login2";
		}
		// t1.start();
		String uloginId = form.getuLoginid();
		if (uloginId == null || uloginId.equals("")) {
			request.setAttribute("msg", "用户名为空");
			return "userpage/user/login2";
		}
		try {
			User user = userService.login(form);
			// 把登录用户的信息放到session域中，用来判断用户是否登录，进行拦截
			request.getSession().setAttribute("session_user", user);
			System.out.println("application:" + application);
			if (application != null) {
				application.getServletContext().setAttribute("application_user", user);
				User userTest = (User) application.getServletContext().getAttribute("application_user");
				System.out.println("全局域：" + userTest);
			}

			// 购物车，用session保存
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			if (cart == null || cart.equals("")) {
				// 防止刷新，删除已经存在的内容
				request.getSession().setAttribute("cart", new Cart());
			}
			countApplciatonNum(request);
		} catch (UserException e) {
			// e.printStackTrace();
			request.setAttribute("uLoginid", form.getuLoginid());
			request.setAttribute("msg", e.getMessage());
			return "userpage/user/login2";
		}

		return "userpage/main";
	}

	// 记录网站访问次数
	public void countApplciatonNum(HttpServletRequest request) {
		String urlAll = request.getScheme() + "://" + request.getServerName() + request.getRequestURI();// +
																										// "?"+
																										// request.getQueryString();
		String requestURI = request.getRequestURI();
		System.out.println("requestURL:" + requestURI);
		System.out.println("次数，路径:" + urlAll);
		int length = 0;
		byte[] buffer = new byte[1024];
		try {
			InputStream is = new FileInputStream(urlAll + "b.txt");
			// OutputStream os=new FileOutputStream("a.txt");
			is.read(buffer, 0, 2048);
			String str = new String(buffer, 0, length);
			System.out.println("文件内容:" + str);
		} catch (Exception e) {
			System.out.println("文件操作出错.............");
			// e.printStackTrace();

		}

	}

	// 用户退出
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request) {
		System.out.println("退出登录");
		request.getSession().invalidate();
		return "userpage/main";
	}

	// 用户注册
	@RequestMapping("/regist")
	public String regist(User form, HttpServletRequest request) {
		System.out.println("用户注册：");
		System.out.println("user:" + form);
		try {
			userService.regist(form);
			request.setAttribute("msg", "注册成功，请马上到邮箱激活");
		} catch (UserException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
		}
		return "userpage/public/msg";
	}

	// 用户激活
	@RequestMapping("/active")
	public String active(@RequestParam(value = "uActivaecode") String uActivaecode, HttpServletRequest request) {
		System.out.println("用户激活..........");
		try {
			userService.active(uActivaecode);
			request.setAttribute("msg", "用户激活成功");
		} catch (UserException e) {
			// e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
		}
		return "userpage/public/msg";
	}

	// 判断用户是否收藏了这道菜
	@ResponseBody
	@RequestMapping(value = "/judgeUserIsCollect", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg judgeUserIsCollect(@RequestParam(value = "mid", defaultValue = "") String mid,
			HttpServletRequest request) {
		if (StringUtils.isBlank(mid)) {
			return Msg.fail().add("msg", "参数为空");
		}
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			return Msg.fail().add("msg", "尚未登录");
		}
		List<Collects> collectList = collectService.findUserCollectList(user.getuId());
		for (Collects c : collectList) {
			if (c == null)
				break;
			String semid = c.getMid();
			Integer state = c.getCstate();// 设置1状态是有效的，当取消收藏相当于设置状态为0；
			if (mid.equals(semid)) {
				if (state == 1) {
					String cid = c.getCid();
					System.out.println("哈哈，这道菜被收藏了................");
					return Msg.Success().add("msg", cid);
				}
				if (state == 0) {
					String cid = c.getCid();
					System.out.println("哎哎，这道菜取消被收藏了*************");
					return Msg.fail().add("msg", cid);
				}
			}

		}
		return Msg.fail().add("msg", "-100");
	}

}
