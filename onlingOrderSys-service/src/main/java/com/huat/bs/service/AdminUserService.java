//创建时间:2018年4月28日 下午3:22:50 
package com.huat.bs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.huat.bs.bean.AdminUser;
import com.huat.bs.bean.AdminUserExample;
import com.huat.bs.bean.AdminUserExample.Criteria;
import com.huat.bs.bean.UserException;
import com.huat.bs.dao.AdminUserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

@Service
@SuppressWarnings("all")
public class AdminUserService extends RedisUtilsIO<AdminUser> {
	@Autowired
	private AdminUserMapper adminUserMapper;
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	
	// 管理员登录
	public AdminUser login(AdminUser form) throws UserException {
		//可以根据手机和账号登录
		AdminUser admin = findAdminByLoginId(form.getLoginid());
		if(admin==null){
			System.out.println("按手机号登录的...");
			admin =findAdminByPhone(form.getLoginid());
		}
		if(admin==null){
			System.out.println("账号和手机都不对...");
			throw new UserException("账号和手机都不存在");
		}
		//到这里，账号肯定存在了,验证密码
		String password=admin.getPassword();
		if(!password.equals(form.getPassword())){
			System.out.println("密码错误...");
			throw new UserException("密码错误");
		}
		
		Integer states = admin.getStates();
		if(states==0||states==null){
			throw new UserException("尚未激活");
		}
		//设置只有1状态才是正常的...
		if(states!=1){
			throw new UserException("账号异常...");
		}
		
 		return admin;
	}
	
	//根据账号查询
	public AdminUser findAdminByLoginId(String loginID){
			AdminUserExample example=new AdminUserExample();
			Criteria criteria=example.createCriteria();
 			criteria.andLoginidEqualTo(loginID);
			List<AdminUser> adminList = adminUserMapper.selectByExample(example);
			if(adminList.size()>0){
				return adminList.get(0);
			}
		return null;
	}
	//根据手机号查询
	public AdminUser findAdminByPhone(String mobile){
			AdminUserExample example=new AdminUserExample();
			Criteria criteria=example.createCriteria();
			criteria.andMobilesEqualTo(mobile);
			//criteria.and
			List<AdminUser> adminList = adminUserMapper.selectByExample(example);
			if(adminList.size()>0){
				return adminList.get(0);
			}
		return null;
	}
	
	
}
