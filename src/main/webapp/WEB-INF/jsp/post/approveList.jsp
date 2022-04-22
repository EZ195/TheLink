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
						<td>${applierList.userId }</td>
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