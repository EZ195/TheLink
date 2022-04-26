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
			                    <h5 class="mt-2 mb-0">${userProfile.nickname }</h5>
			                    <div>
				                    <span>${followingCnt }</span>
				                    <span>Followers</span>
				                    <span>${followerCnt }</span>
				                    <span>Following</span>
			                    </div>
			                    <c:choose>
			                    	<c:when test="${userProfile.userId eq userId }">
					                    <div class="buttons">
					                    	<a href="/user/profile/update_view" class="btn btn-primary px-4 ms-3">Edit Profile</a>
					                    </div>
			                    	</c:when>
			                    	<c:otherwise>
					                    <div class="buttons">
					                    	<c:choose>
					                    		<c:when test="${isFollowing}">
							                    	<button id="unfollowBtn" data-user-id="${userProfile.userId}" class="btn btn-secondery px-4 ms-3 ">Following</button>					                    		
					                    		</c:when>
					                    		<c:otherwise>
							                    	<button id="followBtn" data-user-id="${userProfile.userId}" class="btn btn-primary px-4 ms-3 ">Follow</button>
					                    		</c:otherwise>
					                    	</c:choose>
					                    	<button class="btn btn-primary px-4 ms-3">Message</button>
					                    </div>
			                    	</c:otherwise>
			                    </c:choose>
			                </div>
			                <div class="text-center mt-3">
			                    <div class="px-4 mt-1">
			                        <p class="fonts">${userProfile.introduce }</p>
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
			$("#followBtn").on("click",function(){
				
				let userId = $(this).data("user-id");
				
				$.ajax({
					type:"post",
					url:"/user/follow/is_follow",
					data:{"followeeId":userId},
					success:function(data){
						if(data.result == "success") {
							alert("팔로우 완료");
						}
						else {
							alert("팔로우 실패");
						}
					},
					error:function(){
						
					}
				});
			});
			
		});
	</script>
</body>
</html>