<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 上午11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="static/js/jquery-1.11.0.js"></script>
    <script type="text/javascript">

        var  f = false;

        $(function () {

            $("#cardNo").blur(function(){

                $.get("/checkCardNo",{cardNo:$(this).val()},function(r){

                    if (r.code==0){
                        $("#cardNoMsg").html("✅");
                        f = true;
                    } else{
                        f = false;
                        $("#cardNoMsg").html(r.msg);
                        $("#cardNoMsg").css("color","red");

                    }

                });

            });

            $("#money").blur(function(){

                $.get("/checkMoney",{money:$(this).val()},function(r){

                    if (r.code==0){
                        $("#moneyMsg").html("✅");
                        f = true;
                    } else{
                        f = false;
                        $("#moneyMsg").html(r.msg);
                        $("#moneyMsg").css("color","red");
                    }

                });

            });


        });

        function checkAll(){

            return f;
        }

    </script>

</head>
<body>

<h1>当前操作：转账</h1>

<form action="/transfer" method="post" onsubmit="return checkAll();">

    <table border="1">
        <tr>
            <td>账号</td>
            <td>
                <input type="text" name="cardno" id="cardNo">
                <span id="cardNoMsg"></span>
            </td>
        </tr>
        <tr>
            <td>金额</td>
            <td>
                <input type="text" name="money" id="money">
                <span id="moneyMsg"></span>
            </td>
        </tr>

        <tr>

            <td colspan="2">
                <input type="button" onclick="submit" value="转账">
            </td>
        </tr>


    </table>

</form>


</body>
</html>
