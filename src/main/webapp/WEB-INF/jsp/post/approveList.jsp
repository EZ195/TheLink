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
<title>Approve</title>
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="table-responsive">
				<table class="table">
					<c:forEach var="applierList" items="${applierList }">
					<tr>
						<td>${applierList.userNickname }</td>
						<c:choose>
							<c:when test="${postWriter eq userId}">
								<c:choose>
									<c:when test="${applierList.statement eq '승인 대기' }">
										<td><button type="button" class="approveBtn btn btn-danger" data-user-id="${applierList.userId }">승인</button></td>							
									</c:when>
									<c:otherwise>
										<td><button type="button" class="btn btn-secondary" disabled='disabled'>승인 완료</button></td>
									</c:otherwise>
								</c:choose>
							</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			$(".approveBtn").on("click",function(){

				let userId = $(this).data("user-id");
				$.ajax({
					type:"get",
					url:"/post/join/approve",
					data:{"userId":userId,"postId":${postId}},
					success:function(data){
						if(data.result == "success"){
							alert("승인 성공");
						}
						else {
							alert("승인 실패");
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