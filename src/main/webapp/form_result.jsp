<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form_result.jsp</title>
</head>
<body>
<h1> form 태그 전송결과 </h1>
<hr>
<%
	String name = request.getParameter("name");
	String search = request.getParameter("search");
%>

METHOD = <%= request.getMethod() %><br>
name = <%=name%><br>
search = <%=search%><br>
<hr>
METHOD = ${pageContext.request.method} <br>
name = ${param.name} <br>
search = ${param.search} <br>
<hr>
<%
	String name2 = request.getParameter("name");
	String[] names = request.getParameterValues("name");
%>

name = <%=name2%><br>
names = <%=Arrays.toString(names)%><br>
<hr>
<%
	var map = request.getParameterMap();
	for(var entry : map.entrySet()) {
		out.println(entry.getKey() + "=" + Arrays.toString(entry.getValue())+"<br>");
	}
%>
<hr>
<c:forEach var="entry" items="${pageContext.request.parameterMap}">
	<li>${entry} = &{entry.value}</li>
</c:forEach>
</body>
</html>