<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				
			</thead>
		</table>