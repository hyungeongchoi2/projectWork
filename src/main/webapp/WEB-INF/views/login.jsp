<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script >
	$(function(){
		$("#loginBtn").click(function(){
			if(!$("#memId").val() ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if(!$("#password").val()){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			$("#frm").attr({"action":"login", "method" : "post"}).submit();
		})
	})
</script>
<body>
	
	<form id="frm">
		<div class="logBox">
			<div>Login</div>
			<div>아이디 : <input type="text" name="memId" id="memId" placeholder="아이디를 입력하세요" autocomplete="off" ></div>
			<div>비밀번호 : <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" autocomplete="off"></div>
			<div><input type="button" value="로그인" id="loginBtn"></div>
		</div>
	</form>
	

</body>
</html>