package com.huat.bs.util;



//创建时间�?2018�?3�?28�?,下午10:38:44

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	/***
	 * MD5加密 生成32位md5�?
	 * 
	 * @param 待加密字符串
	 * @return 返回32位md5�?
	 */
	public static String md5Encode(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}

		byte[] byteArray = null;
		try {
			byteArray = inStr.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
	// 加盐
	public static String md5Encode(String psd, String salt) {
		try {
			StringBuffer stingBuffer = new StringBuffer();
			// 1.指定加密算法
			MessageDigest digest = MessageDigest.getInstance("MD5");
			// 2.将需要加密的字符串转化成byte类型的数据，然后进行哈希过程
			byte[] bs = digest.digest((psd + salt).getBytes());
			// 3.遍历bs,让其生成32位字符串，固定写�?

			// 4.拼接字符�?
			for (byte b : bs) {
				int i = b & 0xff;
				String hexString = Integer.toHexString(i);
				if (hexString.length() < 2) {
					hexString = "0" + hexString;
				}
				stingBuffer.append(hexString);
			}
			return stingBuffer.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
}
