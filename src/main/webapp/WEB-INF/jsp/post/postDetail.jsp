<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Post Detail</title>
</head>
<body>
	
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="w-75 my-5 ">
				제목 : ${postDetail.title }
				내용 : ${postDetail.content }
				날짜 : ${postDetail.meetingDate }
				인원 수 : ${postDetail.headcount }
			</div>
			<div>
				<c:choose>
					<c:when test="${postDetail.userId eq userId  }">
						<a href="/post/update_view?id=${postDetail.id }">수정</a>
						<button id="deleteBtn" type="button" data-post-id="${postDetail.id}">삭제</button>
					</c:when>
					<c:when test="${isChecked}">
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop_delete">취소하기</button>
					</c:when >
					<c:otherwise>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">참여 신청</button>
					</c:otherwise>
				</c:choose>
				<a href="/post/join/approve_list_view?postId=${postDetail.id }">신청자 리스트</a>
			</div>
			<!-- 후기 댓글 리스트 -->
			<div>
				<hr>
				<c:forEach var="commentList" items="${commentList }">
					${commentList.userId } : <input type="text" value="${commentList.comment }" id="updateCommentInput">
					<input type="button" value="수정" id="updateCommentBtn" data-post-id="${postDetail.id }">
				</c:forEach>
				<hr>
			</div>
			<!-- 후기 댓글 입력 -->
			<div>
				<input type="text" id="commentInput"> <button type="button" id="commentBtn" data-post-id="${postDetail.id}">확인</button>
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