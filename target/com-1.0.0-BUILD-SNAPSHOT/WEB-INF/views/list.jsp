<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>List</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
$(function(){
	$("#delete").click(function(){
		$("#fm").attr({action:"delete", method:"post"}).submit();
	})
	
	$("#searchBtn").click(function(){
		$("[name=selectOption]").val('${searchMap.selectOption}');
	})

})
</script>
<body>
	
	<div>
		<form id="frm" name="frm"  action="list" method="post">
			<select name="selectOption">
				<option value="total">전 체</option>
				<option value="name">작성자</option>
				<option value="id">ID</option>
				<option value="subj">제목</option>
				<option value="cont">제목 + 내용</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${searchMap.keyword }">
			<input type="submit" value="검색" id="searchBtn">
			<br>
			<input type="date" name="stDate" value="${searchMap.stDate }"> - <input type="date" name="enDate" value="${searchMap.enDate }">
		</form>
	</div>
	
	<input type="button" value="글쓰기" onclick="location.href='write'">
	<input type="button" value="삭제" id="delete">
	
	
	<form id="fm" name="fm">
		<table border="1">
			<tr>
				<th><input type="checkbox" size="1"></th>
				<th>글번호</th>
				<th>작성자(ID)</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
			
				<c:forEach var="list" items="${list}">
					<tr>
						<td><input type="checkbox"  size="1" name="seqs" value="${list.seq }"></td>
						<td>${list.seq }</td>
						<td>${list.memName }(${list.memId })</td>
						<td><a href="view?seq=${list.seq }" style="text-decoration-line:none; color:black">${list.boardSubject }</a></td>
						<td>${list.regDate}</td>
						<td>${list.uptDate }</td>
						<td>${list.viewCnt }</td>
					</tr>
				</c:forEach>
			
		</table>
	</form>

</body>
</html>
