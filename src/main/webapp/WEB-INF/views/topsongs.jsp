<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
	<h1>Top Ten Songs</h1>
	<a href="/dashboard">Dashboard</a> 
	<ul>
		<c:forEach items="${songs}" var="song">
			<li>
				<c:out value="${song.rating}"/> - <a href="/lookify/${song.id}"><c:out value="${song.name}"/></a> - <c:out value="${song.artist}"/>
			</li>
		</c:forEach>
	</ul>
</body>
</html>