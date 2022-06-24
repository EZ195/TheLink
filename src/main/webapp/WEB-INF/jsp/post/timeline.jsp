<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>TImeLine</title> 
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
		<div class="timeline-container">
			<div class="my-3">
				<div class="">
					<input type="text" id="searchInput">
			  		<button class="btn btn-outline-info" type="button" id="searchBtn">검색</button>
				</div>
			</div>
			
			<!-- 게시물 리스트 -->
			
			<div class="my-3 p-3 shadow-sm">
				<div class="border-bottom pb-2 mb-0">
				    <span>Post List</span>
				    <span class="text_right"><a href="/post/create_view" ><i class="bi bi-pencil-square"></i></a></span>
				</div>
				
			    <c:forEach var="postList" items="${postList }" varStatus="status">
			    <div id="post${status.index }" class="postShow">
			    <div class="d-flex text-muted pt-3 border-bottom"">
			      <div class="pb-3 mb-0 small lh-sm">
			      	<div><small><a class="d-block" href="/search/search_view?keyword=${postList.postCategory }">#${postList.postCategory }</a></small></div>
			        <div class="my-1"><a class="a-black" href="/post/detail_view?id=${postList.id }">${postList.title }</a></div>
			       	<div><small class="d-block">by. ${postList.userNickname }</small></div>
			      </div>
			    </div>
			    </div>
			    </c:forEach>
			    
			    <small class="d-block text-end mt-3" id="morePostBtn">
			      <a class="more" href="#">모두보기</a>
			    </small>
			  </div>
			
			<!-- 사용자 리스트 -->
			<div class="my-3 p-3 shadow-sm">
			    <h6 class="border-bottom pb-2 mb-0">User List</h6>
			    <c:forEach var="userList" items="${userList }" varStatus="status">
			   <div id="user${status.index }" class="userShow">
			    <div class="d-flex text-muted pt-3 border-bottom"">
			      <img src="${userList.profileImagePath }" class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32">
			      <p class="pb-3 mb-0 small lh-sm">
			      	@<a class="a-black" href="/user/profile/profile_view?id=${userList.userId }">${userList.nickname }</a>
			      </p>
			    </div>
			   </div>
			    </c:forEach>

			    <small class="d-block text-end mt-3" id="moreUserBtn">
			      <a href="#" class="more" >모두보기</a>
			    </small>
			</div>
		</div>	
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			
			var postLength = ${fn:length(postList) };
			var userLength = ${fn:length(userList) };

			var index = 3
			
			for(var i=0;i<index;i++) {
				$("#post" + i).show();
			}
			
			for(var i=0;i<index;i++) {
				$("#user" + i).show();
			}
			
			$("#searchBtn").on("click",function(){
				
				let keyword = $("#searchInput").val();
				
				location.href="/search/search_view?keyword=" + keyword;
			});
			
			$("#morePostBtn").on("click",function(){
				
				for(var i=index;i<postLength;i++) {
					$("#post" + i).show();
				}
			});
			
			$("#moreUserBtn").on("click",function(){
				for(var i=index;i<userLength;i++) {
					$("#user" + i).show();
				}
			});
		});
	</script>
</body>
</html>