package com.dao;

import com.entity.TransactionRecord;
import utils.Query;

import java.util.List;

public interface TransactionRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TransactionRecord record);

    int insertSelective(TransactionRecord record);

    TransactionRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TransactionRecord record);

    int updateByPrimaryKey(TransactionRecord record);

    List<TransactionRecord> findByPage(Query query);

    long findTotalCount(Query query);
}