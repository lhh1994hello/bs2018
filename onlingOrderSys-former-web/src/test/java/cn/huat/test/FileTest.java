//创建时间:2018年5月16日下午11:30:18
//用户:lihonghui
package cn.huat.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.junit.Test;

public class FileTest {
	@Test
	public void fun1() throws IOException{
		File file=new File("a.txt");
		
		/*OutputStream os=new FileOutputStream(file);
		String str="sdfsdf";
		os.write(str.getBytes());
		os.close();*/
		int length=0;
		byte[] buffer=new byte[1024];
		InputStream is=new FileInputStream("a.txt");
		while(-1!=(length=is.read(buffer, 0, 1024))){
			String str=new String(buffer,0,length);
			System.out.println("结果："+str);
		}
		is.close(); 
	}
	@Test
	public void fun2() throws IOException{
		File file=new File("applicationView.txt");
		
		OutputStream os=new FileOutputStream(file);
		String str="aaa";
		os.write(str.getBytes());
		os.close();
		
	}
}
