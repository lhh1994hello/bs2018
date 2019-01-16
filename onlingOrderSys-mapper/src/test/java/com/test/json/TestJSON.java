//创建时间:2018年5月18日下午10:29:17
//用户:lihonghui
package com.test.json;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class TestJSON {
	//对象转JSON
	@Test
	public void fun1() {
		Teacher teacher=new Teacher("张三", 18, 56.23);
		/*String jsonString = JSON.toJSONString(teacher);
		System.out.println("对象转JSON_fun1："+jsonString);*/
		String jsonString = JSONObject.toJSONString(teacher);
		System.out.println("对象转JSON:"+jsonString);
	}
	//JSON转JavaBean
	@Test
	public void fun2(){
		Teacher teacher=new Teacher("张三", 18, 56.23);
		String jsonString =JSONObject.toJSONString(teacher);
 		Teacher parseObject = JSONObject.parseObject(jsonString, Teacher.class);
		System.out.println("JSON转对象:"+parseObject);
	}
	//集合转JSON
	@Test
	public void fun3(){
		Teacher teacher1=new Teacher("张三", 18, 56.23);
		Teacher teacher2=new Teacher("张三", 18, 56.23);
		List<Teacher> teaList=new ArrayList<Teacher>();
		teaList.add(teacher1);
		teaList.add(teacher2);
		String jsonString = JSON.toJSONString(teaList);
		System.out.println("集合转JSON:"+jsonString);
	}
	//JSON转集合
	@Test
	public void fun4(){
		Teacher teacher1=new Teacher("张三", 18, 56.23);
		Teacher teacher2=new Teacher("张三", 18, 56.23);
		List<Teacher> teaList=new ArrayList<Teacher>();
		teaList.add(teacher1);
		teaList.add(teacher2);
		String jsonString = JSON.toJSONString(teaList);
		//System.out.println("集合转JSON:"+jsonString);
		List<Teacher> parseArray = JSON.parseArray(jsonString, Teacher.class);
		System.out.println("JSON转集合:"+parseArray);
	}
}

class Teacher {
	private String name;
	private int age;
	private double score;
	

	public Teacher(String name, int age, double score) {
		super();
		this.name = name;
		this.age = age;
		this.score = score;
	}

	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Teacher [name=" + name + ", age=" + age + ", score=" + score + "]";
	}

}