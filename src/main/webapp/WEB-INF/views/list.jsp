<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>List</title>
	<meta charset="UTF-8">
</head>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
$(function(){

	$("#delete").click(function(){
		$("#fm").attr({action:"delete", method:"post"}).submit();
	})
	
	$("#select").val();
	
	$("#searchBtn").click(function(){
		$("#frm").attr({"action":"list", "method":"post"}).submit();
	})
	
	$("#searchBtn1").click(function(){
		console.log( $("#frm").serialize());
		$.ajax({
			url: "serachList",
			type: "post",
			data: $("#frm").serialize(),
			
			success : function(data){   				
				console.log(data);
				var html = '';

				for(var i=0; i<data.list.length; i++){
					
					html += '<tr>';
					html += '	<td><input type=checkbox size=1 name=seqs value='+data.list[i].seq+ '></td>';
					html += '	<td>'+ data.list[i].seq +'</td>';
					html += '	<td>' + data.list[i].memName  + '('+ data.list[i].memId  +')</td>';
					html += '	<td><a style=text-decoration-line:none; color:black href=view?seq='+data.list[i].seq +  '>' + data.list[i].boardSubject + '</a></td>';
					html += '	<td>' + data.list[i].regDate + '</td>';
					html += '	<td>' + data.list[i].uptDate  +'</td>';
					html += '	<td>' +data.list[i].viewCnt +'</td>';
					html += '</tr>';
					
				}
				
				$("#dataBody").html(html);
				$("#tdPage").html(data.boardPager);
			},
			error : function(){
				console.log("실패");
			}
		})
	})
	
	$("#searchBtn2").click(function(){
		
		$.ajax({
			url: "seachList2",
			data: $("#frm").serialize(),
			type: "post",

			success : function(data){   
				console.log(data);
				$("#fm").html(data);
			},
			error : function(){
				console.log("실패");
			}
		})
		
	})
	
	$("#size").change(function(){
		pagination('${searchMap.curPage}');
	})	
})

  function page(num){
    $("#curPage").val(num);
    $("#listSize").val($("#size").val());
    $("#searchBtn2").click();
 }
 
 var pagination = page;
</script>

<body>
	<% request.setCharacterEncoding("EUC-KR"); %>
	<div id="selectBox">
		<form name="frm" id="frm"  accept-charset="utf-8">
			<input type="hidden" name="curPage" id="curPage" value="1">
			<input type="hidden" name="listSize" id="listSize" value="10">
			<select name="selectOption" id="select">
				<option value="total" selected>전 체</option>
				<option value="name">작성자</option>
				<option value="id">ID</option>
				<option value="subj">제목</option>
				<option value="cont">제목 + 내용</option>
			</select>
			<input type="text" name="keyword" id="keyword" value="${searchMap.keyword }">
			<input type="button" value="검색" id="searchBtn">
			<input type="button" value="검색2" id="searchBtn2">
			<br>
			<input type="date" name="stDate" value="${searchMap.stDate }"> - <input type="date" name="enDate" value="${searchMap.enDate }">
		</form>
	</div>
	
	<input type="button" value="글쓰기" onclick="location.href='insert'">
	<input type="button" value="삭제" id="delete">
	<input type="text" id="size" value="${searchMap.listSize }">
	
	<form id="fm" name="fm"  accept-charset="utf-8">
		<table border="1">
			<thead>
				<tr>
					<th><input type="checkbox" size="1"></th>
					<th>글번호</th>
					<th>작성자(ID)</th>
					<th>제목</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody id="dataBody">
				<c:forEach var="list" items="${list}">
					<tr>
						<td><input type="checkbox"  size="1" name="seqs" value="${list.seq }"></td>
						<td>${list.seq }</td>
						<td>${list.memName }(${list.memId })</td>
						<td><a href="view?seq=${list.seq }" style="text-decoration-line:none; color:black">${list.boardSubject }</a></td>
						<td><fmt:formatDate pattern="yyyy.MM.dd" value="${list.regDate}"/></td>
						<td>${list.uptDate }</td>
						<td>${list.viewCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
		            <td colspan="5" id="tdPage">
		                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
		                <c:if test="${boardPager.curBlock > 1}">
		                    <a href="javascript:page('1')">[처음]</a>
		                </c:if>
		                
		                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
		                <c:if test="${boardPager.curBlock > 1}">
		                    <a href="javascript:page('${boardPager.prevPage}')">[이전]</a>
		                </c:if>
		                
		                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
		                <c:forEach var="num" begin="${boardPager.blockBegin}" end="${boardPager.blockEnd}">
		                    <!-- **현재페이지이면 하이퍼링크 제거 -->
		                    <c:choose>
		                        <c:when test="${num == boardPager.curPage}">
		                            <span style="color: red">${num}</span>&nbsp;
		                        </c:when>
		                        <c:otherwise>
		                            <a href="javascript:page('${num}')">${num}</a>&nbsp;
		                        </c:otherwise>
		                    </c:choose>
		                </c:forEach>
		                
		                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
		                <c:if test="${boardPager.curBlock <= boardPager.totBlock}">
		                    <a href="javascript:page('${boardPager.nextPage}')">[다음]</a>
		                </c:if>
		                
		                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
		                <c:if test="${boardPager.curPage <= boardPager.totPage}">
		                    <a href="javascript:page('${boardPager.totPage}')">[끝]</a>
		                </c:if>
		            </td>
	        	</tr>
        	</tfoot>
		</table>
	</form>

</body>
</html>
