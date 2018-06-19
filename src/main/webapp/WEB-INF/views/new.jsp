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
<form action="/lookify" method="POST">
  <div class="form-group">
    <label>Title</label>
    <input type="text" class="form-control" name="name">
  </div>
   <div class="form-group">
    <label>Artist</label>
    <input type="text" class="form-control" name="artist">
  </div>
  <div class="form-group">
    <label>Rating(1-10)</label>
    <select class="form-control" id="rating" name="rating">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
      <option>6</option>
      <option>7</option>
      <option>8</option>
      <option>9</option>
      <option>10</option>
    </select>
  </div>
  
  <button class="btn btn-success">Add Song</button>
  
</form>
	
</body>
</html>