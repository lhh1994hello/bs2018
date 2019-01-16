package com.test;

import org.junit.Test;

import com.huat.bs.util.IPUtil;

public class TestIP {
	@Test
	public void fun1(){
		String computerIP = IPUtil.getComputerIP();
		System.out.println("本机IP:"+computerIP);
	}
}
