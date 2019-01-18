package utils;

import java.sql.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 *
 * @author:Dustyhandhe Date: 2019-01-16
 * Time: 17:41
 */
public class Query {
    private Integer nowPage;
    private Integer pageSize = 5;

    private Date startDate;
    private Date endDate;

    private Integer offset;

    private String cardno;

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public Integer getNowPage() {
        return nowPage;
    }

    public void setNowPage(Integer nowPage) {
        this.nowPage = nowPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getOffset() {
        return (nowPage - 1) * pageSize;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }
}
