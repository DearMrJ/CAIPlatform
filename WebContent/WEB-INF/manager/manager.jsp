<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>45后台管理</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="/css/font.css">
		<link rel="stylesheet" href="/css/weadmin.css">
		<script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>

	</head>

	<body>
		<!-- 顶部开始 -->
		<div class="container">
			<div class="logo">
				<a href="/manage">45后台管理</a>
			</div>
			<div class="left_open">
				<!-- <i title="展开左侧栏" class="iconfont">&#xe699;</i> -->
				<i title="展开左侧栏" class="layui-icon layui-icon-shrink-right"></i>
				
			</div>
			<ul class="layui-nav left fast-add" lay-filter="">
				<li class="layui-nav-item">
					<a href="javascript:;">+新增</a>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd>
							<a onclick="WeAdminShow('资讯','https://www.baidu.com/')"><i class="layui-icon layui-icon-list"></i>资讯</a>
						</dd>
						<dd>
							<a onclick="WeAdminShow('图片','http://www.baidu.com')"><i class="layui-icon layui-icon-picture-fine"></i>图片</a>
						</dd>
						<dd>
							<a onclick="WeAdminShow('用户','https://www.jiuwei.com/')"><i class="layui-icon layui-icon-user"></i>用户</a>
						</dd>
					</dl>
				</li>
			</ul>
			<ul class="layui-nav right" lay-filter="">
				<li class="layui-nav-item">
					<a href="javascript:;"><shiro:principal property="nickname"/></a>
					<dl class="layui-nav-child">
						<!-- 二级菜单 -->
						<dd>
							<a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
						</dd>
						<dd>
							<a onclick="WeAdminShow('切换帐号','/logout')">切换帐号</a>
						</dd>
						<dd>
							<a class="loginout" href="/logout">退出</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item to-index">
					<a href="/" target="_blank">前台首页</a>
				</li>
			</ul>

		</div>
		<!-- 顶部结束 -->
		<!-- 中部开始 -->
		<!-- 左侧菜单开始 -->
		<div class="left-nav">
            <div id="side-nav">
              <ul class="nav" id="nav" style="background-color: rgb(246, 248, 249);">
              	<shiro:hasRole name="administrator">
                <li id="menu1" class=""><a _href=""><i class="iconfont"></i><cite>学院管理</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu" style="display: none;">
                    <li id="menu2"><a _href=""><i class="iconfont"></i><cite>学院列表</cite></a></li>
                    <li id="menu3"><a _href=""><i class="iconfont"></i><cite>学院xx</cite></a></li>
                  </ul>
                </li>
                </shiro:hasRole>
                <shiro:hasRole name="teacher">
                <li id="menu4" class=""><a _href=""><i class="iconfont"></i><cite>课程管理</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu" style="display: none; height: 120px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
                    <li id="menu5"><a _href=""><i class="iconfont"></i><cite>课程列表</cite></a></li>
                    <li id="menu6"><a _href=""><i class="iconfont"></i><cite>课程xx</cite></a></li>
                  </ul>
                </li>
                </shiro:hasRole>
                <shiro:hasRole name="teacher">
                <li id="menu7"><a _href=""><i class="iconfont"></i><cite>考勤管理</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu">
                    <li id="menu8"><a _href="attendance/list"><i class="iconfont"></i><cite>考勤列表</cite></a></li>
                    <li id="menu9"><a _href=""><i class="iconfont"></i><cite>考勤xx</cite></a></li>
                  </ul>
                </li>
                </shiro:hasRole>
                <shiro:hasRole name="teacher">
                <li id="menu10"><a _href=""><i class="iconfont"></i><cite>考试管理</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu">
                    <li id="menu11"><a _href=""><i class="iconfont"></i><cite>考试列表</cite></a></li>
                    <li id="menu12"><a _href=""><i class="iconfont"></i><cite>考试管理</cite></a></li>
                  </ul>
                </li>
                </shiro:hasRole>
                <shiro:hasRole name="administrator">
                <li id="menu13"><a _href=""><i class="iconfont"></i><cite>权限管理</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu">
                    <li id="menu14"><a _href=""><i class="iconfont"></i><cite>用户列表</cite></a></li>
                    <li id="menu15"><a _href=""><i class="iconfont"></i><cite>角色管理</cite></a></li>
                    <li id="menu16"><a _href=""><i class="iconfont"></i><cite>权限分类</cite></a></li>
                  </ul>
                </li>
                </shiro:hasRole>
                <shiro:hasAnyRoles name="administrator,teacher">
                <li id="menu18"><a _href=""><i class="iconfont"></i><cite>系统统计</cite><i class="iconfont nav_right"></i></a>
                  <ul class="sub-menu">
                    <li id="menu19"><a _href=""><i class="iconfont"></i><cite>拆线图</cite></a></li>
                    <li id="menu20"><a _href=""><i class="iconfont"></i><cite>柱状图</cite></a></li>
                    <li id="menu21"><a _href=""><i class="iconfont"></i><cite>地图</cite></a></li>
                  </ul>
                </li>
                </shiro:hasAnyRoles>
              </ul>
            </div>
          </div>

		<!-- <div class="x-slide_left"></div> -->
		<!-- 左侧菜单结束 -->
		<!-- 右侧主体开始 -->
		<div class="page-content">
			<div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip" lay-allowclose="true">
				<ul class="layui-tab-title" id="tabName">
					<li>我的桌面</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<iframe src='/welcome.jsp' frameborder="0" scrolling="yes" class="weIframe" id="container"></iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="page-content-bg"></div>
		<!-- 右侧主体结束 -->
		<!-- 中部结束 -->
		<!-- 底部开始 -->
		<div class="footer">
			<div class="copyright">Copyright ©2018 WeAdmin v1.0 All Rights Reserved</div>
		</div>
		<!-- 底部结束 -->
		<script type="text/javascript">
//			layui扩展模块的两种加载方式-示例
//		    layui.extend({
//			  admin: '{/}../../static/js/admin' // {/}的意思即代表采用自有路径，即不跟随 base 路径
//			});
//			//使用拓展模块
//			layui.use('admin', function(){
//			  var admin = layui.admin;
//			});


			/* layui.config({
				base: '/js/'
				,version: '101100'
			}).extend({ //设定模块别名
				admin: 'admin'
				,menu: 'menu'
			});
			layui.use(['jquery', 'admin', 'menu'], function(){
				var $ = layui.jquery,
					admin = layui.admin,
					menu = layui.menu;
				$(function(){
					menu.getMenu('/json/menu.json');
					var login = JSON.parse(localStorage.getItem("login"));
					if(login){
						if(login===0){
							window.location.href='/login';
							return false;
						}else{
							return false;
						}
					}else{
						window.location.href='#';
						return false;
					}
				});
			});
 */
		 layui.config({
		     base: '/js/'
		     , version: '101100'
		   }).extend({ //设定模块别名
		     admin: 'admin'
		     , menu: 'menu'
		   });
		   layui.use(['jquery', 'admin', 'menu'], function () {
		     var $ = layui.jquery,
		       admin = layui.admin,
		       menu = layui.menu;
		   });
		</script>
	</body>
	<!--Tab菜单右键弹出菜单-->
	<ul class="rightMenu" id="rightMenu">
        <li data-type="fresh">刷新</li>
        <li data-type="current">关闭当前</li>
        <li data-type="other">关闭其它</li>
        <li data-type="all">关闭所有</li>
    </ul>

</html>