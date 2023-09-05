<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table.jsp</title>
<style type="text/css">
:focus {
	outline-color : red;
	outline-style : dotted;
}

table {
	font-size: 15pt;
	font-family: monospace;
	
}
</style>
<script type="text/javascript">
window.onload = () => {
	let table = document.querySelector('table');
	
	let hero = table.rows[10].cells[20]
	hero.style.color = 'red';
	hero.style.removeProperty('background');
	hero.innerText='@';
	hero.tabIndex = 1;
	
	table.onclick = function() {
		hero.focus();
	}
}
</script>
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
					<td style="color:${alpha.fg}; background:${alpha.bg};">${alpha.ch}</td>
					<c:remove var="alpha"/>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<button>Start</button>
</body>
</html>