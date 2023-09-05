<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>video.jsp</title>
<script type="text/javascript">
window.onload = function() {
	video.play();
}
</script>
</head>
<body>
<h1>Video 실습</h1>
<hr>
<video src="/media/Wildlife.mp4" width="300"></video>
<hr>
<video src="/media/Wildlife.mp4" width="200" controls="controls"></video>
<hr>
<video id="video"
	   src="/media/Wildlife.mp4" 
	   width="500"
	   controls="controls"
	   preload="auto"
	   autoplay="autoplay"
	   poster="http://via.placeholder.com/300x400">
</video>
</body>
</html>