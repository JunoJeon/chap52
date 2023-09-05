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
	outline-color : red;
	outline-style : dotted;
}

table {
	font-size: 15pt;
	font-family: monospace;
	border-collapse: collapse;
	
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
	
	hero.onkeydown = function(e) {
		switch(e.key){
		case 'ArrowUp': {
			console.log("up")
			let prow = hero.parentElement.previousElementSibling;
			if(prow != null) {
				let hero_up = prow.cells[hero.cellIndex];
				let hero_left = hero.previousElementSibling;
				let hero_up_left = hero_up.previousElementSibling;
				
				let hero_parent = hero.parentElement;
				let hero_up_parent = hero_up.parentElement;
				
				hero.remove();
				hero_up.remove();
					
				if (hero_left == null) {
					
					hero_parent.prepend(hero_up);
					hero_up_parent.prepend(hero);
					
				} else {
					
					hero_left.after(hero_up);
					hero_up_left.after(hero);
				
				}
				
				hero.focus();
			}
			break;
		}
		case 'ArrowDown':{
			console.log("down")
			let nrow = hero.parentElement.nextElementSibling;
			if(nrow != null) {
				let hero_down = nrow.cells[hero.cellIndex];
				let hero_left = hero.previousElementSibling;
				let hero_down_left = hero_down.previousElementSibling;
				
				let hero_parent = hero.parentElement;
				let hero_down_parent = hero_down.parentElement;
				
				hero.remove();
				hero_down.remove();
				
				if(hero_left == null){
					
					hero_parent.prepend(hero_down);
					hero_down_parent.prepend(hero);
					
				} else {
					
					hero_left.after(hero_down);
					hero_down_left.after(hero);
				}
				
				hero.focus();
			}
			break;
		}
			
			break;
		case 'ArrowLeft':
			console.log("left")
			let hero_left = hero.previousElementSibling;
			if(hero_left != null) {
				hero_left.remove();
				hero.after(hero_left);
			}
			break;
		case 'ArrowRight':
			console.log("right")
			let hero_right = hero.nextElementSibling;
			if(hero_right != null) {
				hero_right.remove();
				hero.before(hero_right);
			}
			break;
		}
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
					<jsp:setProperty name = "alpha" property="fg" value="${Color.Black}"/>
					<jsp:setProperty name = "alpha" property="bg" value="${Color.Black}"/>
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