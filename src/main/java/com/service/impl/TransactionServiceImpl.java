package com.service.impl;

import com.dao.TransactionRecordMapper;
import com.entity.TransactionRecord;
import com.service.TransactionService;
import org.springframework.stereotype.Service;
import utils.Query;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-17
 * Time: 9:18
 */
@Service
public class TransactionServiceImpl implements TransactionService {
    @Resource
    private TransactionRecordMapper transactionRecordMapper;

    @Override
    public Map<String, Object> findByPage(Query query) {
        List<TransactionRecord> list = transactionRecordMapper.findByPage(query);
        long totalCount = transactionRecordMapper.findTotalCount(query);
        Map<String, Object> map = new HashMap<String, Object>();
        long totalPage = (totalCount % query.getPageSize() == 0 ? totalCount / query.getPageSize() : totalCount / query.getPageSize() + 1);
        map.put("nowPage", query.getNowPage());
        map.put("totalPage", totalPage);
        map.put("list", list);
        return map;
    }
}
