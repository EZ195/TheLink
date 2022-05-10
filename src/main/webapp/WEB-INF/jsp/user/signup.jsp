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
<title>회원가입</title>
</head>
<body>
	<div class="wrap">
		<section>
			<div class="signUp-container text_center">
				<div class="sign-up my-5">
					<form class="form-control">
						<h5 class="my-3">회원가입</h5>
						<!-- 아이디 -->
						<div class="mb-3">
							<div class="d-flex">
								<div class="col-6">
								<input class="form-control" type="email" placeholder="아이디(이메일로 입력해주세요)" id="loginEmailInput">
								</div>
								<button type="button" class="btn btn-light col-3" id="loginEmail_duplicate">중복확인</button>
							</div>
							<small class="text-danger" id="loginEmailDuplication">중복된 아이디(이메일) 입니다.</small>
							<small class="text-primary" id="loginEmailNotDuplication">사용 가능한 아이디(이메일) 입니다.</small>
						</div>
						
						<!-- 비밀번호 -->
						<div class="mb-3">
							<input class="form-control" type="password" placeholder="비밀번호" id="passwordInput">
							<input class="form-control" type="password" placeholder="비밀번호 확인" id=passwordCheck>
		
						</div>
						
						<!-- 닉네임  -->
						<div class="mb-3">
							<div class="d-flex">
								<input class="form-control" type="text" placeholder="닉네임" id="nicknameInput">
								<button type="button" class="btn btn-light" id="nickname_duplicate">중복확인</button>
							</div>
							<small class="text-danger" id="nicknameDuplication">중복된 닉네임 입니다.</small>
							<small class="text-primary" id="nicknameNotDuplication">사용 가능한 닉네임 입니다.</small>
						</div>
						
						<!-- 생년월일 -->
						<label>생년월일</label> 
						<div class="container mb-3"> 
							<!-- year -->
							<div>
							<select class="form-control" name="year" id="year" title="년도">
								<option id="yearSel" value="sel">선택</option>
								<c:forEach var="i" begin="1900" end="2022" step="1">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
							</div>
							<div>년</div>
							
							<!-- month -->
							<div>
							<select class="form-control" name="month" id="month" title="월">
								<option id="monthSel" value="sel">선택</option>
								<c:forEach var="i" begin="1" end="12" step="1">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
							<div>월</div>
							</div>
							<!-- day -->
							<div>
							<select class="form-control" name="day" id="day" title="일">
								<option id="daySel" value="sel">선택</option>
								<c:forEach var="i" begin="1" end="31" step="1">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
							</div>
							<div>일</div>
						</div>
						
						<!-- 성별 -->
						<div class="mb-3"> 
							<input type="radio" name="gender" id="male" value="male">남
							<input type="radio" name="gender" id="female" value="female">여
						</div>
						
						<!-- 관심사 -->
						<h3>관심사를 선택해주세요(중복체크 가능)</h3>
						<div class="btn-group btn-group-sm mt-3">
							<div class="form-check">
							<h5>문화·예술</h5>
								<input type="checkbox" class="btn-check mt-3" name="interest" id="culture1" value="culture_전시">
							  	<label class="btn btn-outline-danger" for="culture1">전시</label>
							
								<input type="checkbox" class="btn-check" name="interest" id="culture2" value="culture_영화">
								<label class="btn btn-outline-danger" for="culture2">영화</label>
													
								<input type="checkbox" class="btn-check" name="interest" id="culture3" value="culture_뮤지컬">
								<label class="btn btn-outline-danger" for="culture3">뮤지컬</label>
									
								<input type="checkbox" class="btn-check" name="interest" id="culture4" value="culture_공연">
								<label class="btn btn-outline-danger" for="culture4">공연</label>					
		
								<input type="checkbox" class="btn-check" name="interest" id="culture5" value="culture_디자인">
								<label class="btn btn-outline-danger" for="culture5">디자인</label>	
								
								<input type="checkbox" class="btn-check" name="interest" id="culture6" value="culture_박물관">
								<label class="btn btn-outline-danger" for="culture6">박물관</label>	
								
								<input type="checkbox" class="btn-check" name="interest" id="culture7" value="culture_연극">
								<label class="btn btn-outline-danger" for="culture7">연극</label>	
							
								<input type="checkbox" class="btn-check" name="interest" id="culture8" value="culture_콘서트">
								<label class="btn btn-outline-danger" for="culture8">콘서트</label>	
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">
							<div class="form-check">
								<h5>운동·액티비티</h5>
								<input type=checkbox class="btn-check" name="interest" id="activity1" value="러닝">
								<label class="btn btn-outline-danger" for="activity1">러닝</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity2" value="등산">
								<label class="btn btn-outline-danger" for="activity2">등산</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity3" value="트래킹">
								<label class="btn btn-outline-danger" for="activity3">트래킹</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity4" value="산책">
								<label class="btn btn-outline-danger" for="activity4">산책</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity5" value="플로깅">
								<label class="btn btn-outline-danger" for="activity5">플로깅</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity6" value="헬스">
								<label class="btn btn-outline-danger" for="activity6">헬스</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity7" value="클라이밍">
								<label class="btn btn-outline-danger" for="activity7">클라이밍</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity8" value="자전거">
								<label class="btn btn-outline-danger" for="activity8">자전거</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity9" value="서핑">
								<label class="btn btn-outline-danger" for="activity9">서핑</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity10" value="스키">
								<label class="btn btn-outline-danger" for="activity10">스키</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity11" value="보드">
								<label class="btn btn-outline-danger" for="activity11">보드</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity12" value="배드민턴">
								<label class="btn btn-outline-danger" for="activity12">배드민턴</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity13" value="테니스">
								<label class="btn btn-outline-danger" for="activity13">테니스</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity14" value="축구">
								<label class="btn btn-outline-danger" for="activity14">축구</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity15" value="농구">
								<label class="btn btn-outline-danger" for="activity15">농구</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity16" value="탁구">
								<label class="btn btn-outline-danger" for="activity16">탁구</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity17" value="볼링">
								<label class="btn btn-outline-danger" for="activity17">볼링</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity18" value="골프">
								<label class="btn btn-outline-danger" for="activity18">골프</label>
								
								<input type=checkbox class="btn-check" name="interest" id="activity19" value="스포츠경기">
								<label class="btn btn-outline-danger" for="activity19">스포츠경기</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>푸드·드링크</h5>
								<input type=checkbox class="btn-check" name="interest" id="food1" value="맛집투어">
								<label class="btn btn-outline-danger" for="food1">맛집투어</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food2" value="카페">
								<label class="btn btn-outline-danger" for="food2">카페</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food3" value="티룸">
								<label class="btn btn-outline-danger" for="food3">티룸</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food4" value="디저트">
								<label class="btn btn-outline-danger" for="food4">디저트</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food5" value="비건">
								<label class="btn btn-outline-danger" for="food5">비건</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food6" value="파인다이닝">
								<label class="btn btn-outline-danger" for="food6">파인다이닝</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food7" value="요리">
								<label class="btn btn-outline-danger" for="food7">요리</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food8" value="페어링">
								<label class="btn btn-outline-danger" for="food8">페어링</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food9" value="커피">
								<label class="btn btn-outline-danger" for="food9">커피</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food10" value="와인">
								<label class="btn btn-outline-danger" for="food10">와인</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food11" value="칵테일">
								<label class="btn btn-outline-danger" for="food11">칵테일</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food12" value="맥주">
								<label class="btn btn-outline-danger" for="food12">맥주</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food13" value="위스키">
								<label class="btn btn-outline-danger" for="food13">위스키</label>
								
								<input type=checkbox class="btn-check" name="interest" id="food14" value="전통주">
								<label class="btn btn-outline-danger" for="food14">전통주</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>취미</h5>
								<input type=checkbox class="btn-check" name="interest" id="hobby1" value="보드게임">
								<label class="btn btn-outline-danger" for="hobby1">보드게임 </label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby2" value="사진">
								<label class="btn btn-outline-danger" for="hobby2">사진</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby3" value="방탈출">
								<label class="btn btn-outline-danger" for="hobby3">방탈출</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby4" value="VR">
								<label class="btn btn-outline-danger" for="hobby4">VR</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby5" value="음악감상">
								<label class="btn btn-outline-danger" for="hobby5">음악감상</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby6" value="댄스">
								<label class="btn btn-outline-danger" for="hobby6">댄스</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby7" value="악기연주">
								<label class="btn btn-outline-danger" for="hobby7">악기연주</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby8" value="명상">
								<label class="btn btn-outline-danger" for="hobby8">명상</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby9" value="대화">
								<label class="btn btn-outline-danger" for="hobby9">대화</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby10" value="봉사활동">
								<label class="btn btn-outline-danger" for="hobby10">봉사활동</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby11" value="컬러링">
								<label class="btn btn-outline-danger" for="hobby11">컬러링</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby12" value="캘리그리피">
								<label class="btn btn-outline-danger" for="hobby12">캘리그리피</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby13" value="가드닝">
								<label class="btn btn-outline-danger" for="hobby13">가드닝</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby14" value="반려동물">
								<label class="btn btn-outline-danger" for="hobby14">반려동물</label>
								
								<input type=checkbox class="btn-check" name="interest" id="hobby15" value="만화">
								<label class="btn btn-outline-danger" for="hobby15">만화</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>여행·나들이</h5>
								<input type=checkbox class="btn-check" name="interest" id="travel1" value="복합문화공간">
								<label class="btn btn-outline-danger" for="travel1">복합문화공간</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel2" value="테마파크">
								<label class="btn btn-outline-danger" for="travel2">테마파크</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel3" value="피크닉">
								<label class="btn btn-outline-danger" for="travel3">피크닉</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel4" value="드라이브">
								<label class="btn btn-outline-danger" for="travel4">드라이브</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel5" value="캠핑">
								<label class="btn btn-outline-danger" for="travel5">캠핑</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel6" value="국내여행">
								<label class="btn btn-outline-danger" for="travel6">국내여행</label>
								
								<input type=checkbox class="btn-check" name="interest" id="travel7" value="해외여행">
								<label class="btn btn-outline-danger" for="travel7">해외여행</label>
							</div>
						</div>	
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>창작</h5>
								<input type=checkbox class="btn-check" name="interest" id="create1" value="글쓰기">
								<label class="btn btn-outline-danger" for="create1">글쓰기</label>
								
								<input type=checkbox class="btn-check" class="btn-check" name="interest" id="create2" value="드로잉">
								<label class="btn btn-outline-danger" for="create2">드로잉</label>
								
								<input type=checkbox class="btn-check" name="interest" id="create3" value="영상편집">
								<label class="btn btn-outline-danger" for="create3">영상편집</label>
								
								<input type=checkbox class="btn-check" name="interest" id="create4" value="공예">
								<label class="btn btn-outline-danger" for="create4">공예</label>
								
								<input type=checkbox class="btn-check" name="interest" id="create5" value="DIY">
								<label class="btn btn-outline-danger" for="create5">DIY</label>
								
								<input type=checkbox class="btn-check" name="interest" id="create6" value="작곡">
								<label class="btn btn-outline-danger" for="create6">작곡</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">
							<div class="form-check">
								<h5>성장·자기계발</h5>
								<input type=checkbox class="btn-check" name="interest" id="improvement1" value="독서">
								<label class="btn btn-outline-danger" for="improvement1">독서</label>
								
								<input type=checkbox class="btn-check" name="interest" id="improvement2" value="외국어">
								<label class="btn btn-outline-danger" for="improvement2">외국어</label>
								
								<input type=checkbox class="btn-check" name="interest" id="improvement3" value="재테크">
								<label class="btn btn-outline-danger" for="improvement3">재테크</label>
								
								<input type=checkbox class="btn-check" name="interest" id="improvement4" value="브랜딩">
								<label class="btn btn-outline-danger" for="improvement4">브랜딩</label>
								
								<input type=checkbox class="btn-check" name="interest" id="improvement5" value="커리어">
								<label class="btn btn-outline-danger" for="improvement5">커리어</label>
								
								<input type=checkbox class="btn-check" name="interest" id="improvement6" value="사이드 프로젝트">
								<label class="btn btn-outline-danger" for="improvement6">사이드 프로젝트</label>
							</div>
						</div>
						
						<div align="center" class="mt-3 my-3">
							<button class="btn btn-lg btn-primary" type="button" id="signupBtn">회원가입</button>
							이미 회원이라면, <a href="/user/signin_view">로그인</a> 하러가기				
						</div>
					</form>
				</div>
			</div>
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
					url:"/user/profile/nickname_duplicate",
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
				let interest = $("input[name='interest']:checked").val();

				var interestList = [];
				var cnt = $("input[name=interest]:checkbox:checked").length;
				
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
				if(cnt < 1) {
					alert("관심사는 한개 이상 선택해 주세요");
					return;
				}
				
			    $("input[name='interest']:checked").each(function(i) {
			    	interestList.push($(this).val());
			    });	    

				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginEmail":loginEmail,"password":password,"nickname":nickname, "birthYear":birthYear,"birthMonth":birthMonth,"birthDay":birthDay,"gender":gender,"userInterestList":interestList},
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