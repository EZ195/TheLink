<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<meta charset="UTF-8">
<title>TImeLine</title> 
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			
			<div class="text_right search_wrap my-3">
				<div class="search_area">
					<input type="text" id="searchInput">
			  		<button class="btn btn-outline-info" type="button" id="searchBtn">검색</button>
				</div>
			</div>
			
			<div class="float_right mb-3">
			  
			</div>
			
			<div class="my-3 p-3 bg-body rounded shadow-sm">
				<div class="border-bottom pb-2 mb-0">
				    <span>Recent updates</span>
				    <span class="text_right"><a href="/post/create_view" ><i class="bi bi-pencil-square"></i></a></span>
				</div>
				
			    <c:forEach var="postList" items="${postList }" varStatus="status">
			    <div id="post${status.index }" class="postShow">
			    <div class="d-flex text-muted pt-3">
			      <p class="pb-3 mb-0 small lh-sm border-bottom">
			      	<a href="/search/search_view?keyword=${postList.postCategory }">#${postList.postCategory }</a>
			        <strong class="d-block text-gray-dark">@${postList.userNickname }</strong>
			        <a class="black" href="/post/detail_view?id=${postList.id }">${postList.title }</a>
			      </p>
			    </div>
			    </div>
			    </c:forEach>
			    
			    <small class="d-block text-end mt-3" id="morePostBtn">
			      <a class="more" href="#">All updates</a>
			    </small>
			  </div>
			
			<div class="my-3 p-3 bg-body rounded shadow-sm">
			    <h6 class="border-bottom pb-2 mb-0">UserList</h6>
			    <c:forEach var="userList" items="${userList }" varStatus="status">
			   <div id="user${status.index }" class="userShow">
			    <div class="d-flex text-muted pt-3">
			      <img src="${userList.profileImagePath }" class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32">
			      <p class="pb-3 mb-0 small lh-sm border-bottom">
			      	<a href="/user/profile/profile_view?id=${userList.userId }">@${userList.nickname }</a>
			      </p>
			    </div>
			   </div>
			    </c:forEach>

			    <small class="d-block text-end mt-3" id="moreUserBtn">
			      <button class="more" >See More</button>
			    </small>
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