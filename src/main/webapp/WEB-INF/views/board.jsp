<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$("#schBtn").click(function(){
			
			$.ajax({
				url: "search",
				data: $("#fm").serialize(),
				type: "post",

				success : function(data){  
					console.log(data);
					$("#ffm").html(data);
				},
				error : function(){
					console.log("실패");
				}
			})
			
		})
		
	})
</script>
<body>
	<div>
		<div>${member.memName }(${member.rank })님 환영합니다 <input type="button" value="로그아웃" onclick="location.href='/'"></div>
		<div class="btnBox">
			<input type="hidden" name="rank" value="${member.rank }">
			<input type="button" value="글쓰기" onclick="location.href='signWrite'">
			<c:if test="${member.rank eq '과장' }">
				<input type="button" value="대리결제">			
			</c:if>
			<c:if test="${member.rank eq '부장' }">
				<input type="button" value="대리결제">			
			</c:if>
		</div>
		
		<form id="fm">
			<div class="selectBox">
				<select name="select">
					<option>선택</option>
					<option value="memId">작성자</option>
					<option value="signedId">결재자</option>
					<option value="subCon">제목 + 내용</option>
				</select>
				
				<input type="text" placeholder="검색어를 입력하세요" name="text" autocomplete="off">
				
				<select name="condition">
					<option value="total">결재상태</option>
					<option value="t">임시저장</option>
					<option value="w">결재대기</option>
					<option value="i">결재중</option>
					<option value="o">결재완료</option>
					<option value="r">반려중</option>
				</select>
			</div>
			<div class="dateBox">	
				<input type="date"> ~ <input type="date"> 
				<input type="button" value="검색" id="schBtn">  
			</div>
		</form>
		
		<form id="ffm">
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>결재일</th>
						<th>결재자</th>
						<th>결재상태</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="list" items="${list }">
								<tr onclick="location.href ='view?bnum=${list.bNum}'" style="cursor:pointer;">
									<td>${list.bNum }</td>
									<td>${list.member.memName }</td>
									<td>${list.subject }</td>
									<td><fmt:formatDate pattern="yyyy.MM.dd" type="date" value="${list.createdDate }" /></td>
									<td><fmt:formatDate pattern="yyyy.MM.dd" type="date" value="${list.signedDate }" /></td>
									<td>${list.signedName }</td>
									<c:if test="${list.signedCondition eq 't'}">
										<td>임시저장</td>
									</c:if>
									<c:if test="${list.signedCondition eq 'w'}">
										<td>결재대기</td>
									</c:if>
									<c:if test="${list.signedCondition eq 'i'}">
										<td>결재중</td>
									</c:if>
									<c:if test="${list.signedCondition eq 'o'}">
										<td>결재완료</td>
									</c:if>
									<c:if test="${list.signedCondition eq 'r'}">
										<td>반려</td>
									</c:if>
								</tr>
							
							</c:forEach>
							
						</c:when>
						<c:otherwise>
							<td colspan="7">등록된 게시글이 없습니다.</td>
						</c:otherwise>
					</c:choose>
					
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>