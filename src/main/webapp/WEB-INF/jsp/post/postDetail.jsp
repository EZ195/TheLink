<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Post Detail</title>
</head>
<body>
	<div class="wrap">
	<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section class="d-flex justify-content-center">
		<div class="timeline-container">
			<div class="sign-up my-5">
				<h3 class="text-center">${postDetail.title }</h3>
				<div><a href="#">#${postDetail.postCategory }</a></div>
				<div>
					<p class="form-control mt-3" id="contentInput">${postDetail.content }</p>
				</div>
				<div class="d-flex content-space-evenly mt-5">
					<div>날짜 : ${postDetail.meetingDate }</div>
					<div>인원 수 : ${postDetail.headcount }</div>
				</div>
			</div>
			<div class="align-center">
				<div>
					<c:choose>
						<c:when test="${postDetail.userId eq userId  }">
							<a class="btn btn btn-danger mb-3" href="/post/update_view?id=${postDetail.id }">수정</a>
							<button class="btn btn btn-danger mb-3" id="deleteBtn" type="button" data-post-id="${postDetail.id}">삭제</button>
						</c:when>
						<c:when test="${isChecked}">
							<button type="button" class="btn btn-danger mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop_delete">취소하기</button>
						</c:when >
						<c:otherwise>
							<button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">참여 신청</button>
						</c:otherwise>
					</c:choose>
					<a class="btn btn btn-warning mb-3" id="approveListBtn1" href="/post/join/approve_list_view?postId=${postDetail.id }">신청자 리스트</a>
				</div>
				<div>				
				</div>
			</div>
			<!-- 후기 댓글 리스트 -->
			<div>
				<hr>
				<c:forEach var="commentList" items="${commentList }">
					${commentList.userNickname } : <input type="text" value="${commentList.comment }" id="updateCommentInput">
					<input class="btn btn-sm btn-primary mb-3" type="button" value="수정" id="updateCommentBtn" data-post-id="${postDetail.id }">
				</c:forEach>
				<hr>
			</div>
			<!-- 후기 댓글 입력 -->
			<div class="d-flex">
				<div class="col-8">
					<input class="form-control" type="text" id="commentInput">
				</div>
				<button class="btn btn-sm btn-danger mb-3" type="button" id="commentBtn" data-post-id="${postDetail.id}">확인</button>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      	신청하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="joinBtn" class="btn btn-primary btn-small" data-post-id="${postDetail.id }">확인</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop_delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      	정말 취소하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="deleteJoinBtn" class="btn btn-primary btn-small" data-post-id="${postDetail.id }">확인</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$().ready(function(){
			$("#deleteBtn").on("click",function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success") {
							location.href="/post/timeline_view";
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
			
			$("#joinBtn").on("click",function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"post",
					url:"/post/join/participate",
					data:{"postId":postId},
					success:function(data){
						if (data.result == "success") {
							alert("신청완료");
							location.href="/post/timeline_view";
						}
						else {
							alert("신청 실패");
						}
					},
					error:function(){
						alert("에러 발생");						
					}
				});
				
			});
			
			$("#deleteJoinBtn").on("click", function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/join/cancel",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success") {
							location.reload();
						}
						else {
							alert("취소 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
			
			$("#commentBtn").on("click",function(){
				
				let postId = $(this).data("post-id");
				let comment = $("#commentInput").val();
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "comment":comment},
					success:function(data){
						
						if(data.result == "success") {
							
							alert("등록 완료");
							location.reload();
						}
						else {
							alert("등록 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
			
			$("#updateCommentBtn").on("click",function(){
				
				let postId = $(this).data("post-id");
				let comment = $("#updateCommentInput").val();
				
				$.ajax({
					type:"get",
					url:"/post/comment/update",
					data:{"postId":postId,"comment":comment},
					success:function(data){
						if(data.result == "success") {
							alert("수정 성공");
							location.reload();
						}
						else {
							alert("수정 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
			});
		});
	</script>
</body>
</html>