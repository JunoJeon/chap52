<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>audio.jsp</title>
</head>
<body>
<audio src="/media/Kalimba.mp3" controls="controls"></audio>
<hr>
<audio src="/media/Kalimba.mp3" controls="controls" preload="auto"></audio>
<hr>
<audio src="/media/Kalimba.mp3" 
	   controls="controls"
	   preload="auto">
</audio>
</body>
</html>