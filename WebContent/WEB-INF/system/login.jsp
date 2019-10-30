<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="/css/login.css"/>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/login.js"></script>
</head>
<body>
		<div class="head-imgline"><!-- 熊猫头 -->
			<div class="head-imgbox">
				<img src="/img/head.png" />
			</div>
		</div>
		<div class="login-box">
			<div class="login-content">
				<form id="studentLoginForm" action="login" method="post" autocomplete="off">
				   <h2>login</h2>
				   <p><label style="margin-left: 25px; line-height: 30px;">用户名</label><input class="uname" type="text" name="username" id="username" placeholder="-username-" max="14" min="3"  style="border-radius:10px;font-size: 15px;"/></p>
				   <p><label style="margin-left: 25px; line-height: 30px;">密&nbsp;&nbsp;&nbsp;码</label><input class="pwd" type="password" name="password" id="password" placeholder="-password-" style="border-radius:10px;font-size: 15px;"/></p>
				   <p><label style="margin-left: 25px;line-height: 30px;">记住我&nbsp;</label><input type="checkbox" name="rememberMe" value="1" style="border-radius:10px;"/></p>
				   <p><input class="safebtn" type="button" name="btn" id="studentLoginBtn" value="安全登录" style="border-radius:10px;color: #ffffff;font-size: 15px" /></p>
			   </form>
			</div>
			<div class="footer">
				<p align="center" style="color: #CCCCCC ;" ><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;注册</a>&nbsp;|&nbsp;<a href="#">忘记密码</a></p>
			</div>
		</div>
	
<script>
	$(function () {
	    $("#forgetPasswordBtn").on('click', function(){
	    	layer.msg("请联系管理员重置");
	    })
	    $("#studentLoginBtn").on('click', function () {
	        $.ajax({
	            type: "POST",
	            url: "/login",
	            data: $("#studentLoginForm").serialize(),
	            dataType: "json",
	            success: function (data) {
	                if (data.status == 200) {
	                    layer.msg(data.msg, {
	                        offset: '30%',
	                        time: 800
	                    }, function () {
	                        window.location.href = "/";
	                    });
	                }else{
	                    layer.msg(data.msg, {
	                        icon: 2,
	                        offset: '30%',
	                        time: 2000
	                    });
	                    //$("#verificationCode").click();
	                }
	            }
	        });
	    });
	    $(document).keyup(function (event) {
	        if (event.keyCode == 13) {
	            $("#studentLoginBtn").click();
	        }
	    });
	})
</script>
</body>
</html>