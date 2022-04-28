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
<meta charset="UTF-8">
<title>Insert title here</title>
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
			    
			    <small class="d-block text-end mt-3">
			      <a class="more" href="#">All updates</a>
			    </small>
			  </div>
			  
			<c:choose>
				<c:when test="${!empty userResult }">
				<div class="my-3 p-3 bg-body rounded shadow-sm">
				    <div class="border-bottom pb-2 mb-0">
					    <span>유저 검색 결과</span>
					</div>
				    <c:forEach var="userResult" items="${userResult }">
				    <div class="d-flex text-muted pt-3">
				      <img src="${userResult.profileImagePath }" class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32">
				
				      <p class="pb-3 mb-0 small lh-sm border-bottom">
				        @<a href="/user/profile/profile_view?id=${userResult.id }">${userResult.nickname }</a>
				      </p>
				    </div>
				    </c:forEach>
				    
				    <small class="d-block text-end mt-3">
				      <a class="more" href="#">See More</a>
				    </small>
				</div>
				</c:when>
				<c:otherwise>
					...
				</c:otherwise>
			</c:choose>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			$("#searchBtn").on("click",function(){
				
				let keyword = $("#searchInput").val();
				
				location.href="/search/search_view?keyword=" + keyword;
				
			});
		});
	</script>
</body>
</html>