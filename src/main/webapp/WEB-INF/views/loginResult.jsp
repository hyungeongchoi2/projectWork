<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script >
	$(function(){
		
		$("#login").click(function(){
			$("#fm").attr({"action" : "board", "method" : "post"}).submit();
		})
	})
</script>
<body>
	<form id="fm">
	
		<c:if test="${isId == false }">
			<div>등록되지 않은 사용자입니다.<input type="button" value="확인" onclick="location.href = '/'"></div>			
		</c:if>
		
		<c:if test="${isLogin == false }">
			<div>비밀번호가 일치하지 않습니다. <input type="button" value="확인" onclick="location.href = '/'"></div>	
		</c:if>
		
		<c:if test="${isLogin == true }">
			<div>로그인 성공 <input type="button" value="확인" id="login"><input type="hidden"  name="id" value="${id }"></div>		
		</c:if>	
	</form>

</body>
</html>