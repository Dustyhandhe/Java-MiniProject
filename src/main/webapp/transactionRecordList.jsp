<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 下午2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>


    <form action="/findTransactionRecord" method="post" id="myForm">
        交易时间范围
        <input type="text" id="startDate" name="startDate" value="${query.startDate}">到
        <input type="text"  id="endDate" name="endDate" value="${query.endDate}">

        <input type="hidden" name="nowPage" id="nowPage">

        <input type="submit" value="提交">
    </form>
    
    <table>
        <tr>
            <td>交易时间</td>
            <td>支出</td>
            <td>收入</td>
            <td>交易类型</td>
            <td>余额</td>
            <td>备注</td>
        </tr>

        <c:forEach items="${map.list}" var="t" varStatus="status">
            <tr>
                <td>
                    <fmt:formatDate value="${t.transactionDate}"  pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
                <td>${t.expense}</td>
                <td>${t.income}</td>
                <td>${t.transactionType}</td>
                <td>${t.accountBalance}</td>
                <td>${t.remark}</td>
            </tr>

        </c:forEach>
        
    </table>

   <%-- <a href="/findTransactionRecord?nowPage=1">首页</a>
    <a href="/findTransactionRecord?nowPage=${map.nowPage-1}">上一页</a>
    <a href="/findTransactionRecord?nowPage=${map.nowPage+1}">下一页</a>
    <a href="/findTransactionRecord?nowPage=${map.totalPage}">末页</a>--%>
    <!--分页+条件-->

    <a href="#" onclick="fenyeFun(1)">首页</a>
    <c:if test="${map.nowPage>1}">
        <a href="#" onclick="fenyeFun(${map.nowPage-1})">上一页</a>
    </c:if>
    <c:if test="${map.nowPage<map.totalPage}">
        <a href="#" onclick="fenyeFun(${map.nowPage+1})">下一页</a>
    </c:if>
    <a href="#" onclick="fenyeFun(${map.totalPage})">末页</a>

    ${map.nowPage}页/${map.totalPage}页


<script>

    function fenyeFun(num) {
        console.log(num);
        var myForm = document.getElementById("myForm");
        document.getElementById("nowPage").value = num;
        var startDateObj = document.getElementById("startDate");
        var endDateObj = document.getElementById("endDate");

        if (startDateObj.value == null || startDateObj.value == ''){
            startDateObj.value = '2018-01-01';
        }
        if (endDateObj.value == null || endDateObj.value == ''){
            endDateObj.value = '2019-02-01';
        }

        //提交表单
        myForm.submit();
    }

</script>


</body>
</html>
