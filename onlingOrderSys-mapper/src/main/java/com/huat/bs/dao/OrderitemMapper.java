package com.huat.bs.dao;

import com.huat.bs.bean.Orderitem;
import com.huat.bs.bean.OrderitemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderitemMapper {
    long countByExample(OrderitemExample example);

    int deleteByExample(OrderitemExample example);

    int deleteByPrimaryKey(String oiid);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    List<Orderitem> selectByExampleWithBLOBs(OrderitemExample example);

    List<Orderitem> selectByExample(OrderitemExample example);

    Orderitem selectByPrimaryKey(String oiid);

    int updateByExampleSelective(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByExampleWithBLOBs(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByExample(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKeyWithBLOBs(Orderitem record);

    int updateByPrimaryKey(Orderitem record);
}