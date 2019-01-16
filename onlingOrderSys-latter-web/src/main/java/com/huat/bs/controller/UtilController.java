//创建时间:2018年4月28日 下午2:30:06 
package com.huat.bs.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.vcode.utils.VerifyCode;

@Controller
public class UtilController {
	
	
	
	
	// 自己实现的验证码
	@ResponseBody
	@RequestMapping("/verifCode")
	public String verifCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		//System.out.println("后台,验证码:" + vc.getText());
		request.getSession().setAttribute("verifCode", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
		String text = vc.getText();
		System.out.println("后台验证码:"+text);
		return null;
	}
}
