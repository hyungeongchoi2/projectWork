<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<td>${list.regDate}</td>
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