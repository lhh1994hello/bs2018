package com.huat.bs.dao;

import com.huat.bs.bean.Collects;
import com.huat.bs.bean.CollectsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectsMapper {
    long countByExample(CollectsExample example);

    int deleteByExample(CollectsExample example);

    int deleteByPrimaryKey(String cid);

    int insert(Collects record);

    int insertSelective(Collects record);

    List<Collects> selectByExample(CollectsExample example);

    Collects selectByPrimaryKey(String cid);

    int updateByExampleSelective(@Param("record") Collects record, @Param("example") CollectsExample example);

    int updateByExample(@Param("record") Collects record, @Param("example") CollectsExample example);

    int updateByPrimaryKeySelective(Collects record);

    int updateByPrimaryKey(Collects record);
}