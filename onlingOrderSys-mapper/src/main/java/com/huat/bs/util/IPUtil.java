package com.huat.bs.util;



//创建时间�?2018�?4�?13�?,下午9:04:43

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.MessageFormat;

import org.junit.Test;

@SuppressWarnings("all")
public class IPUtil {
	// 获得本机IP
	public static String getComputerIP() {
		InetAddress myip=null;
		try {
			myip = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			//e.printStackTrace();
			throw new RuntimeException(e);
		};
		String hostAddress = myip.getHostAddress();
		if (hostAddress == null || hostAddress.equals("")) {
			hostAddress = "127.0.0.1";
		}
		return hostAddress;
	}

	@Test
	public void fun1() {
		String str = "{0}或{1}错误";
		String format = MessageFormat.format(str, "用户�?", "密码");
		System.out.println(format);
		System.out.println(getComputerIP());
		System.out.println("##################");
	}
	public static void main(String[] args) {
		System.out.println(getComputerIP());
	}
}
