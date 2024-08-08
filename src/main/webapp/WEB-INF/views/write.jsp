<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css" integrity="sha256-XoaMnoYC5TH6/+ihMEnospgm0J1PM/nioxbOUdnM8HY=" crossorigin="anonymous">
<style>
	
	.file-list {
	    overflow: auto;
	    border: 1px solid #989898;
	    padding: 10px;
	}
	.file-list .filebox{
		display: flex;
		align-items: center;
	}
	
	.file-list .filebox p {
	    font-size: 14px;
	    margin-top: 10px;
	    display: inline-block;
	}
	.file-list .filebox .delete i{
	    color: #ff5353;
	    margin-left: 5px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script>
	$(function(){
		
		$("#addBtn").click(function(){
			$("#fm").attr({action:"write", method:"post"}).submit();
		})
		
		$("#saveBtn").click(function(){
			$("#fm").attr({action:"update", method:"post"}).submit();
		})
		//파일 추가 및 개수 체크
		var temp = 0;
		$("#addFileBtn").click(function(){
			var html = '';
			
			html = '<div><input type=file name=filename'+temp+' id=file'+temp+' onchange=filecheck(this)><input type=button value=취소 onclick=fileDelete(this)><br></div>';
			if($("#fileBox > div").length+1 > 5){
				alert("파일은 5개까지만 추가 가능합니다.");
				html = '';
				return;
			} else {
				$("#fileBox").append(html);
				temp++;
			}
			
		})
		
		
	})
		


	//취소
	function fileDelete(deletefile){
		
		$(deletefile).prev().remove();
		$(deletefile).next().remove();
		$(deletefile).remove();
		
	}	
	
	function filecheck(file){
		//이미지 파일 확인
		var imgCheck = $(file).val().split('.').pop().toLowerCase();
		console.log(imgCheck);
		
		if($.inArray(imgCheck, ['gif', 'jpeg', 'png', 'bmp', 'tif', 'jfif', 'jpg']) == -1){
			alert("이미지만 업로드 가능합니다.");
			$(file).val('');
			return;
		}
		
		//픽셀 제한
		var img = new Image();
		var files = file.files[0];
		var _URL = window.URL || window.webkitURL;
		
		img.src = _URL.createObjectURL(files);
		img.onload = function(){
			if(img.width > (500) || img.height > (500)){
				alert("이미지 사이즈(가로 500px, 세로 50px)이하로 올려주세요");
				$(file).val('');
				return;
			}
		}
	
	
	}	
</script>
<body>
	<form name="fm" id="fm" enctype="multipart/form-data">
			<div>
				작성자 : <input type="text" name="memName" id="memName" value="${view.memName }">
			</div>
			<div>
				ID : <input type="text" name="memId" id="memId" value="${view.memId }">
			</div>
			<div>
				제목 : <input type="text" name="boardSubject" id="boardSubject" value="${view.boardSubject }">
			</div>
			<div>
				내용 : <textarea name="boardContent" id="boardContent" cols="" rows="" >${view.boardContent }</textarea>
			</div>
			<c:if test="${not empty fileview }">
				<c:forEach var="fileview" items="${fileview }">
					<div>
						저장된 파일명 : <span>${fileview.saveName}</span>
						<a href='<c:url value="download?fileSeq=${fileview.fileSeq }&saveName=${fileview.saveName }"/>'>${fileview.realName} </a>
						<div>${pageContext.request.contextPath}</div>
					</div>
				</c:forEach>
			</c:if>
			
			<div id="fileBox">
				<input type="button" name="addFileBtn" id="addFileBtn" value="파일 추가"><br>	
			</div>
		
			
				
				<input type="button" value="목록" id="listBtn" onclick="location.href='list'">
			<c:choose>
				<c:when test="${not empty view }">
					<input type="hidden" value="${view.seq }" name="seq">
					<input type="button" value="수정" id="saveBtn" onclick="submit()">
				</c:when>
				<c:otherwise>
					<input type="button" value="등록" id="addBtn" onclick="submit()">
				</c:otherwise>
			</c:choose>
			
	</form>
</body>
</html>