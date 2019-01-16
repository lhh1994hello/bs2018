//创建时间:2018年4月27日 下午9:55:40 
package com.huat.bs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.AdminUser;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.AdminUserService;
import com.huat.bs.service.UserService;
import com.huat.bs.util.FtpUtil;
import com.huat.bs.util.NumberUtils;

@Controller
@SuppressWarnings("all")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private AdminUserService adminUserService;
	
	//统计出会员的总数量
	@RequestMapping(value = "/getUserNum", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg getUserNum(){
		long totalNum= userService.getUserNum();
		//System.out.println("会员人数:"+totalNum);
		return Msg.Success().add("totalNum", totalNum);
	}
	
	@RequestMapping(value = "/getTodayRegistNum", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg getTodayRegistNum(){
		long todayRegistNum= userService.getTodayRegistNum();
		//System.out.println("今日注册人数:"+todayRegistNum);
		return Msg.Success().add("todayRegistNum", todayRegistNum);
	}
	
	@RequestMapping(value = "/toRegistPage", method = { RequestMethod.POST, RequestMethod.GET })
	public String toRegistPage() {
		System.out.println("到注册页面...");
		
		return "adminpage/user/regist";
	}



	// 根据用户的状态查找用户列表
	@RequestMapping(value = "/findUserListByState", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg findUserListByState(@RequestParam(value = "uState", defaultValue = "-100") Integer uState,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize, String beginTime, String endTime,
			String stext) {
		System.out.println("页号:" + pn+",pageSize:"+pageSize);
		PageHelper.startPage(pn, pageSize);// pn是页号，
		List<User> userList = userService.findUserList(uState, beginTime, endTime, stext);
		PageInfo pageInfo = new PageInfo(userList, 5);
		return Msg.Success().add("pageInfo", pageInfo);
	}

	// 后台添加图片，实现图片预先上传.回显
	@RequestMapping(value = "/addUserImage", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg addUserImage(MultipartFile file, HttpServletRequest request, User form) throws IOException {
		System.out.println("管理员后台添加用户....");
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
		System.out.println("数据库图片路径:" + form.getImage());
		return Msg.Success().add("user", form);
	}

	// 添加用户，图片之前就已经传上去了,这里只需要保存图片路径
	@RequestMapping(value = "/addUser", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg addUser(User form) {
		System.out.println("表单数据:" + form);
		if (form == null) {
			return Msg.fail().add("msg", "对象为空");
		}
		String uLoginId = form.getuLoginid();
		if (uLoginId == null || uLoginId.equals("")) {
			return Msg.fail().add("msg", "账号为空");
		}

		userService.addUser(form);
		return Msg.Success();
	}

	// 检查账号是否被占用
	@RequestMapping(value = "/findUserByuLoginId", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg findUserByuLoginId(@RequestParam(value = "uLoginid", defaultValue = "") String uLoginid) {
		System.out.println("进来没.....");
		if (StringUtils.isBlank(uLoginid)) {
			return Msg.Warning().add("msg", "参数为空");
		}
		User user = userService.findUserByuLoginid(uLoginid);
		System.out.println("用户:" + user);
		if (user != null) {
			return Msg.fail().add("msg", "账号已被使用!");
		}

		return Msg.Success().add("msg", "成功了...");
	}

	@ResponseBody
	@RequestMapping(value = "/findUserByEmail", method = { RequestMethod.POST, RequestMethod.GET })
	public Msg findUserByEmail(@RequestParam(value = "uEmail", defaultValue = "") String uEmail) {
		uEmail = uEmail.trim();
		if (StringUtils.isBlank(uEmail)) {
			return Msg.Warning().add("msg", "参数为空!");
		}
		System.out.println("校验邮箱是否已经存在了..." + uEmail);
		User user = userService.findUserByEmail(uEmail);
		System.out.println("查询结果:" + user);
		if (user != null) {
			return Msg.fail().add("msg", "邮箱已被使用!");
		}
		return Msg.Success();
	}

	// 后台执行假删除的方法
	@ResponseBody
	@RequestMapping(value = "/updateUserState", method = { RequestMethod.GET, RequestMethod.POST,
			RequestMethod.DELETE })
	public Msg deleteUserWithFalse(@RequestParam(value = "uId") String uId, Integer uState) {
		if (StringUtils.isBlank(uId)) {
			return Msg.fail().add("msg", "参数为空!!!");
		}
		System.out.println("假删除" + uId);
		if (uId.contains("-")) {
			// 批量删除
			List<String> uIdList = new ArrayList<String>();
			String[] uId_split = uId.split("-");
			for (String u : uId_split) {
				uIdList.add(u);
			}
			userService.deleteBatchWithFalse(uIdList, uState);
		} else {
			System.out.println("单个假删除...");
			userService.deleteUserByIdWithFalse(uId, uState);
		}

		return Msg.Success();
	}

	// 管理员修改用户密码
	@ResponseBody
	@RequestMapping(value = "/changePassword", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg changePassword(User form) {
		System.out.println("管理员修改用户密码:" + form);
		String uPassword = form.getuPassword();
		String uRePassword = form.getuRePassword();
		if (StringUtils.isBlank(uPassword) || StringUtils.isBlank(uRePassword)) {
			return Msg.fail().add("msg", "密码为空!!!");
		}
		if (!uPassword.equals(uRePassword)) {
			return Msg.fail().add("msg", "两次输入的密码不一致");
		}
		User user = userService.changePassword(form);
		String password = user.getuPassword();
		if (!password.equals(form.getuPassword())) {
			return Msg.Success().add("msg", "密码修改失败");
		}
		return Msg.Success();
	}

	// 后台修改用户信息
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg updateUserInfo(User user) {
		System.out.println("修改用户信息:" + user);
		userService.updateUserInfo(user);
		return Msg.Success();
	}

	@RequestMapping(value = "/findUserByUid", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg findUserByUid(@RequestParam(value = "uId", defaultValue = "-100") String uId) {
		if (StringUtils.isBlank(uId)) {
			return Msg.fail().add("msg", "ID不能为空");
		}
		if (uId.equals("-100")) {
			return Msg.fail().add("msg", "请输入有效的用户ID");
		}
		User user = userService.findUserByID(uId);
		return Msg.Success().add("user", user);
	}

	// 后台查询会员列表
	@RequestMapping(value = "/findUserList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg findUserList(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
			@RequestParam(value = "uState", defaultValue = "-100") Integer uState, String beginTime, String endTime,
			String stext) {
		System.out.println("显示用户列表pageSize:"+pageSize);
		PageHelper.startPage(pn, pageSize);// pn是页号，
		List<User> userList = userService.findUserList(uState, beginTime, endTime, stext);
		System.out.println("用户列表：" + userList);
		PageInfo pageInfo = new PageInfo(userList, 5);
		System.out.println("查询出的数据pageInfo:"+pageInfo);
		return Msg.Success().add("pageInfo", pageInfo);
	}

	// 更新用户状态
	@RequestMapping(value = "/test123", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Msg updateUserState(@RequestParam(value = "uId", defaultValue = "") String uId,
			@RequestParam(value = "uState", defaultValue = "-100") Integer uState) {
		System.out.println("修改用户状态" + uId + ",状态:" + uState);
		if (StringUtils.isBlank(uId)) {
			return Msg.fail().add("msg", "请给出用户ID");
		}
		if (uState == -100) {
			return Msg.fail().add("msg", "请给出状态");
		}
		User user = new User();
		user.setuId(uId);
		user.setuState(uState);
		try {
			userService.updateUserState(user);
		} catch (UserException e) {
			// e.printStackTrace();
			return Msg.fail().add("msg", e.getMessage());
		}
		return Msg.Success().add("msg", "修改成功");
	}

	// 保存文件
	public void savaFile(MultipartFile file, HttpServletRequest request, String filename) throws IOException {
		// 获得相对路径
		String realPath = request.getSession().getServletContext().getRealPath("/images/head");
		InputStream is = file.getInputStream();
		byte[] bs = new byte[1024];
		int len = 0;
		// 获得项目所在的绝对路径
		String absolutepath = "D:/Java/Data-Mar3/onlingOrderSys/src/main/webapp/images/head";
		OutputStream os = new FileOutputStream(absolutepath + "/" + filename);// 往项目下上传图片
		OutputStream os_Tomcat = new FileOutputStream(new File(realPath + "/" + filename));// 往tomcat下上传图片
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
			os_Tomcat.write(bs, 0, len);
		}
		os.flush();
		os_Tomcat.flush();
		os_Tomcat.close();
		os.close();
		is.close();
	}
}
