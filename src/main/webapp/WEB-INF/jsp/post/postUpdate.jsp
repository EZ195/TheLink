<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
	<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="timeline-container">
				<div class="sign-up my-5">
					<div>
						<input class="form-control" type="text" id="titleInput" value="${postUpdate.title }">
					</div>
					<div>
						<textarea class="form-control mt-3" type="text" rows="10" id="contentInput">${postUpdate.content }</textarea>
					</div>
					<div class="d-flex content-space-evenly mt-3">
						<div class="col-5">
							<input class="form-control" type="date" id="dateInput" value="${postUpdate.meetingDate }">
						</div>
						<div class="col-3">
							<input class="form-control" type="text" id="headcountInput" value="${postUpdate.headcount }">
						</div>
					</div>
					<div class="mt-3 align-center">
						<button class="btn btn-primary" type="button" data-post-id="${postUpdate.id}" id=updateBtn>수정하기</button>
					</div>		
				</div>
			</div>
		</section>
	<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
	$().ready(function(){
		$("#updateBtn").on("click",function(){
			
			let title =$("#titleInput").val();
			let content =$("#contentInput").val();
			let meetingDate =$("#dateInput").val();
			let headcount =$("#headcountInput").val();
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"post",
				url:"/post/update",
				data:{"id":postId,"title":title,"content":content,"meetingDate":meetingDate,"headcount":headcount},
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