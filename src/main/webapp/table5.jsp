<%@ page import="util.Color" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table.jsp</title>

<!-- 

	1. DOM 검색 
		- querySelector
		- hero.parentElement(부모)
		- hero.previousElementSibling (형)
		- hero.nextElementSibling (동생)
				// 함수가아니라 프로포티 필드같은아이
	2. DOM 삭제
		- hero.remove()
	
	3. DOM 추가
		- hero.brfore()
		- hero.after()
		- hero.prepend()
		- hero.append()

-->

<style type="text/css">
:focus {
	outline-color : Cyan;
	outline-style : dotted;
	outline-width: 2px;
}

table {
	font-size: 15pt;
	font-family: monospace;
	border-collapse: collapse;
	
}
</style>
<script type="text/javascript" src="/js/table5.js"></script>
</head>
<body>
<h1>Alpha Cursor Move</h1>
<hr>
<table id="table" tabindex="0">
	<tbody>
		<c:forEach var="i" begin="0" end="19">
			<tr>
				<c:forEach var="j" begin="0" end="39">
					<jsp:useBean id="alpha" class="util.Alpha"/>
					<jsp:setProperty name = "alpha" property="fg" value="${Color.Black}"/>
					<jsp:setProperty name = "alpha" property="bg" value="${Color.Black}"/>
					<td style="color:${alpha.fg}; background:${alpha.bg};">${alpha.ch}</td>
					<c:remove var="alpha"/>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
</table>
<hr>
<button> V </button>
</body>
</html>