package com.huat.bs.service;

 import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.huat.bs.bean.Collects;
import com.huat.bs.bean.CollectsExample;
import com.huat.bs.bean.CollectsExample.Criteria;
import com.huat.bs.bean.Menu;
import com.huat.bs.dao.CollectsMapper;
import com.huat.bs.dao.MenuMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

import cn.itcast.commons.CommonUtils;



@Service
@SuppressWarnings("all")
public class CollectService extends RedisUtilsIO<Collects> {
	@Autowired
	private CollectsMapper collectsMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private JedisClient jedisClient;//=new JedisClientSingle();
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	//获得用户收藏的所有菜品
	public List<Collects> findUserCollectList(String uid) {
		if(StringUtils.isBlank(uid)){
			return null;
		}
		CollectsExample example=new CollectsExample();
		Criteria criteria=example.createCriteria();
		criteria.andUidEqualTo(uid);
		List<Collects> collectList = collectsMapper.selectByExample(example);
 		return collectList;
	}
	//收藏
	//cid不等于-100，说明记录已经存在了，根据标志来修改状态，
	//cid等于-100，说明记录不存在，添加记录，状态设为收藏状态
	public void shouChangStar(String cid, String mid, String flagStar, String uid) {
		// TODO Auto-generated method stub
		Collects collects=new Collects();
		//这道菜之前没有被这个人收藏过
		if(cid.equals("-100")){
			collects.setCid(CommonUtils.uuid().substring(0, 8));
			collects.setCreatetime(new Date());
			collects.setMid(mid);
			collects.setUid(uid);
			collects.setCstate(1);
			collectsMapper.insertSelective(collects);
			Menu menu = menuMapper.selectByPrimaryKey(mid);
			Integer ratestar = menu.getRatestar();
			if(ratestar==null) ratestar=0;
 			ratestar=ratestar+1;
 			menu.setRatestar(ratestar);
			menuMapper.updateByPrimaryKeySelective(menu);
		}else{
			System.out.println("收藏的ID:"+cid);
			//flagStar 传过来的是1 ，就修改为0，传过来的是0，就修改为1；
			Collects collects2 = collectsMapper.selectByPrimaryKey(cid);
			if(collects2!=null){
				if(flagStar.equals("0")){
					collects2.setCstate(1);//收藏
					Menu menu = menuMapper.selectByPrimaryKey(mid);
					Integer ratestar = menu.getRatestar();
					if(ratestar==null) ratestar=0;
					ratestar=ratestar+1;
					menu.setRatestar(ratestar);
					menuMapper.updateByPrimaryKey(menu);
				}else if(flagStar.equals("1")){
					Menu menu = menuMapper.selectByPrimaryKey(mid);
					Integer ratestar = menu.getRatestar();
					if(ratestar==null) ratestar=0;
					ratestar=ratestar-1;
					if(ratestar<0) ratestar=0;
					menu.setRatestar(ratestar);
					menuMapper.updateByPrimaryKey(menu);
					collects2.setCstate(0);//取消
				}
				collects2.setCanceltime(new Date());
				collectsMapper.updateByPrimaryKeySelective(collects2);
				
			}
		}
		
		
	}

}
