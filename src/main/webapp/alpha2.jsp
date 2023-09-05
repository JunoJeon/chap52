<%@page import="com.example.alpha.Alphaparam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alpha.jsp</title>
<style type="text/css">
table {
	font-size: 15pt;
	font-family: monospace;
}
</style>
</head>
<body>
<h1>Alpha Generator</h1>
<hr>
<c:catch var="e">
<%
	var mapping = new Alphaparam();
	mapping.setLine(request.getParameter("line"));
	mapping.setColumn(request.getParameter("column"));
	pageContext.setAttribute("mapping", mapping);
%>

<table id="table">
	<tbody>
	<c:forEach var="i" begin="1" end="${mapping.line}">
		<tr>
		<c:forEach var="j" begin="1" end="${mapping.column}">
			<jsp:useBean id="alpha" class="util.Alpha"/>
			<td style="color:${alpha.fg}; background:${alpha.bg};">${alpha.ch}</td>
			<c:remove var="alpha"/>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>

</c:catch>
<hr>
<c:if test="${e!=null}">
	${e.message}
</c:if> 
</body>
</html>