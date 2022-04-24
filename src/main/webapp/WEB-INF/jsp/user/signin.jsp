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
<title>Insert title here</title>
</head>
<body class="text-center">
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
		<div class="mx-5 mt-5">
			<main class="form-signin">
				<form>
			    	<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

					<div class="form-floating">
						<input type="email" class="form-control" id="loginEmailInput" placeholder="name@example.com">
			      		<label for="loginEmailInput">Email address</label>
			      	</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="pwInput" placeholder="Password">
						<label for="pwInput">Password</label>
					</div>
					<div class="mb-3 mt-3">
						<button class="w-100 btn btn-lg btn-primary" type="button" id="loginBtn">Sign in</button>
						<label>
						<small>계정이 없다면 <a href="/user/signup_view">가입하기</a></small>
						</label>
					</div>
				</form>
			</main>
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
							alert("로그인 성공");
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