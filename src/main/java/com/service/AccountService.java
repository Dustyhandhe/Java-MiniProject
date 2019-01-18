package com.service;

import com.entity.Account;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-16
 * Time: 20:29
 */
public interface AccountService {
    public Account findByCardNo(String cardNo);

    public int login(Account account);

    public boolean transfer(String toCardNo, String fromCardNo, double money);

    public boolean updatePwd(String cardNo, String newPassword);

    public boolean checkPwd(String cardNo, String password);
}
