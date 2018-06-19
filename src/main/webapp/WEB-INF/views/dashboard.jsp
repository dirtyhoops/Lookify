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
<h1>All Songs</h1>

<a href="/lookify/new">Add new</a> | <a href="/search/topTen">Top Songs</a> | 
	<form action="/search" method="post">
		<input type="search" name="artist" placeholder="artist">
		<input class="btn btn-success" type="submit" value="Search Artists">
	</form>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Name</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${lookifies}" var="lookify">
        <tr>
            <td><a href="/lookify/<c:out value="${lookify.id}"/>"><c:out value="${lookify.name}"/></a></td>
            <td><c:out value="${lookify.rating}"/></td>
            <td><a href="/lookify/<c:out value="${lookify.id}"/>/delete" class="btn btn-danger">Delete</a><a href="/lookify/<c:out value="${lookify.id}"/>/edit" class="btn btn-success">Edit</a></td>
        </tr>
        </c:forEach>
    </tbody>
</table>

	
</body>
</html>