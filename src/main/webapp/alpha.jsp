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
<table id="table">
	<tbody>
		<c:forEach var="i" begin="1" end="${param.line==null || param.line=='' ? 1:param.line}">
			<tr>
				<c:forEach var="j" begin="1" end="${param.column==null || param.column=='' ? 1:param.column}">
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
	에러입니다.<br>
	line, column은 0 이상의 양수 이어야 합니다.<br>
	line = ${param.line} <br>
	column = ${param.column}<br>
</c:if> 
</body>
</html>