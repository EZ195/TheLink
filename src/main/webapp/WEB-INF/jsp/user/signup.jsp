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

<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<c:import url="/WEB-INF/jsp/common/header.jsp"></c:import>
		
		<!-- content -->
		<section>
			<form>
			<h1>회원가입</h1>
			
				<!-- 아이디 -->
				<div class="mb-3">
					<label><input class="form-control" type="email" placeholder="아이디(이메일로 입력해주세요)" id="loginEmailInput"></label>
					<small class="text-danger" id="loginEmailDuplication">중복된 아이디(이메일) 입니다.</small>
					<small class="text-primary" id="loginEmailNotDuplication">사용 가능한 아이디(이메일) 입니다.</small>
					<button type="button" class="btn btn-light" id="loginEmail_duplicate">중복확인</button>
				</div>
				
				<!-- 비밀번호 -->
				<div class="mb-3">
					<input class="form-control" type="password" placeholder="비밀번호" id="passwordInput">
					<input class="form-control" type="password" placeholder="비밀번호 확인" id=passwordCheck>

				</div>
				
				<!-- 닉네임 -->
				<div class="mb-3">
					<input class="form-control" type="text" placeholder="닉네임" id="nicknameInput">
					<small class="text-danger" id="nicknameDuplication">중복된 닉네임 입니다.</small>
					<small class="text-primary" id="nicknameNotDuplication">사용 가능한 닉네임 입니다.</small>
					<button type="button" class="btn btn-light" id="nickname_duplicate">중복확인</button>
				</div>
				
				<!-- 생년월일 -->
				<div class="mb-3"> 
					<label>생년월일</label>
					
					<!-- year -->
					<select name="year" id="year" title="년도">
						<option id="yearSel" value="sel">선택</option>
						<c:forEach var="i" begin="1900" end="2022" step="1">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>년
					
					<!-- month -->
					<select name="month" id="month" title="월">
						<option id="monthSel" value="sel">선택</option>
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>월
					
					<!-- day -->
					<select name="day" id="day" title="일">
						<option id="daySel" value="sel">선택</option>
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>일
				</div>
				
				<!-- 성별 -->
				<div class="mb-3"> 
					<input type="radio" name="gender" id="male" value="male">남
					<input type="radio" name="gender" id="female" value="female">여
				</div>
				
				<!-- 관심사 -->
				<div class="mb-3">
					<h3>관심사를 선택해주세요(중복체크 가능)</h3>
					<div class="form-check">
						<h5>문화·예술</h5>
						<input type=checkbox name="interest" value="전시">전시
						<input type=checkbox name="interest" value="영화">영화
						<input type=checkbox name="interest" value="뮤지컬">뮤지컬
						<input type=checkbox name="interest" value="공연">공연
						<input type=checkbox name="interest" value="디자인">디자인
						<input type=checkbox name="interest" value="박물관">박물관
						<input type=checkbox name="interest" value="연극">연극
						<input type=checkbox name="interest" value="콘서트">콘서트
					</div>
					<div class="form-check mb-3">
						<h5>운동·액티비티</h5>
						<label><input type=checkbox name="interest" value="">러닝</label>
						<label><input type=checkbox name="interest" value="">등산</label>
						<label><input type=checkbox name="interest" value="">트래킹</label>
						<label><input type=checkbox name="interest" value="">산책</label>
						<label><input type=checkbox name="interest" value="">플로깅</label>
						<label><input type=checkbox name="interest" value="">헬스</label>
						<label><input type=checkbox name="interest" value="">클라이밍</label>
						<label><input type=checkbox name="interest" value="">자전거</label>
						<label><input type=checkbox name="interest" value="">서핑</label>
						<label><input type=checkbox name="interest" value="">스키</label>
						<label><input type=checkbox name="interest" value="">보드</label>
						<label><input type=checkbox name="interest" value="">배드민턴</label>
						<label><input type=checkbox name="interest" value="">테니스</label>
						<label><input type=checkbox name="interest" value="">축구</label>
						<label><input type=checkbox name="interest" value="">농구</label>
						<label><input type=checkbox name="interest" value="">탁구</label>
						<label><input type=checkbox name="interest" value="">볼링</label>
						<label><input type=checkbox name="interest" value="">골프</label>
						<label><input type=checkbox name="interest" value="">스포츠경기</label>
					</div>
					<div class="form-check">
						<h5>푸드·드링크</h5>
					</div>
					<div class="form-check">
						<h5>취미</h5>
					</div>
					<div class="form-check">
						<h5>여행·나들이</h5>
					</div>
					<div class="form-check">
						<h5>창작</h5>
					</div>
					<div class="form-check">
						<h5>성장·자기계발</h5>
					</div>
				</div>
				
				<button type="button" id="signupBtn">회원가입</button>
				이미 회원이면 <a href="/user/signin_view">로그인</a> 하러가기
			</form>
		</section>
		
		<!-- footer -->
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
	<script>
		$().ready(function(){
			
			var loginEmailChecked = false;
			var nicknameChecked = false;
			
			var loginEmailIsDuplicate = true;
			var nicknameIsDuplicate = true;
			
			$("#loginEmailInput").on("input" , function(){
				
				loginEmailChecked = false;
				loginEmailIsDuplicate = true;
				$("#loginEmailDuplication").hide();
				$("#loginEmailNotDuplication").hide();
				
			});
			
			$("#nicknameInput").on("input" , function(){
				
				nicknameChecked = false;
				nicknameIsDuplicate = true;
				$("#nicknameDuplication").hide();
				$("#nicknameNotDuplication").hide();
			});
			
			// 아이디 중복확인
			$("#loginEmail_duplicate").on("click" , function(){
				
				let loginEmail = $("#loginEmailInput").val();
				
				if(loginEmail == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/loginEmail_duplicate",
					data:{"loginEmail":loginEmail},
					success:function(data){
						loginEmailChecked = true;
							
						if(data.isDuplicate) {
							loginEmailIsDuplicate = true;
							$("#loginEmailDuplication").show();
						}
						else {
							loginEmailIsDuplicate = false;
							$("#loginEmailNotDuplication").show();
						}
					},
					error:function(){
						alert("에러 발생");
					}
					
				});
			});
			
			// 닉네임 중복확인
			$("#nickname_duplicate").on("click",function(){
				
				let nickname = $("#nicknameInput").val();
				
				if(nickname == "") {
					alert("닉네임을 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/nickname_duplicate",
					data:{"nickname":nickname},
					success:function(data){
						nicknameChecked = true;
							
						if(data.isDuplicate) {
							nicknameIsDuplicate = true;
							$("#nicknameDuplication").show();
						}
						else {
							nicknameIsDuplicate = false;
							$("#nicknameNotDuplication").show();
						}
					},
					error:function(){
						alert("에러 발생");
					}
					
				});
			});
			
			// 회원가입 버튼
			$("#signupBtn").on("click",function(){
				
				let loginEmail = $("#loginEmailInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordCheck").val();
				let nickname = $("#nicknameInput").val();
				let birthYear = $("#year").val();
				let birthMonth = $("#month").val();
				let birthDay = $("#day").val();
				let gender = $("input:radio[name=gender]:checked").val();
				let interest = $('input:checkbox[name="interest"]:checked').val();
				
				// 회원가입 폼 유효성 검사
				if(loginEmail == "") {
					alert("아이디를 입력하세요");
					return;
				}
				if(loginEmail)
				if(loginEmailChecked == false) {
					alert("아이디 중복체크를 확인해주세요");
					return;
				}
				if(loginEmailIsDuplicate == true){
					alert("아이디가 중복되었습니다");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				if(passwordCheck == "") {
					alert("비밀번호를 확인해주세요");
					return;
				}
				if(password != passwordCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					return "";
				}
				if(nickname == "") {
					alert("닉네임을 입력해주세요");
					return;
				}
				if(nicknameChecked == false){
					alert("닉네임 중복체크를 확인해주세요");
					return;
				}
				if(nicknameIsDuplicate == true){
					alert("닉네임이 중복되었습니다");
					return;
				}
				if(birthYear == "sel") {
					alert("년도를 선택해주세요");
					return;
				}
				if(birthMonth == "sel") {
					alert("월을 선택해주세요");
					return;
				}
				if(birthDay == "sel") {
					alert("일을 선택해주세요");
					return;
				}
				if(gender == null) {
					alert("성별을 선택해주세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginEmail":loginEmail,"password":password,"nickname":nickname, "birthYear":birthYear,"birthMonth":birthMonth,"birthDay":birthDay,"gender":gender,"userInterest":interest},
					success:function(data){
						if(data.result == "success") {
							alert("회원가입 성공");
							location.href="/user/signin_view";
						}
						else {
							alert("회원가입 실패");
						}
	
					},
					eror:function(){
						alert("에러 발생");
					}
				});
			});
			
		});
	</script>
</body>
</html>