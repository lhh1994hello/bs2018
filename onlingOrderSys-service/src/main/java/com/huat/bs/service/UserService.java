//创建时间：2018年3月28日,下午10:06:52
package com.huat.bs.service;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.Session;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huat.bs.bean.User;
import com.huat.bs.bean.UserExample;
import com.huat.bs.bean.UserExample.Criteria;
import com.huat.bs.bean.UserException;
import com.huat.bs.dao.AdminUserMapper;
import com.huat.bs.dao.UserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

import cn.itcast.commons.CommonUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

@Service
@SuppressWarnings("all")
public class UserService extends RedisUtilsIO<User> {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AdminUserMapper adminUserMapper;
	/*@Autowired
	private JedisClient jedisClient;*/
	// 引入和邮件有关的
	@Value("${host}")
	private String host;
	@Value("${uname}")
	private String uname;
	@Value("${pwd}")
	private String pwd;
	@Value("${from}")
	private String from;
	@Value("${content}")
	private String content;
	@Value("${subject}")
	private String subject;
	
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	//未删除用户的“主键” 状态为0 1 
	@Value("${USER_LIST_FLAG_ACTIVE}")
	private String USER_LIST_FLAG_ACTIVE;
	//已删除用户的“主键”
	@Value("${USER_LIST_FLAG_FALSE_DELETE}")
	private String USER_LIST_FLAG_FALSE_DELETE;
	
	
	// 注册
	public void regist(User form) throws UserException {
		//更新用户未删除的列表
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
		}catch(Exception e){
			System.out.println("用户注册时，缓存操作失败....");
		}
		String uidStr=CommonUtils.uuid().substring(0, 16);
		//删除缓存中的用户列表
		// 设置用户主键
		form.setuId(uidStr);
		//
		// 设置用户激活码
		form.setuActivaecode(CommonUtils.uuid().substring(0, 16));
		// 注册时间
		form.setuRegisttime(new Date());
		form.setuLogintime(new Date());
		form.setuBalance(0.00);
		form.setuScore(0);
		form.setuState(0);
		// 根据账号查用户
		User user = findUserByLoginID(form.getuLoginid());
		if (user != null)
			throw new UserException("该账号已被注册");
		user = findUserByEmail(form.getuEmail());
		if (user != null)
			throw new UserException("该邮箱已经被注册");

		// 发邮件
		InetAddress myip = null;
		try {
			myip = InetAddress.getLocalHost();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		}
		System.out.println("你的IP地址是：" + myip.getHostAddress());
		content = MessageFormat.format(content, myip.getHostAddress(), form.getuActivaecode());
		System.out.println("邮件链接：" + content);
		String to = form.getuEmail();
		Session session = MailUtils.createSession(host, uname, pwd);// 得到session
		Mail mail = new Mail(from, to, subject, content);// 创建邮件对象
		try {
			MailUtils.send(session, mail);// 发邮件
			System.out.println("发送成功了邮件");
			userMapper.insertSelective(form);
		} catch (Exception e) {
			System.out.println("邮件发送失败");
			e.printStackTrace();
		}

	}

	// 根据邮件查询
		public User findUserByEmail(String uEmail) {
		//加缓存
			User beanfromRedis=null;
			try{
				 beanfromRedis = getBeanfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, uEmail);
			}catch(Exception e){
				
			}
			if(beanfromRedis!=null){
				return beanfromRedis;
			}
			
			
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUEmailEqualTo(uEmail);
		List<User> userList = userMapper.selectByExample(example);
		if (userList.size() > 0) {
			User selectUser = userList.get(0);
			//存缓存
			String jsonString = JSONObject.toJSONString(selectUser);
			setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, uEmail, jsonString);
			return userList.get(0);
		}
		return null;
	}

	// 根据用户账号查询用户
	private User findUserByLoginID(String getuLoginid) {
		// TODO Auto-generated method stub
		/*
		 * if (getuLoginid == null) { return null; }
		 */
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andULoginidEqualTo(getuLoginid);
		List<User> userList = userMapper.selectByExample(example);
		if (userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}

	// 激活用户
	public void active(String uActivaecode) throws UserException {
		// 先根据激活码查询，判断激活码是否存在
		System.out.println("用户激活");
		User user = findUserByuActivaecode(uActivaecode);
		if (user == null)
			throw new UserException("激活码无效");
		Integer uState = user.getuState();
		System.out.println("用户状态：   " + uState);
		if (uState != null && uState != 0)
			throw new UserException("该用户已经被激活，请不要重复激活");
		// 激活用户
		user.setuState(1);
		updateUserState(user);

	}

	// 更新用户信息
	public void updateUserState(User user) throws UserException {
		//删除用户列表 3个
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_FALSE_DELETE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, user.getuId());
		}catch(Exception e){
			System.out.println("updateUserState 缓存操作失败...");
		}
		
		System.out.println("更新用户状态");
		User selectUser = userMapper.selectByPrimaryKey(user.getuId());
		if(selectUser==null) throw new UserException("用户不存在");
		userMapper.updateByPrimaryKeySelective(user);
	}

	// 按激活码查询用户
	public User findUserByuActivaecode(String uActivaecode) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUActivaecodeEqualTo(uActivaecode);
		List<User> userList = userMapper.selectByExample(example);
		if (userList.size() > 0) {
			return userList.get(0);
		}
		return null;
	}

 	// 用户,登录,要返回一个User对象
	public User login(User form) throws UserException {
		// 先根据账号查询用户，如果表单输入的是邮箱，那这一步就查不到，执行下一步
		User user = findUserByLoginID(form.getuLoginid());
		// 再根据邮箱查用户
		if (user == null) {
			user = findUserByEmail(form.getuLoginid());
		}
		// 判断根据邮箱查询出的结果是否匹配
		if (user == null) {
			System.out.println("登录失败，账号和邮箱都错误");
			throw new UserException("登录失败，账号不存在");
		}
		// 走到这就代表一定查询到用户了，然后判断状态和密码是否匹配
		Integer uState = user.getuState();
		if (!user.getuPassword().equals(form.getuPassword()))
			throw new UserException("密码错误");
		if (uState == null || uState == 0)
			throw new UserException("该用户尚未激活");
		if(uState==2){
			throw new UserException("该用户不存在");
		}
 		//修改登录次数和登录时间
		User selectUser = userMapper.selectByPrimaryKey(user.getuId());
		Integer loginNum = selectUser.getuScore();
		if(loginNum==null||loginNum==0){
			loginNum=1;
		}else {
			loginNum=loginNum+1;
		}
		selectUser.setuScore(loginNum);
		selectUser.setuLogintime(new Date());
		userMapper.updateByPrimaryKeySelective(selectUser);
 		return user;
	}
	

	// 查询用户列表
	public List<User> findUserList(Integer uState, String beginTime, String endTime, String stext) {
		
		System.out.println("uState:" + uState + ",beginTime:" + beginTime + ",endTime:" + endTime + ",stext:" + stext);
		DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd");
		UserExample example = new UserExample();
		example.setOrderByClause("u_registtime desc");
		Criteria criteria = example.createCriteria();
		Criteria criteria2 = example.createCriteria();
		Criteria criteria3 = example.createCriteria();
		Criteria criteria4 = example.createCriteria();
		Criteria criteria5 = example.createCriteria();
		DateTime dateTime = null;
		// 如果开始时间参数不为空
		if (!StringUtils.isBlank(beginTime)) {
			dateTime = DateTime.parse(beginTime, format);
			Date beginDate = dateTime.toDate();
			System.out.println("开始时间:" + beginDate);
			criteria.andURegisttimeGreaterThanOrEqualTo(beginDate);
			criteria2.andURegisttimeGreaterThanOrEqualTo(beginDate);
			criteria3.andURegisttimeGreaterThanOrEqualTo(beginDate);
			criteria4.andURegisttimeGreaterThanOrEqualTo(beginDate);
			criteria5.andURegisttimeGreaterThanOrEqualTo(beginDate);
		}
		if(!StringUtils.isBlank(endTime)){
			 dateTime = DateTime.parse(endTime, format);
			 dateTime=dateTime.plusDays(1);//结束时间加一天
			 Date endDate=dateTime.toDate();
			 criteria.andURegisttimeLessThanOrEqualTo(endDate);
			 criteria2.andURegisttimeGreaterThanOrEqualTo(endDate);
			 criteria3.andURegisttimeGreaterThanOrEqualTo(endDate);
			 criteria4.andURegisttimeGreaterThanOrEqualTo(endDate);
			 criteria5.andURegisttimeGreaterThanOrEqualTo(endDate);
		}
		if(uState==-100){
			//默认情况下查询0,1之间的状态，
			System.out.println("根据用户状态查询用户...: "+uState);
				System.out.println("状态不为2.............");
				criteria.andUStateBetween(0, 1);
				criteria2.andUStateBetween(0, 1);
				criteria3.andUStateBetween(0, 1);
				criteria4.andUStateBetween(0, 1);
		}else {
			
			criteria.andUStateEqualTo(uState);
			criteria2.andUStateEqualTo(uState);
			criteria3.andUStateEqualTo(uState);
			criteria4.andUStateEqualTo(uState);
			criteria5.andUStateEqualTo(uState);
		}
		
		//搜索框，一个条件去匹配多个字段
		if(!StringUtils.isBlank(stext)){
			criteria.andUIdEqualTo(stext);//用户ID
			//criteria2.andUNicknameEqualTo(stext);//昵称
			criteria2.andUNicknameLike("%"+stext+"%");
			criteria3.andUEmailEqualTo(stext);//邮箱
			criteria4.andUPhoneEqualTo(stext);//手机
			criteria5.andUSexEqualTo(stext);
			example.or(criteria2);
			example.or(criteria3);
			example.or(criteria4);	
			example.or(criteria5);	
		}
		//当查询条件为空的时候,从缓存中取数据，如果数据不为空就直接结束方法
	/*	if(StringUtils.isBlank(beginTime)&&StringUtils.isBlank(endTime)&&StringUtils.isBlank(stext)){
			List<User> listfromRedis = getListfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
			if(listfromRedis!=null&&listfromRedis.size()>0){
				System.out.println("缓存中集合长度:"+listfromRedis.size());
				System.out.println("数据内容:"+listfromRedis);
				System.out.println("查询用户列表....................1");
				return listfromRedis;
			}
		}
		System.out.println("查询用户列表....................2");
		List<User> userList = userMapper.selectByExample(example);
		System.out.println("从数据库中查询的数据:"+userList);
		String jsonString = JSON.toJSONString(userList);
		setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE, jsonString);*/
		return  userMapper.selectByExample(example);
	}
	//根据用户ID查询用户
	public User findUserByID(String uId) {
		User beanfromRedis = getBeanfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, uId);
		if(beanfromRedis!=null){
			return beanfromRedis;
		}
		User user = userMapper.selectByPrimaryKey(uId);
		String jsonString = JSONObject.toJSONString(user);
		setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, uId, jsonString);
		return userMapper.selectByPrimaryKey(uId);
	}
	//修改用户数据
	public void updateUserInfo(User user) {
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, user.getuId());			
		}catch(Exception e){
			System.out.println("updateUserInfo 缓存操作失败...");
		}
		System.out.println("修改用户数据...Service");
		userMapper.updateByPrimaryKeySelective(user);
		
	}
	//修改密码
	public User changePassword(User form) {
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, form.getuId());		
		}catch(Exception e){
			System.out.println("changePassword 缓存操作失败...");
		}
		
		userMapper.updateByPrimaryKeySelective(form);
		return userMapper.selectByPrimaryKey(form.getuId());
	}
	//批量假删除，其实是修改用户的状态
	public void deleteBatchWithFalse(List<String> uIdList,Integer uState) {
		
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_FALSE_DELETE);		
		}catch(Exception e){
			System.out.println("deleteBatchWithFalse 缓存操作失败...");
		}
		
		UserExample example=new UserExample();
		Criteria criteria=example.createCriteria();
		criteria.andUIdIn(uIdList);
		User user=null;
		for(String uId:uIdList){
			try{
				jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, uId);
			}catch(Exception e){
				System.out.println("deleteBatchWithFalse 缓存操作失败...");
			}
			System.out.println("批量更新..........");
			user=new User();
			user.setuId(uId);
			user.setuState(uState);
			userMapper.updateByPrimaryKeySelective(user);
		}
	}
	//单个假删除
	public void deleteUserByIdWithFalse(String uId,Integer uState) {
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_FALSE_DELETE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, uId);
		}catch(Exception e){
			System.out.println("deleteUserByIdWithFalse 缓存操作失败...");
		}
		
		User user=new User();
		user.setuId(uId);
		user.setuState(uState);
		userMapper.updateByPrimaryKeySelective(user);
	}
	//根据账号查找用户
	public User findUserByuLoginid(String uLoginid) {
		UserExample example =new UserExample();
		Criteria criteria=example.createCriteria();
		criteria.andULoginidEqualTo(uLoginid);
		List<User> userList = userMapper.selectByExample(example);
		if(userList.size()>0){
			return userList.get(0);
		}
		return null;
	}
	//添加用户
	public void addUser(User user) {
		//添加用户只需要删除已经激活显示会员列表数据的内容就行了
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
		}catch(Exception e){
			System.out.println("addUser 缓存操作失败...");
		}
		
		
		user.setuId(CommonUtils.uuid().substring(0, 8));
		user.setuState(1);
		user.setuRegisttime(new Date());
		int num=(int)(Math.random()*998)+1;  
		String randomNum = String.format("%03d", num);
		user.setuNickname("昵称_"+randomNum);
		user.setuPhone("15872680"+randomNum);
		user.setuAddress("地址_"+randomNum);
		userMapper.insertSelective(user);
	}
	//根据手机号查询用户
	public User findUserByPhone(String uPhone) {
		UserExample example=new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUPhoneEqualTo(uPhone);
		List<User> userList = userMapper.selectByExample(example);
		if(userList.size()>0){
			return userList.get(0);
		}
		return null;
	}
	//找回密码，根据账号，邮箱，手机号查询用户记录
	public User findUserByInputContext(String inputContext) {
		//添加缓存
	
		UserExample example=new UserExample();
		Criteria criteria1 = example.createCriteria();
		Criteria criteria2 = example.createCriteria();
		Criteria criteria3 = example.createCriteria();
		criteria1.andULoginidEqualTo(inputContext);
		criteria2.andUEmailEqualTo(inputContext);
		criteria3.andUPhoneEqualTo(inputContext);
		example.or(criteria2);
		example.or(criteria3);
		List<User> userList = userMapper.selectByExample(example);
		if(userList.size()>0) {
			System.out.println("查到几个:"+userList.size());
			System.out.println("查询到了:"+userList);
			return userList.get(0);
		}
		return null;
	}
	//根据密保找回密码
	public User backPasswordByMibao(String inputContext, String uSafequest, String uSafeanswer) {
		// TODO Auto-generated method stub
		User user = findUserByInputContext(inputContext);
		if(user==null) return null;
		String getuSafequest = user.getuSafequest();
		String getuSafeanswer = user.getuSafeanswer();
		if(!getuSafequest.equals(uSafequest)||!getuSafeanswer.equals(uSafeanswer)){
			return null;
		}
		return user;
	}
	//找回密码后设置新密码
	public User setNewPassword(String uLoginid, String uPassword) {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andULoginidEqualTo(uLoginid);
		List<User> userList = userMapper.selectByExample(example);
		if(userList.size()<1)return null;
		User user=userList.get(0);
		if(user==null) return null;
		user.setuPassword(uPassword);
		
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, user.getuId());
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_ACTIVE);
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, USER_LIST_FLAG_FALSE_DELETE);
		}catch(Exception e){
			System.out.println("setNewPassword 缓存操作失败...");
		}
		
		userMapper.updateByPrimaryKeySelective(user);
		return user;
	}
	//发送手机验证码，要先检验一下这个手机号与用户数据库中的手机号是否一致
	public User sendPhoneCode(String uId, String uPhone) {
		User beanfromRedis = getBeanfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, uId);
		if(beanfromRedis!=null){
			return beanfromRedis;
		}
 		User user = userMapper.selectByPrimaryKey(uId);
 		String jsonString = JSONObject.toJSONString(user);
 		setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, uId, jsonString);
		if(user==null) return null;
		String selectuPhone=user.getuPhone();
		if(!selectuPhone.equals(uPhone)) return null;
		
		//发送手机号
		return user;
	}
	//重置密码通过发送邮件
	public User sendEmail(String uId, String uEmail,int localPort, String contextPath) {
		User beanfromRedis = getBeanfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, uId);
		User user =null;
		if(beanfromRedis==null){
			 user = userMapper.selectByPrimaryKey(uId);
		}
		if(user==null) return null;
		//加到缓存中
		String jsonString = JSONObject.toJSONString(user);
		setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, uId, jsonString);
		
		String selectuEmail=user.getuEmail();
		if(!uEmail.equals(selectuEmail)){
			System.out.println("输入的邮件和数据库中的邮件不同...");
			 return null;
		}
		InetAddress myip = null;
		try {
			myip = InetAddress.getLocalHost();
		} catch (UnknownHostException e1) {
 			//e1.printStackTrace();
			throw new RuntimeException(e1);
		}
		String nickname = user.getuNickname();
 		String subject2="这是订餐系统，用户重置密码";
		StringBuffer sb=new StringBuffer();
 		System.out.println("头像:"+user.getImage());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long beginTime=System.currentTimeMillis();//发送时间，保存到sesseion中
		user.setActiveTime(beginTime);
		beginTime=beginTime+5*60*1000;
		Date date=new Date(beginTime);
		String formatDate = sdf.format(date);
		//sb.append("<img title='用户头像' src='").append(user.getImage()).append("'").append("/>").append("<br/>");
		sb.append("尊敬的会员:").append(nickname).append("/").append(uId).append("<br/>");
		sb.append("重新设置密码请访问以下链接:<br/>");
		sb.append("<a style='color:#ff8080;font-size:16px;' href='http://");
		sb.append(myip.getHostAddress()).append(":");
		sb.append(localPort);
		sb.append(contextPath);
		sb.append("/").append("userpage/user/forgetPassword.jsp").append("?"+"uId="+user.getuId()+"&flag=fromEmail");
		sb.append("'>");
		sb.append("点击这里重置密码");
		sb.append("</a><br/>");
		sb.append("请您务必在"+formatDate+"前激活该帐号，否则该激活码将失效。");
		String sbTest = sb.toString();
		System.out.println("测试路径:"+sbTest);
		
		//接下来就要发送邮件了
		Session session = MailUtils.createSession(host, uname, pwd);// 得到session
		Mail mail = new Mail(from, uEmail, subject2, sbTest);// 创建邮件对象
		try {
			MailUtils.send(session, mail);// 发邮件
			System.out.println("发送成功了邮件");
			//userMapper.insertSelective(form);
		} catch (Exception e) {
			System.out.println("邮件发送失败");
			//e.printStackTrace();
			throw new RuntimeException();
		}
 		return user;
	}
	//获得会员的数量
	public long getUserNum() {
		UserExample example=new UserExample();
		Criteria criteria=example.createCriteria();
		criteria.andUStateBetween(0, 2);
		long num = userMapper.countByExample(example);
		return num;
	}
	//获得今天注册的用户数量
	public long getTodayRegistNum() {
		DateTime nowTime = new DateTime();
		DateTime startOfDay =  nowTime.withTimeAtStartOfDay();
		DateTime endOfDay =  nowTime.millisOfDay().withMaximumValue();
		Date start = startOfDay.toDate();
		Date end = endOfDay.toDate();
		//System.out.println("当天的开始时间:"+start);
		//System.out.println("当天的结束时间:"+end);
		UserExample example=new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andURegisttimeBetween(start, end);
		long todayRegistNum = userMapper.countByExample(example);
		return todayRegistNum;
	}

	
	

}
