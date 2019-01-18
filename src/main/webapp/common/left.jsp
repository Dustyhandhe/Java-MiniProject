<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<hr>

<br>

    <a href="/findBalance" target="center">查询余额</a>
<br>
    <a href="transfer.jsp" target="center">转账</a>
    <br>
    <a href="/findTransactionRecord" target="center">查询交易记录</a>
    <br>
    <a href="updatePwd.jsp" target="center">修改密码</a>

</body>
</html>
