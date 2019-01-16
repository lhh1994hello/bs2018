package com.huat.bs.dao;

import com.huat.bs.bean.Feedback;
import com.huat.bs.bean.FeedbackExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FeedbackMapper {
    long countByExample(FeedbackExample example);

    int deleteByExample(FeedbackExample example);

    int deleteByPrimaryKey(String fid);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    List<Feedback> selectByExampleWithBLOBs(FeedbackExample example);

    List<Feedback> selectByExample(FeedbackExample example);

    Feedback selectByPrimaryKey(String fid);

    int updateByExampleSelective(@Param("record") Feedback record, @Param("example") FeedbackExample example);

    int updateByExampleWithBLOBs(@Param("record") Feedback record, @Param("example") FeedbackExample example);

    int updateByExample(@Param("record") Feedback record, @Param("example") FeedbackExample example);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKeyWithBLOBs(Feedback record);

    int updateByPrimaryKey(Feedback record);
}