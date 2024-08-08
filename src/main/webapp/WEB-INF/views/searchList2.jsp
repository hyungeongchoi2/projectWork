<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<table border="1">
			<thead>
				<tr>
					<th><input type="checkbox" size="1"></th>
					<th>�۹�ȣ</th>
					<th>�ۼ���(ID)</th>
					<th>����</th>
					<th>�ۼ���</th>
					<th>������</th>
					<th>��ȸ��</th>
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
		                <!-- **ó���������� �̵� : ���� �������� 1���� ũ��  [ó��]�����۸�ũ�� ȭ�鿡 ���-->
		                <c:if test="${boardPager.curBlock > 1}">
		                    <a href="javascript:page('1')">[ó��]</a>
		                </c:if>
		                
		                <!-- **���������� ������� �̵� : ���� ������ ���� 1���� ũ�� [����]�����۸�ũ�� ȭ�鿡 ��� -->
		                <c:if test="${boardPager.curBlock > 1}">
		                    <a href="javascript:page('${boardPager.prevPage}')">[����]</a>
		                </c:if>
		                
		                <!-- **�ϳ��� ������ �ݺ��� ���� �������������� ������������ -->
		                <c:forEach var="num" begin="${boardPager.blockBegin}" end="${boardPager.blockEnd}">
		                    <!-- **�����������̸� �����۸�ũ ���� -->
		                    <c:choose>
		                        <c:when test="${num == boardPager.curPage}">
		                            <span style="color: red">${num}</span>&nbsp;
		                        </c:when>
		                        <c:otherwise>
		                            <a href="javascript:page('${num}')">${num}</a>&nbsp;
		                        </c:otherwise>
		                    </c:choose>
		                </c:forEach>
		                
		                <!-- **���������� ������� �̵� : ���� ������ ���� ��ü ������ ������ �۰ų� ������ [����]�����۸�ũ�� ȭ�鿡 ��� -->
		                <c:if test="${boardPager.curBlock <= boardPager.totBlock}">
		                    <a href="javascript:page('${boardPager.nextPage}')">[����]</a>
		                </c:if>
		                
		                <!-- **���������� �̵� : ���� �������� ��ü ���������� �۰ų� ������ [��]�����۸�ũ�� ȭ�鿡 ��� -->
		                <c:if test="${boardPager.curPage <= boardPager.totPage}">
		                    <a href="javascript:page('${boardPager.totPage}')">[��]</a>
		                </c:if>
		            </td>
	        	</tr>
        	</tfoot>
		</table>