<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="https://heerey525.github.io/layui-v2.4.3/layui/css/layui.css">
<link rel="/css/bulma.css">
</head>
<body>
	<table border="1" style="text-align: center;border-spacing: 5px;border-collapse: collapse;">
		<tr>
			<th>考试title</th>
			<th>id</th>
			<th>名字</th>
			<th>操作</th>
			<th>状态</th>
		</tr>
		<c:forEach items="${table.rows}" var="item">
		<tr>
			<td>${item.examination.title}</td>
			<td>${item.user.username}</td>
			<td>${item.user.nickname}</td>
			<td><a href="/grade/mark?id=${item.id}">
					<c:if test="${item.status==0}">
						批阅
					</c:if>
					<c:if test="${item.status==1}">
						查看
					</c:if>
				</a>
			</td>
			<td>
				<c:if test="${item.status==0}">
					待批改
				</c:if>
				<c:if test="${item.status==1}">
					已批改
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>
