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
	<h1>Songs by artist: <c:out value="${artist}"/></h1>
	<a href="/dashboard">Dashboard</a> 
	<form action="/search" method="post">
		<input type="search" name="artist" placeholder="artist">
		<input type="submit" value="Search Artists">
	</form>
	<table class="table table-striped">
		<tr>
			<th>Title</th>
			<th>Rating</th>
			<th>Actions</th>
		</tr>
		<c:forEach items="${songs}" var="song">
   			<tr>    
  				<td><a href="/lookify/${song.id}"><c:out value="${song.name}"/></a></td>
   				<td><c:out value="${song.rating}"/></td>
   				<td><a href="/lookify/${song.id}/delete">Delete</a></td>
   			</tr>
		</c:forEach>
	</table>
</body>
</html>