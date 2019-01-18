<%--
  Created by IntelliJ IDEA.
  User: liliting
  Date: 2019/1/16
  Time: 下午3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="/static/js/jquery-1.11.0.js"></script>
</head>
<body>
<form  method="post" action="/updatePwd" style="text-align: center;" onsubmit="return check();" >
    <input type="password" onblur="checkPwd(this)" name="password" placeholder="请输入您原密码">
    <span id="password_msg"></span>
    <br>
    <INPUT type="password" name="newPassword" placeholder="请输入您的新密码">
    <br>
    <INPUT type="password" name="reNewPassword" placeholder="请再次输入您的新密码">

    <input type="submit" value="提交">
</form>

<script>

    var f = false;

    function checkPwd(obj){
        var password = obj.value;

        $.ajax({
            url:'/checkPassword',
            data:{"password":password},
            dataType:'json',
            success:function(r){
                if (r.code!=0){
                    $("#password_msg").html("密码输入不正确");
                    $("#password_msg").css("color","red");
                    f = false;
                }else{
                    f = true;
                }


            }
        });
    }


    function check(){
        console.log(f);
        return f;
    }

</script>



</body>
</html>
