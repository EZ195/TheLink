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
	
	<link href="/static/fullcalendar/main.css" rel="stylesheet">
    <script src="/static/fullcalendar/main.js"></script>

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
			    <div class="my-3 p-3 bg-body rounded shadow-sm">
					<div class="border-bottom pb-2 mb-0">
						<span>내가 참여한 모임</span>
					</div>
							
					<c:forEach var="postList" items="${postList }">
						<div class="d-flex text-muted pt-3">			
						<p class="pb-3 mb-0 small lh-sm border-bottom">
							<a href="/search/search_view?keyword=${postList.postCategory }">#${postList.postCategory }</a>
							<strong class="d-block text-gray-dark">@${postList.userNickname }</strong>
							<a class="black" href="/post/detail_view?id=${postList.id }">${postList.title }</a>
						</p>
						</div>
					</c:forEach>
						    
						<small class="d-block text-end mt-3">
							<a class="more" href="#">All updates</a>
						</small>
				</div>
						
				<!-- 내가 주최한 모임 -->
			    <div class="my-3 p-3 bg-body rounded shadow-sm">
					<div class="border-bottom pb-2 mb-0">
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
							<c:forEach var="postList" items="${postList }">
							<c:if test="${postList.userId eq userProfile.userId}">
								<div class="d-flex text-muted pt-3">		
								    <p class="pb-3 mb-0 small lh-sm border-bottom">
								    <a href="/search/search_view?keyword=${postList.postCategory }">#${postList.postCategory }</a>
								    <strong class="d-block text-gray-dark">@${postList.userNickname }</strong>
									<a class="black" href="/post/detail_view?id=${postList.id }">${postList.title }</a>									      </p>
							    </div>
							</c:if>
							</c:forEach>
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
			var calendarEl = document.getElementById('calendar');
			
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth',
	          
	        	  timeZone: 'UTC',
	                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
	                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
	                    {	
	                		title: '한강',
	                		start: '2022-05-05'
	        			}
	                ],
	                editable: true // false로 변경 시 draggable 작동 x 


	          
	        });
	        calendar.render();
			
			$("#followBtn").on("click",function(){
				
				let userId = $(this).data("user-id");
				let userNickname = "${userProfile.nickname}";
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