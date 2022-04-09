<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
</head>
<body>
	<form>
		<input type="email" placeholder="아이디(이메일)" id="loginEmailInput">
		<button id="email_duplicate">중복확인</button>
		<input type="password" placeholder="비밀번호" id="passwordInput">
		<input type="password" placeholder="비밀번호 확인" id=passwordCheck>
		<input type="text" placeholder="닉네임" id="nicknameInput">
		<button id="nickname_duplicate">중복확인</button>
		
		<div> <!-- 생일 -->
			<label>생년월일</label>
			<select name="year" id="year" title="년도">
				<option id="yearSel" value="sel">선택</option>
				<c:forEach var="i" begin="1900" end="2022" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select>년
				
			<select name="month" id="month" title="월">
				<option id="monthSel" value="sel">선택</option>
				<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select>월
			<select name="day" id="day" title="일">
				<option id="daySel" value="sel">선택</option>
				<c:forEach var="i" begin="1" end="31" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select>일
		</div>
		
		<div> <!-- 성별 -->
			<input type="radio" name="gender" id="male" value="male">남
			<input type="radio" name="gender" id="female" value="female">여
		</div>
		
		<label>관심사를 선택해주세요(중복체크 가능)</label>
		<div>
			<h3>문화·예술</h3>
			<label><input type=checkbox name="culture" value="전시">전시</label>
			<label><input type=checkbox name="culture" value="영화">영화</label>
			<label><input type=checkbox name="culture" value="뮤지컬">뮤지컬</label>
			<label><input type=checkbox name="culture" value="공연">공연</label>
			<label><input type=checkbox name="culture" value="디자인">디자인</label>
			<label><input type=checkbox name="culture" value="박물관">박물관</label>
			<label><input type=checkbox name="culture" value="연극">연극</label>
			<label><input type=checkbox name="culture" value="콘서트">콘서트</label>
		</div>
		<div>
			<h3>운동·액티비티</h3>
			<label><input type=checkbox name="activity" value="">러닝</label>
			<label><input type=checkbox name="activity" value="">등산</label>
			<label><input type=checkbox name="activity" value="">트래킹</label>
			<label><input type=checkbox name="activity" value="">산책</label>
			<label><input type=checkbox name="activity" value="">플로깅</label>
			<label><input type=checkbox name="activity" value="">헬스</label>
			<label><input type=checkbox name="activity" value="">클라이밍</label>
			<label><input type=checkbox name="activity" value="">자전거</label>
			<label><input type=checkbox name="activity" value="">서핑</label>
			<label><input type=checkbox name="activity" value="">스키</label>
			<label><input type=checkbox name="activity" value="">보드</label>
			<label><input type=checkbox name="activity" value="">배드민턴</label>
			<label><input type=checkbox name="activity" value="">테니스</label>
			<label><input type=checkbox name="activity" value="">축구</label>
			<label><input type=checkbox name="activity" value="">농구</label>
			<label><input type=checkbox name="activity" value="">탁구</label>
			<label><input type=checkbox name="activity" value="">볼링</label>
			<label><input type=checkbox name="activity" value="">골프</label>
			<label><input type=checkbox name="activity" value="">스포츠경기</label>
		</div>
		<div>
			<h3>푸드·드링크</h3>
		</div>
		<div>
			<h3>취미</h3>
		</div>
		<div>
			<h3>여행·나들이</h3>
		</div>
		<div>
			<h3>창작</h3>
		</div>
		<div>
			<h3>성장·자기계발</h3>
		</div>
		
		
		
		
		
		<button type="button" id="signupBtn">회원가입</button>
		이미 회원이면 <a href="/user/signin_view">로그인</a> 하러가기
	</form>
	
	<script>
		$().ready(function(){
			
			$("#signupBtn").on("click",function(){
				
				let loginEmail = $("#loginEmailInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordCheck").val();
				let nickname = $("#nicknameInput").val();
				let birthYear = $("#year").val();
				let birthMonth = $("#month").val();
				let birthDay = $("#day").val();
				let gender = $("input:radio[name=gender]:checked").val();
				
				if(loginEmail == "") {
					alert("아이디를 입력하세요");
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
					data:{"loginEmail":loginEmail,"password":password,"nickname":nickname, "birthYear":birthYear,"birthMonth":birthMonth,"birthDay":birthDay,"gender":gender},
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