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
			<div class="timeline-container">
			<div class="text_right search_wrap my-3">
				<div class="search_area">
					<input type="text" id="searchInput">
			  		<button class="btn btn-outline-info" type="button" id="searchBtn">검색</button>
				</div>
			</div>
			
			<div class="my-3 p-3 bg-body rounded shadow-sm">
				<div class="border-bottom pb-2 mb-0">
				    <span>모임 검색 결과</span>
				</div>
				
			    <c:forEach var="postResult" items="${postResult }">
			    <div class="d-flex text-muted pt-3">
			      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"/><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
			
			      <p class="pb-3 mb-0 small lh-sm border-bottom">
			        <strong class="d-block text-gray-dark">@${postResult.userNickname }</strong>
			        <a href="/post/detail_view?id=${postResult.id }">${postResult.title }</a>
			      </p>
			    </div>
			    </c:forEach>
			</div>
			  
			<div class="my-3 p-3 bg-body rounded shadow-sm">
				<div class="border-bottom pb-2 mb-0">
					<span>유저 검색 결과</span>
				</div>
				<c:choose>
					<c:when test="${!empty userResult }">
					<c:forEach var="userResult" items="${userResult }">
						<div class="d-flex text-muted pt-3">
					    	<img src="${userResult.profileImagePath }" class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32">
							<p class="pb-3 mb-0 small lh-sm border-bottom">
					        @<a href="/user/profile/profile_view?id=${userResult.id }">${userResult.nickname }</a>
					      	</p>
					    </div>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<p>검색결과가 없습니다.</p>
					</c:otherwise>
				</c:choose>
				    
				<small class="d-block text-end mt-3">
					<a class="more" href="#">See More</a>
				</small>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			
			var postresult = ${postResult};
			
			if (postresult eq null) {
				console.log("null 아님");
			}
			else {
				console.log("null");
			}
		
			
			$("#searchBtn").on("click",function(){
				
				let keyword = $("#searchInput").val();
				
				location.href="/search/search_view?keyword=" + keyword;
				
			});
		});
	</script>
</body>
</html>