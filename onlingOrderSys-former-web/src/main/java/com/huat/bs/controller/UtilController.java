//创建时间:2018年4月27日 下午9:43:37 
package com.huat.bs.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.huat.bs.bean.User;

import cn.itcast.vcode.utils.VerifyCode;

@Controller
public class UtilController {
	@RequestMapping("/test1")
	public String test1(HttpServletRequest request){
		User user=new User();
		user.setuNickname("这是昵称");
		request.getSession().setAttribute("user", user);
		return "userpage/test/test1";
	}
	
	
	// 自己实现的验证码
	@ResponseBody
	@RequestMapping("/verifCode")
	public String verifCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		System.out.println("验证码:" + vc.getText());
		request.getSession().setAttribute("verifCode", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
		return null;
	}

	private Producer kaptchaProducer = null;

	@Autowired
	public void setCaptchaProducer(Producer kaptchaProducer) {
		this.kaptchaProducer = kaptchaProducer;
	}

	@RequestMapping("/kaptcha")
	@ResponseBody
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");
		String capText = kaptchaProducer.createText();
		request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		BufferedImage bi = kaptchaProducer.createImage(capText);
		ServletOutputStream out = null;
		try {
			out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
		} catch (IOException e) {
			e.printStackTrace();
		}

		try {
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
