<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="timeline-container mt-5">
				<div class="card p-3 py-4">
					<div class="align-center">
			        	<div><img src="${userProfile.profileImagePath }" width="100" class="rounded-circle"></div>
			            <div><input type="file" class="mt-3" id="fileInput" value="${userProfile.profileImagePath }"></div>
			        </div>
			        <div class="align-center">
				        <div class="col-5 mt-3" style="margin:0 auto;">
				        	<input class="form-control" type="text" id="updateNickname" value="${userProfile.nickname }">
				        </div>
				        <div class="px-4 mt-1">
				        	<textarea class="form-control mt-3" rows="10" id="introduceInput">${userProfile.introduce }</textarea>
						</div>
					</div>
			       
					<!-- 버튼 -->
					<div class="buttons align-center">
						<button class="btn btn-lg btn-primary mt-3 mb-3" type="button" id="updateBtn" data-user-id="${userProfile.userId }">수정</button>
			            <a class="btn btn-lg btn-danger mt-3 mb-3" href="/user/profile/profile_view?id=${userProfile.userId }">취소</a>
			        </div>
			        
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			$("#updateBtn").on("click",function(){
				
				let nickname = $("#updateNickname").val();
				let introduce = $("#introduceInput").val();
				let userId = ${userProfile.userId};
				
				var formData = new FormData();
				formData.append("nickname",nickname);
				formData.append("introduce",introduce);
				formData.append("profileImagePath",$("#fileInput")[0].files[0]);					
				
				$.ajax({
					type:"post",
					url:"/user/profile/profile_update",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							alert("수정 성공");
							location.href="/user/profile/profile_view?id=" + userId;
						}
						else {
							alert("수정 실패");
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