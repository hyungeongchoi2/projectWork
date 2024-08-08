<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	$(function(){
		//수정 못하게 변경(signed_condition 에 따라서)- 제목, 내용
		if('${view.signedCondition}' == '' ){
			$("#sub").attr("disabled", false);
			$("#con").attr("disabled", false);
			$("#returnBtn").attr("type", "hidden");
		} else if('${view.signedCondition}' == 't'){
			$("#sub").attr("disabled", false);
			$("#con").attr("disabled", false);
			if('${member.rank}' == '과장' || '${member.rank}' == '부장'){
				$("#returnBtn").attr("type", "hidden");
			}
		} else if('${view.signedCondition}' == 'r'){
			if('${member.memId}' == '${view.memId}'){
				$("#sub").attr("disabled", false);
				$("#con").attr("disabled", false);
				$("#uptBtn").attr("type", "button");
				$("#signUptBtn").attr("type", "button");
				$("#returnBtn").attr("type", "hidden");
			} 
				$("#sub").attr("disabled", true);
				$("#con").attr("disabled", true);
				$("#uptBtn").attr("type", "hidden");
				$("#signUptBtn").attr("type", "hidden");
				$("#returnBtn").attr("type", "hidden");
			
		} else {
			$("#sub").attr("disabled", true);
			$("#con").attr("disabled", true);
			$("#uptBtn").attr("type", "hidden");
			$("#saveBtn").attr("type", "hidden");
		}
		
		//컨디션에 따라서 버튼 안보이게
		if('${view.signedCondition}' == 'w'){
			if('${member.rank}' == '사원' || '${member.rank}' == '대리'){
				$("#signUptBtn").attr("type", "hidden");
			}
		} else if('${view.signedCondition}' == 'i'){
			if('${member.rank}' == '과장'){
				$("#signUptBtn").attr("type", "hidden");
				$("#returnBtn").attr("type", "hidden");
			}
			
		} else if('${view.signedCondition}' == 'o'){
			$("#signUptBtn").attr("type", "hidden");
			$("#returnBtn").attr("type", "hidden");
		}
		
		//임시저장누르면
		$("#saveBtn").click(function(){
			if($("#sub").val() == null || $("#sub").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			if($("#con").val() == null || $("#con").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			$("#cdt").attr("value", "t");
			$("#signedId").attr("value" , "${member.memId}");
			$("#wfm").attr({"action": "signInsert", "method":"post"}).submit();
		})
		
		//결재버튼 누르면
		$("#signBtn").click(function(){
			if($("#sub").val() == null || $("#sub").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			if($("#con").val() == null || $("#con").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			
			if('${member.rank}' == '사원' || '${member.rank}' == '대리'){
				$("#cdt").attr("value", "w");
			} else if('${member.rank}' == '과장'){
				$("#cdt").attr("value", "i");
			} else if('${member.rank}' == '부장'){
				$("#cdt").attr("value", "o");
			}
			
			$("#wfm").attr({"action": "signInsert", "method":"post"}).submit();
		
		})
		
		//임시저장 업데이트 버튼 누르면
		$("#uptBtn").click(function(){
			if($("#sub").val() == null || $("#sub").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			if($("#con").val() == null || $("#con").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			$("#cdt").attr("value", "t");
			$("#wfm").attr({"action" : "updateT", "method" : "post"}).submit();
		})
		
		//결재 업데이트 버튼 누르면
		$("#signUptBtn").click(function(){
			if($("#sub").val() == null || $("#sub").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			if($("#con").val() == null || $("#con").val() == ''){
				alert("빈칸을 입력해주세요");
				return;
			}
			
			if('${member.rank}' == '사원' || '${member.rank}' == '대리'){
				$("#cdt").attr("value", "w");
			} else if('${member.rank}' == '과장'){
				$("#cdt").attr("value", "i");
			} else if('${member.rank}' == '부장'){
				$("#cdt").attr("value", "o");
			}
			
			$("#signedId").attr("value" , "${member.memId}");
			$("#wfm").attr({"action" : "updateCondition", "method" : "post"}).submit();
		})
		
		//반려 버튼 누르면
		$("#returnBtn").click(function(){
			$("#cdt").attr("value", "r");
			$("#signedId").attr("value" , "${member.memId}");
			$("#wfm").attr({"action" : "updateCondition", "method" : "post"}).submit();
		})
		
		
	})
</script>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<div>
		<table border="1">
			<tr>
				<th>결재요청</th>
				<th>과장</th>
				<th>부장</th>
			</tr>
			<tr>
			<c:choose>
				<c:when test="${view.signedCondition eq 'w'}">
					<td><input type="checkbox" disabled="disabled" checked></td>
					<td><input type="checkbox" disabled="disabled"></td>
					<td><input type="checkbox" disabled="disabled"></td>
				</c:when>
				<c:when test="${view.signedCondition eq 'i'}">
					<td><input type="checkbox" disabled="disabled" checked></td>
					<td><input type="checkbox" disabled="disabled" checked></td>
					<td><input type="checkbox" disabled="disabled"></td>
				</c:when>
				<c:when test="${view.signedCondition eq 'o'}">
					<td><input type="checkbox" disabled="disabled" checked></td>
					<td><input type="checkbox" disabled="disabled" checked></td>
					<td><input type="checkbox" disabled="disabled" checked></td>
				</c:when>
				<c:otherwise>
					<td><input type="checkbox" disabled="disabled" ></td>
					<td><input type="checkbox" disabled="disabled"></td>
					<td><input type="checkbox" disabled="disabled"></td>
				</c:otherwise>
			</c:choose>
					
			</tr>
		</table>
	</div>
	<form id="wfm" accept-charset="utf-8">
		<div class="inputBox">
			<c:choose>
				<c:when test="${not empty view }">
					<div>번호:<input type="text" value="${view.bNum}" disabled="disabled"></div>
					<input type="hidden" name="bNum" value="${view.bNum}">
					<div>작성자:<input type="text" value="${view.member.memName }" disabled="disabled"></div>
				</c:when>
				<c:otherwise>
					<div>번호:<input type="text" value="${num }" disabled="disabled"></div>
					<div>작성자:<input type="text" value="${member.memName }" disabled="disabled"></div>
				</c:otherwise>
			</c:choose>
			
			
			
			<div>제목:<input type="text" id="sub" name="subject" value="${view.subject }" autocomplete="none"></div>
			<div>내용:<textarea id="con" name="content" >${view.content }</textarea></div>
			<input type="hidden" name="memId" value="${member.memId }">
			<input type="hidden" name="signedCondition" id="cdt">
			<input type="hidden" name="bNum" value="${num }">
			<input type="hidden" name="signedId" id="signedId">
		</div> 
		
		<div class="btnBox">
			<c:choose>
				<c:when test="${member.rank eq '과장'}">
					<input type="button" value="반려" id="returnBtn">
				</c:when>
				<c:when test="${member.rank eq '부장'}">
					<input type="button" value="반려" id="returnBtn">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${not empty view }">
					<input type="button" value="임시저장" id="uptBtn" >
					<input type="button" value="결재" id="signUptBtn" >
				</c:when>
				<c:otherwise>
					<input type="button" value="임시저장" id="saveBtn" >
					<input type="button" value="결재" id="signBtn" >	
				</c:otherwise>
			</c:choose>
			
		</div>
	</form>
	
	
		<table border="1">
		<tr>
			<td>번호</td>
			<td>결재일</td>
			<td>결재자</td>
			<td>결재상태</td>
		</tr>
		
		
			<c:choose>
				<c:when test="${not empty history}">
					<c:forEach var="his" items="${history }" >
					<tr>
						<td>${his.hNum }</td>
						<td><fmt:formatDate pattern="yyyy.MM.dd" type="date" value="${his.signedDate }" /></td>
						 <td>${his.member.memName }</td>
						<c:if test="${his.signedCondition eq 't'}">
							<td>임시저장</td>
						</c:if>
						<c:if test="${his.signedCondition eq 'w'}">
							<td>결재대기</td>
						</c:if>
						<c:if test="${his.signedCondition eq 'i'}">
							<td>결재중</td>
						</c:if>
						<c:if test="${his.signedCondition eq 'o'}">
							<td>결재완료</td>
						</c:if>
						<c:if test="${his.signedCondition eq 'r' }">
							<td>반려</td>
						</c:if>
					</tr>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<td colspan="4">데이터가 없습니다.</td>
				</c:otherwise>
			</c:choose>
	</table>
	
	
</body>
</html>