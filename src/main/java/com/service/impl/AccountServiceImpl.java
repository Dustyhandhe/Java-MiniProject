package com.service.impl;

import com.dao.AccountMapper;
import com.dao.TransactionRecordMapper;
import com.entity.Account;
import com.entity.TransactionRecord;
import com.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-16
 * Time: 20:30
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Resource
    private AccountMapper accountMapper;
    @Resource
    private TransactionRecordMapper transactionRecordMapper;

    @Override
    public Account findByCardNo(String cardNo) {
        return accountMapper.selectByPrimaryKey(cardNo);
    }

    @Override
    public int login(Account account) {
        Account account1 = accountMapper.selectByPrimaryKey(account.getCardno());
        if (account1 == null) {
            return 0;
        }
        if (!account1.getPassword().equals(account.getPassword())) {
            return 1;
        }
        return 2;
    }

    @Override
    public boolean transfer(String toCardNo, String fromCardNo, double money) {
        Account account = accountMapper.selectByPrimaryKey(toCardNo);
        account.setAccountBalance(account.getAccountBalance() + money);
        Account account1 = accountMapper.selectByPrimaryKey(fromCardNo);
        account1.setAccountBalance(account1.getAccountBalance() - money);
        //转账
        accountMapper.updateByPrimaryKey(account);
        accountMapper.updateByPrimaryKey(account1);
        //转账记录
        //转出记录
        TransactionRecord transactionRecord = new TransactionRecord();
        transactionRecord.setCardno(fromCardNo);
        transactionRecord.setAccountBalance(account1.getAccountBalance());
        transactionRecord.setExpense(money);
        transactionRecord.setIncome(0d);
        transactionRecord.setTransactionDate(new Date());
        transactionRecord.setTransactionType("转出");
        transactionRecord.setRemark("1月份工资");

        transactionRecordMapper.insert(transactionRecord);
        //转入记录
        TransactionRecord transactionRecord1 = new TransactionRecord();
        transactionRecord1.setCardno(toCardNo);
        transactionRecord1.setAccountBalance(account.getAccountBalance());
        transactionRecord1.setExpense(0d);
        transactionRecord1.setIncome(money);
        transactionRecord1.setTransactionDate(new Date());
        transactionRecord1.setTransactionType("转入");
        transactionRecord1.setRemark("1月份工资");

        transactionRecordMapper.insert(transactionRecord1);
        return true;
    }

    @Override
    public boolean updatePwd(String cardNo, String newPassword) {
        Account account = new Account();
        account.setPassword(newPassword);
        account.setCardno(cardNo);
        int i = accountMapper.updateByPrimaryKeySelective(account);
        return i > 0;
    }

    @Override
    public boolean checkPwd(String cardNo, String password) {
        Account account = accountMapper.selectByPrimaryKey(cardNo);
        if (account != null && account.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
}
