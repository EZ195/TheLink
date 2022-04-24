<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="w-75 my-5 ">
				<div class="table-responsive">
					<table class="table">
						<c:forEach var="postList" items="${postList }">
						<tr>
							<td>${postList.userNickname }</td>
							<td><a href="/post/detail_view?id=${postList.id }">${postList.title }</a></td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<a href="/post/create_view">글쓰기</a>
			</div>
			<c:forEach var="postList" items="${postList }">
				<div class="card mb-3" style="max-width: 600px;">
			  		<div class="row g-0">
					    <div class="col-md-2">
					      <img src="https://i.pinimg.com/564x/ca/1e/00/ca1e00ba1e616a9a028ca1f369eeef0f.jpg" class="postImg img-fluid rounded-start">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">${postList.title }</h5>
					        <p class="card-text">${postList.userNickname }</p>
					        <p class="card-text"><small class="text-muted">upload : ${postList.createdAt }</small></p>
					      </div>
					    </div>
					</div>
				</div>
			</c:forEach>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
</body>
</html>