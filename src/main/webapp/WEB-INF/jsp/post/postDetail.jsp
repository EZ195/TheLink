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
						<a href="/post/approve_list_view">신청자 리스트</a>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
						  참가신청
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	참여하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">신청하기</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
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
		});
	</script>
</body>
</html>