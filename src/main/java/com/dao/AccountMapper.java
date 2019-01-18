package com.dao;

import com.entity.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(String cardno);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String cardno);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}