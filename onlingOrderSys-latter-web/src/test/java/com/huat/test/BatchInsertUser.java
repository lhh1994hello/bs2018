package com.huat.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;

import org.junit.Test;

import com.huat.bs.bean.User;

import cn.itcast.commons.CommonUtils;

public class BatchInsertUser {
	private String url = "jdbc:mysql://localhost:3306/mybs2?rewriteBatchedStatements=true&characterEncoding=utf-8";

	private String driverClass = "com.mysql.jdbc.Driver";
	private String username = "root";
	private String password = "123456";

	@Test
	public void fun1() throws Exception {
		Class.forName(driverClass);
		Connection conn = DriverManager.getConnection(url, username, password);
		String sql = "insert into my_user value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		User user = new User();
		for (int i = 0; i <= 3; i++) {
			/*
			 * String uuid = CommonUtils.uuid().substring(0, 8);
			 * pstm.setString(1, uuid+"_"+i); pstm.setString(2, "张三_"+i);
			 * pstm.setInt(3, i%100); pstm.setString(4, i%2==0?"男":"女");
			 * pstm.addBatch();
			 */
			String uuid = CommonUtils.uuid().substring(0, 8);
			user.setuId(uuid);
			user.setuLoginid(uuid + "_" + i);
			user.setuNickname("昵称_" + i);
			user.setuPassword("0000");
			user.setuEmail(uuid +i + "_"  + "@163.com");
			user.setuSex(i % 2 == 0 ? "男" : "女");
			user.setuActivaecode(uuid);
			user.setuState(1);
			user.setuRegisttime(new Date());
			user.setuLogintime(new Date());
			user.setuPhone("15872635288");
			user.setuScore(0);
			user.setuBalance(0.0);
			user.setuSafequest("0000");
			user.setuSafeanswer("0000");
			user.setuAddress("天涯海角");
			user.setFirstordertime(new Date());
			user.setBuycount(0);
			
			//头像
			
			user.setImage("http://localhost/headImage/201804280916036143_t6.jpg");
			user.setIntroduce("介绍_"+i);
			// *******************************
			pstm.setString(1, user.getuId());
			pstm.setString(2, user.getuLoginid());
			pstm.setString(3, user.getuNickname());
			pstm.setString(4, user.getuPassword());
			pstm.setString(5, user.getuEmail());
			pstm.setString(6, user.getuSex());
			pstm.setString(7, user.getuActivaecode());
			pstm.setInt(8, user.getuState());
			pstm.setObject(9, user.getuRegisttime());
			pstm.setObject(10, user.getuLogintime());
			pstm.setString(11, user.getuPhone());
			pstm.setInt(12, user.getuScore());
			pstm.setDouble(13, user.getuBalance());
			pstm.setString(14, user.getuSafequest());
			pstm.setString(15, user.getuSafeanswer());
			pstm.setString(16, user.getuAddress());
			pstm.setObject(17, user.getFirstordertime());
			pstm.setInt(18, user.getBuycount());
			pstm.setString(19, user.getImage());
			pstm.setString(20, user.getIntroduce());
			pstm.addBatch();
		}
		long start = System.currentTimeMillis();
		pstm.executeBatch();// 执行
		long end = System.currentTimeMillis();
		long min = end - start;
		System.out.println("时间:" + min);
	}
}
