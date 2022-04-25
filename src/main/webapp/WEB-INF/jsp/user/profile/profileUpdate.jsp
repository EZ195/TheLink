<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"></c:import>
		
		<section>
			<div class="container mt-5">
		   	 	<div class="row d-flex justify-content-center">
			        <div class="col-md-7">
			            <div class="card p-3 py-4">
			                <div class="text-center">
			                	<img src="${userProfile.profileImagePath }" width="100" class="rounded-circle">
			                </div>
			                <div class="text-center mt-3">
			                	<input type="file" class="mt-3" id="fileInput" value="${userProfile.profileImagePath }">
			                    <h5 class="mt-2 mb-0"><input type="text" id="updateNickname" value="${userProfile.nickname }"></h5>
			                    <div class="px-4 mt-1">
			                        <p class="fonts"><textarea class="form-control mt-3" rows="5" id="introduceInput">${userProfile.introduce }</textarea></p>
			                    </div>
			                    <div class="buttons"> 
			                    	<a href="/user/profile/profile_view">취소</a>
									<a href="/user/profile/profile_update" id="updateBtn" data-user-id="${userProfile.userId }">완료</a>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
	<script>
		$().ready(function(){
			$("#updateBtn").on("click",function(){
				
				let nickname = $("#updateNickname").val();
				let introduce = $("#introduceInput").val();
				
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
							location.href="/user/profile/profile_view?id=" + ${userId };
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