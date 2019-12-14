<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>登录页面</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/登录页面.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/login.js"></script>
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/登录页面.js"></script>
</head>

<body>
	<div class="login">
		<form id="studentLoginForm">
			<div class="title">
				<h1>
					<img src="/img/1.png" alt=""> 辅助教学平台登录
				</h1>
			</div>
			<!-- <div class="username"><span>账号: </span> <input class="form-control" type="text" id="username"></div> -->
			<div class="input-container">
				<input type="text" id="username" name="username" placeholder="请输入账号"> <label
					for="input">请输入账号</label>
				<div class="bottom-line"></div>
			</div>
			<!-- <div class="password"><span>密码: </span><input class="form-control" type="password" id="password"></div> -->
			<div class="input-container">
				<input type="password" id="password" name="password" placeholder="请输入密码"> <label
					for="input">请输入密码</label>
				<div class="bottom-line"></div>
			</div>


			<!-- <div class="remember">
        <input type="checkbox" id="rememberMe" name="rememberMe" value="1"><label for="rememberMe"><span>
            记住密码</span></label>
      </div> -->
		</form>
		<p class="message">请输入6~16位密码</p>
		<div>
			<button class="btn" id="studentLoginBtn">登录</button>
		</div>
	</div>


	<script>
		$(function() {
			$("#forgetPasswordBtn").on('click', function() {
				layer.msg("请联系管理员重置");
			})
			$("#studentLoginBtn").on('click', function() {
				$.ajax({
					type : "POST",
					url : "/login",
					data : $("#studentLoginForm").serialize(),
					dataType : "json",
					success : function(data) {
						if (data.status == 200) {
							layer.msg(data.msg, {
								offset : '30%',
								time : 800
							}, function() {
								window.location.href = "/";
							});
						} else {
							layer.msg(data.msg, {
								icon : 2,
								offset : '30%',
								time : 2000
							});
							//$("#verificationCode").click();
						}
					}
				});
			});
			$(document).keyup(function(event) {
				if (event.keyCode == 13) {
					$("#studentLoginBtn").click();
				}
			});
		})
	</script>
</body>
</html>