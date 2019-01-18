package com.service;

import utils.Query;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-17
 * Time: 9:16
 */
public interface TransactionService {
    public Map<String, Object> findByPage(Query query);
}
