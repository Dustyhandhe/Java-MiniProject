<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 上午11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        #center{
            float: right;
        }

    </style>
</head>


<%--<frameset rows="20%,80%">--%>
<%--<frame src="common/header.jsp" frameborder="1">--%>

<%--<frameset columns="20%,*">--%>
<%--<frame src="common/left.jsp" frameborder="1">--%>

<%--<frame name="center">--%>

<%--</frameset>--%>

<%--</frameset>--%>

<jsp:include page="common/left.jsp"></jsp:include>

<div id="center" style="width: 80%;height: 700px;border: 1px solid black;">
    <iframe name="center" src="welcome.jsp" style="width: 80%;height: 700px;" frameborder="0"></iframe>

</div>

</html>
