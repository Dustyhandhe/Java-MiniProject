<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">


    </style>
</head>
<body>


<div align="center"  style="width: 400px;height: 200px;border: 1px solid slategray;vertical-align: center; background-color: slategray;margin-top: 200px;
margin-left: 500px;">

      <H3>个人网上银行系统</H3>
        <form  method="post" action="/login" style="text-align: center;" >
                <input type="text" name="cardno" placeholder="请输入您的账号">
                <br>
                <INPUT type="password" name="password" placeholder="请输入您的密码">
                <br>
                <input type="submit" value="提交">
            </form>

</div>

</body>
</html>
