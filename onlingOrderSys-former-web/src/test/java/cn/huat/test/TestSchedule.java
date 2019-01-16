//创建时间:2018年5月17日上午8:58:53
//用户:lihonghui
package cn.huat.test;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;

public class TestSchedule {
	@Scheduled(cron = "0 30 22 ? * *")
	  public void test1()
	  {
	      System.out.println("job1 开始执行..."+new Date());
	  } 
	     @Scheduled(cron = "0/5 * * * * ?")//每隔5秒隔行一次 
	  public void test2()
	  {
	     System.out.println("job2 开始执行");
	  } 

}
