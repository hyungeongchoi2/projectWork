<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Write here</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#addBtn").click(function(){
			$("#fm").attr({action:"write", method:"post"}).submit();
		})
		
		$("#saveBtn").click(function(){
			$("#fm").attr({action:"update", method:"post"}).submit();
		})
		
	})
</script>
<body>
	<form name="fm" id="fm">
		<table>
			<tr>
				<td>작성자 : </td>
				<td><input type="text" name="memName" id="memName" value="${view.memName }"></td>
			</tr>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="memId" id="memId" value="${view.memId }"></td>
			</tr>
			<tr>
				<td>제목 : </td>
				<td><input type="text" name="boardSubject" id="boardSubject" value="${view.boardSubject }"></td>
			</tr>
			<tr>
				<td>내용 : </td>
				<td><textarea name="boardContent" id="boardContent" cols="" rows="" >${view.boardContent }</textarea></td>
			</tr>
			
		</table>
		<c:choose>
			<c:when test="empty ${view }"><input type="button" value="등록" id="addBtn"></c:when>
			<c:otherwise>
				<input type="hidden" value="${view.seq }" name="seq"> 
				<input type="button" value="목록" id="listBtn" onclick="location.href='list'">
				<input type="button" value="수정" id="saveBtn">
			</c:otherwise>
		</c:choose>
		
	</form>
</body>
</html>