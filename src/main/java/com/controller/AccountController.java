package com.controller;

import com.entity.Account;
import com.service.AccountService;
import com.service.TransactionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.Query;
import utils.R;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-16
 * Time: 20:29
 */
@Controller
public class AccountController {
    @Resource
    private AccountService accountService;
    @Resource
    private TransactionService transactionService;

    @RequestMapping("/find")
    @ResponseBody
    public Account find() {
        return accountService.findByCardNo("1");
    }

    @RequestMapping("/login")

    public String login(Account account, HttpSession httpSession) {
        int i = accountService.login(account);
        if (i == 2) {
            httpSession.setAttribute("account", account);
            return "index";
        }
        httpSession.setAttribute("error", "账户或密码有误！！！");
        return "redirect:login.jsp";
    }

    @RequestMapping("/findBalance")
    public String findBalance(HttpSession httpSession) {
        Account a = (Account) httpSession.getAttribute("account");
        Account account = accountService.findByCardNo(a.getCardno());
        System.out.println(account);
        System.out.println(account.getAccountBalance());
        httpSession.setAttribute("balance", account.getAccountBalance());

        return "balance";
    }

    @RequestMapping("/transfer")
    public String transfer(String cardno, double money, HttpSession httpSession) {
        Account account = (Account) httpSession.getAttribute("account");
        boolean b = accountService.transfer(cardno, account.getCardno(), money);
        if (b) {
            return "success";
        }
        return "transfer";
    }

    @RequestMapping("/findTransactionRecord")
    public String findTransactionRecord(Query query, HttpSession httpSession) {
        if (query.getNowPage() == null) {
            query.setNowPage(1);
        }
        Account account = (Account) httpSession.getAttribute("account");
        query.setCardno(account.getCardno());
        Map<String, Object> map = transactionService.findByPage(query);
        httpSession.setAttribute("map", map);
        httpSession.setAttribute("query", query);
        return "transactionRecordList";
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(String newPassword, HttpSession httpSession) {
        Account account = (Account) httpSession.getAttribute("account");
        boolean b = accountService.updatePwd(account.getCardno(), newPassword);
        if (b) {
            return "redirect:login.jsp";
        }
        return "redirect:updatePwd.jsp";
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public R checkPassword(String password, HttpSession httpSession) {
        Account account = (Account) httpSession.getAttribute("account");

        boolean b = accountService.checkPwd(account.getCardno(), password);
//        System.out.println(password);
//        System.out.println(account.getCardno());
//        System.out.println(b);
        if (b) {
            //System.out.println(R.error(0, "正确"));
            return R.ok();

        }
        return R.error();
    }

    @RequestMapping("/checkCardNo")
    @ResponseBody
    public R checkCardNo(String cardNo, HttpSession httpSession) {
        Account account = accountService.findByCardNo(cardNo);

        if (account == null) {
            return R.error("账户不存在！");
        }
        if (account.getStatus() == 0) {
            return R.error("账户被冻结！");
        }
        Account account1 = (Account) httpSession.getAttribute("account");
        if (cardNo.equals(account1.getCardno())) {
            return R.error("不能给自己转账...");
        }
        return R.ok();
    }

    @RequestMapping("/checkMoney")
    @ResponseBody
    public R checkMoney(double money, HttpSession httpSession) {
        //得到当前登录的账户信息
        Account account = (Account) httpSession.getAttribute("account");
        Account a = accountService.findByCardNo(account.getCardno());
        if (money > a.getAccountBalance()) {
            return R.error("余额不足！");
        }
        return R.ok();
    }
}
