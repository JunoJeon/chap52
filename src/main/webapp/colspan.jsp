<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>colspan.jsp</title>
<script type="text/javascript">
function printPos(e) {
	let td = e.target;
	let tr = td.parentElement;
	console.log('[\${tr.rowIndex}],[\${tr.cellIndex}],[\${}]')
}
</script>
</head>
<body>
<h1> colspan / rowspan 실습 </h1>
<table border ="1" width = "500" onclick = "printPos(event)">
	<thead>
		<tr>
			<th colspan="2">Postion</th>
			<th colspan="2">Color</th>
			<th></th>
		</tr>
		<tr>
			<th>line</th>
			<th>column</th>
			<th>fg</th>
			<th>bg</th>
			<th>ch</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>10</td>
			<td rowspan ="2">20</td>
			<td>Red</td>
			<td>Blue</td>
			<td>A</td>
		</tr>
		<tr>
			<td>15</td>                  
			<td>Yellow</td>
			<td>Black</td>
			<td rowspan = "2">Z</td>
		</tr>
		<tr>
			<td>25</td>
			<td>15</td>
			<td>Magenta</td>
			<td>Cyan</td>                   
		</tr>
	</tbody>
</table>
</body>
</html>