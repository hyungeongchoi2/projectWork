<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("tr").eq(3).append("","doctor");
		
		$("tr > td").eq(3).mouseover(function(){
			alert("22");
		})
		
		
	})
	
</script>
</head>
<body>
	<table border=1>
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>직업</td>
		</tr>
		<tr>
			<td>kim</td>
			<td>20</td>
			
		</tr>
		<tr>
			<td>lee</td>
			<td>25</td>
			<td >programmer</td>
		</tr>
		<tr>
			<td>choi</td>
			<td>30</td>
			
		</tr>
	</table>
</body>
