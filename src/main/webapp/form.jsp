<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
</head>
<body>
<h1> form 태그 실습 </h1>
<hr>
<a href="form_result.jsp?name=xxx">form_result.jsp</a>
<hr>
<form action="form_result.jsp" method = "get">
	<input type="text" name="search">
	<input type="submit">
</form>
<form action="form_result.jsp" method = "post">
	<input type="text" name="search">
	<input type="submit">
</form>
</body>
</html>