<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="w-75 my-5 ">
				<input type="text" id="titleInput" value="${postUpdate.title }">
				<input type="text" id="contentInput" value="${postUpdate.content }">
				<input type="date" id="dateInput" value="${postUpdate.meetingDate }">
				<input type="text" id="headcountInput" value="${postUpdate.headcount }">
			</div>
			<div>
				<button type="button" data-post-id="${postUpdate.id}" id=updateBtn>수정하기</button>
			</div>		
		</section>
	<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
	$().ready(function(){
		$("#updateBtn").on("click",function(){
			
			let title =$("#titleInput").val();
			let content =$("#contentInput").val();
			let meetingDate =$("#dateInput").val();
			let headcount =$("#headcountInput").val();
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"post",
				url:"/post/update",
				data:{"id":postId,"title":title,"content":content,"meetingDate":meetingDate,"headcount":headcount},
				success:function(data){
					if(data.result == "success") {
						location.href="/post/timeline_view";
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