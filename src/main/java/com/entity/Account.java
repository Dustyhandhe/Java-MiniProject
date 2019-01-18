package com.entity;

import java.io.Serializable;

public class Account implements Serializable {
    private String cardno;

    private String password;

    private Double accountBalance;

    private Integer status;

    private static final long serialVersionUID = 1L;

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Double getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(Double accountBalance) {
        this.accountBalance = accountBalance;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +
                "cardno='" + cardno + '\'' +
                ", password='" + password + '\'' +
                ", accountBalance=" + accountBalance +
                ", status=" + status +
                '}';
    }
}