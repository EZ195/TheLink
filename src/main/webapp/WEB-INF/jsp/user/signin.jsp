<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<section>
			<div class="signIn-container text_center">
				<div class="sign-in">
					<img class="logoImg" alt="link_logo" src="/static/img/thelinklogo.png">
				</div>
				<div class="sign-in">
					<form class="form-control">
						<h5 class="my-3">로그인 해주세요</h5>
						<div class="mx-3 my-3">
							<input type="email" class="form-control" id="loginEmailInput" placeholder="name@example.com">
				      	</div>
						<div class="mx-3 my-3">
							<input type="password" class="form-control" id="pwInput" placeholder="password">
						</div>
						<div class="mb-3 mt-3 my-3 mx-3">
							<button class="w-100 btn btn-lg btn-primary" type="button" id="loginBtn">Sign in</button>
							<label class="my-3">
							<small>계정이 없다면 <a href="/user/signup_view">가입하기</a></small>
							</label>
						</div>
					</form>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	
	<script>
		$().ready(function(){
			$("#loginBtn").on("click", function(){
				
				let loginEmail = $("#loginEmailInput").val();
				let password = $("#pwInput").val();
				
				if(loginEmail == ""){
					alert("아이디를 입력하세요");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginEmail":loginEmail,"password":password},
					success:function(data){
						if(data.result == "success") {
							location.href="/post/timeline_view";
						}
						else {
							alert("아이디와 비밀번호를 확인하세요");
							location.reload();
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