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
	<table>
		<tr>
			<td>Title</td>
			<td><c:out value="${lookify.name}" /></td>
		</tr>
		<tr>
			<td>Artist</td>
			<td><c:out value="${lookify.artist}" /></td>
		</tr>
		<tr>
			<td>Rating(1-10)</td>
			<td><c:out value="${lookify.rating}" /></td>
		</tr>
	</table>
	<a href="/lookify/<c:out value="${lookify.id}"/>/delete">Delete</a>
</body>
</html>