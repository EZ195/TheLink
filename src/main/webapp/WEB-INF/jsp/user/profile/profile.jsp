<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link href="/static/fullcalendar/main.css" rel="stylesheet">
    <script src="/static/fullcalendar/main.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="timeline-container mt-5">
		   	 	<div class="row d-flex justify-content-center"> 
			        <div class="my-3">
			            <div class="card p-3 py-4">
			                <div class="text-center">
			                	<img src="${userProfile.profileImagePath }" width="100" class="rounded-circle">
			                    <h5 id="nickname" class="mt-2 mb-0">${userProfile.nickname }</h5>
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
					                    		<c:when test="${isFollowing }">
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
			                    <c:forEach var="userInterest" items="${userInterest }">
			                    	<a href="/search/search_view?keyword=${userInterest }">#${userInterest }</a>
			                    </c:forEach>
			                </div>
			            </div>
			        </div>
			    	<div id='calendar'></div>
			    </div>
			    
			    <!-- 내가 참여한 모임 -->
			    <div class="my-3 p-3 rounded shadow-sm">
					<div class="pb-2 mb-0">
						<span>내가 참여한 모임</span>
					</div>
					
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Title</th>
					      <th scope="col">Statement</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="joinedList" items="${joinedList }">
					    <tr>
					      <th scope="row">-</th>
					      <td><a class="black" href="/post/detail_view?id=${joinedList.post.id }">${joinedList.post.title }</a></td>
					      <td>${joinedList.statement }</td>
					    </tr>
					 </c:forEach>  
					  </tbody>
					</table>
					    
						<small class="d-block text-end mt-3">
							<a class="more" href="#">All updates</a>
						</small>
			
					
				</div>	
						
				<!-- 내가 주최한 모임 -->
			    <div class="my-3 p-3 rounded shadow-sm">
					<div class="pb-2 mb-0">
						<span>내가 주최한 모임</span>
					</div>
							
					<c:set var="isValue" value="false"/>
							
					<c:forEach var="postList" items="${postList }">
					<c:if test="${postList.userId eq userProfile.userId }">
						<c:set var="isValue" value="true"/>
					</c:if>
					</c:forEach>
							
					<c:choose>
						<c:when test="${isValue eq true}">
								<div class="d-flex text-muted pt-3">
									<table class="table">
									<thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">Title</th>
									      <th scope="col">category</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="postList" items="${postList }" varStatus="stat">
										<c:if test="${postList.userId eq userProfile.userId}">
													<tr>
														<th scope="row">-</th>
														<td><a class="black" href="/post/detail_view?id=${postList.id }">${postList.title }</a></td>
														<td><a href="/search/search_view?keyword=${postList.postCategory }">#${postList.postCategory }</a></td>
													</tr>
										</c:if>
										</c:forEach>
									</tbody>
									</table>		
							    </div>
						</c:when>
						<c:when test="${isValue eq false }">
							주최한 모임이 없습니다.
							<a href="/post/create_view" class="btn btn-primary">모임 만들기</a>
						</c:when>
					</c:choose>
						   
					<small class="d-block text-end mt-3">
						<a class="more" href="#">All updates</a>
					</small>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
	<script>
	
	
		$().ready(function(){
		<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

			
			
			var arr1Size = "${joinedList.size()}";
			var arr2Cnt = "${postList.size()}";
			console.log("${joinedList[0].statement}");	
	        var calendarEl = document.getElementById('calendar');
           	var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                events: [
                	
                			<c:forEach var="joinedList" items="${joinedList}"> 
                			{title:"${joinedList.post.title}", start:"${joinedList.post.meetingDate}"},	
                			</c:forEach>
                			
                			<c:forEach var="postList" items="${postList}">
                				<c:if test="${postList.userId eq userProfile.userId }"> 
                					{title:"${postList.title}", start:"${postList.meetingDate}"},
                				</c:if>
                			</c:forEach>
                		],
                editable: true // false로 변경 시 draggable 작동 x 
            });
            calendar.render();	        
			
			$("#followBtn").on("click",function(){
				
				let userId = $(this).data("user-id");
				let userNickname = $("#nickname").text();
				
				$.ajax({
					type:"post",
					url:"/user/follow/is_follow",
					data:{"followeeId":userId,"followeeNickname":userNickname},
					success:function(data){
						if(data.result == "success") {
							location.reload();
						}
						else {
							alert("팔로우 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
			
			$("#unfollowBtn").on("click",function(){
				
				let userId = $(this).data("user-id");
				
				$.ajax({
					type:"get",
					url:"/user/follow/unfollow",
					data:{"followeeId":userId},
					success:function(data){
						if(data.result == "success") {
							location.reload();
						}
						else {
							alert("언팔 실패");
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