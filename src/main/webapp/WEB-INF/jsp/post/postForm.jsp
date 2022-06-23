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
<title>Post Form</title>
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<div class="timeline-container">
				<div class="sign-up my-5">
					<form class="form-control">
						<h1 class="align-center my-3">모임 만들기</h1>
						
						<!-- 제목 -->
						<div class="mb-3">
							<div class="d-flex ">
								<div class="col-12">
								<input class="form-control" type=text id="titleInput" placeholder="제목">
								</div>
							</div>
						</div>
						
						<!-- 내용 -->
						<div class="mb-3">
							<div class="d-flex ">
								<div class="col-12">
								<textarea class="form-control" id="contentInput" rows="20" placeholder="내용을 입력하세요"></textarea>
								</div>
							</div>
						</div>
						
						<div class="mb-3">
						<div class="d-flex content-center">
							<!-- 날짜 -->
							<div>모임 날짜 : </div>
							<div class="col-5"><input class="form-control" type="date" id="dateInput"></div>
						
							
							<!-- 인원 수 -->
							<div>인원수 : </div>
							<div class="col-3">
								<select class="form-control" id="headcountInput">
									<option id="monthSel" value="sel">선택</option>
									<c:forEach var="i" begin="2" end="15" step="1">
										<option value="${i }">${i }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						</div>
						
						<!-- 관심사 -->
						<div class="align-center">
							<h4>카테고리를 선택해주세요</h4>
						</div>
						<div class="btn-group btn-group-sm">
							<div class="form-check">
							<h5>문화·예술</h5>
								<input type="radio" class="btn-check mt-3" name="category" id="culture1" value="전시">
							  	<label class="btn btn-outline-danger" for="culture1">전시</label>
							
								<input type="radio" class="btn-check" name="category" id="culture2" value="영화">
								<label class="btn btn-outline-danger" for="culture2">영화</label>
													
								<input type="radio" class="btn-check" name="category" id="culture3" value="뮤지컬">
								<label class="btn btn-outline-danger" for="culture3">뮤지컬</label>
									
								<input type="radio" class="btn-check" name="category" id="culture4" value="공연">
								<label class="btn btn-outline-danger" for="culture4">공연</label>					
		
								<input type="radio" class="btn-check" name="category" id="culture5" value="디자인">
								<label class="btn btn-outline-danger" for="culture5">디자인</label>	
								
								<input type="radio" class="btn-check" name="category" id="culture6" value="박물관">
								<label class="btn btn-outline-danger" for="culture6">박물관</label>	
								
								<input type="radio" class="btn-check" name="category" id="culture7" value="연극">
								<label class="btn btn-outline-danger" for="culture7">연극</label>	
							
								<input type="radio" class="btn-check" name="category" id="culture8" value="콘서트">
								<label class="btn btn-outline-danger" for="culture8">콘서트</label>	
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">
							<div class="form-check">
								<h5>운동·액티비티</h5>
								<input type="radio" class="btn-check" name="category" id="activity1" value="러닝">
								<label class="btn btn-outline-danger" for="activity1">러닝</label>
								
								<input type="radio" class="btn-check" name="category" id="activity2" value="등산">
								<label class="btn btn-outline-danger" for="activity2">등산</label>
								
								<input type="radio" class="btn-check" name="category" id="activity3" value="트래킹">
								<label class="btn btn-outline-danger" for="activity3">트래킹</label>
								
								<input type="radio" class="btn-check" name="category" id="activity4" value="산책">
								<label class="btn btn-outline-danger" for="activity4">산책</label>
								
								<input type="radio" class="btn-check" name="category" id="activity5" value="플로깅">
								<label class="btn btn-outline-danger" for="activity5">플로깅</label>
								
								<input type="radio" class="btn-check" name="category" id="activity6" value="헬스">
								<label class="btn btn-outline-danger" for="activity6">헬스</label>
								
								<input type="radio" class="btn-check" name="category" id="activity7" value="클라이밍">
								<label class="btn btn-outline-danger" for="activity7">클라이밍</label>
								
								<input type="radio" class="btn-check" name="category" id="activity8" value="자전거">
								<label class="btn btn-outline-danger" for="activity8">자전거</label>
								
								<input type="radio" class="btn-check" name="category" id="activity9" value="서핑">
								<label class="btn btn-outline-danger" for="activity9">서핑</label>
								
								<input type="radio" class="btn-check" name="category" id="activity10" value="스키">
								<label class="btn btn-outline-danger" for="activity10">스키</label>
								
								<input type="radio" class="btn-check" name="category" id="activity11" value="보드">
								<label class="btn btn-outline-danger" for="activity11">보드</label>
								
								<input type="radio" class="btn-check" name="category" id="activity12" value="배드민턴">
								<label class="btn btn-outline-danger" for="activity12">배드민턴</label>
								
								<input type="radio" class="btn-check" name="category" id="activity13" value="테니스">
								<label class="btn btn-outline-danger" for="activity13">테니스</label>
								
								<input type="radio" class="btn-check" name="category" id="activity14" value="축구">
								<label class="btn btn-outline-danger" for="activity14">축구</label>
								
								<input type="radio" class="btn-check" name="category" id="activity15" value="농구">
								<label class="btn btn-outline-danger" for="activity15">농구</label>
								
								<input type="radio" class="btn-check" name="category" id="activity16" value="야구">
								<label class="btn btn-outline-danger" for="activity16">야구</label>
								
								<input type="radio" class="btn-check" name="category" id="activity17" value="탁구">
								<label class="btn btn-outline-danger" for="activity17">탁구</label>
								
								<input type="radio" class="btn-check" name="category" id="activity18" value="볼링">
								<label class="btn btn-outline-danger" for="activity18">볼링</label>
								
								<input type="radio" class="btn-check" name="category" id="activity19" value="골프">
								<label class="btn btn-outline-danger" for="activity19">골프</label>
								
								<input type="radio" class="btn-check" name="category" id="activity20" value="스포츠경기">
								<label class="btn btn-outline-danger" for="activity20">스포츠경기</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>푸드·드링크</h5>
								<input type="radio" class="btn-check" name="category" id="food1" value="맛집투어">
								<label class="btn btn-outline-danger" for="food1">맛집투어</label>
								
								<input type="radio" class="btn-check" name="category" id="food2" value="카페">
								<label class="btn btn-outline-danger" for="food2">카페</label>
								
								<input type="radio" class="btn-check" name="category" id="food3" value="티룸">
								<label class="btn btn-outline-danger" for="food3">티룸</label>
								
								<input type="radio" class="btn-check" name="category" id="food4" value="디저트">
								<label class="btn btn-outline-danger" for="food4">디저트</label>
								
								<input type="radio" class="btn-check" name="category" id="food5" value="비건">
								<label class="btn btn-outline-danger" for="food5">비건</label>
								
								<input type="radio" class="btn-check" name="category" id="food6" value="파인다이닝">
								<label class="btn btn-outline-danger" for="food6">파인다이닝</label>
								
								<input type="radio" class="btn-check" name="category" id="food7" value="요리">
								<label class="btn btn-outline-danger" for="food7">요리</label>
								
								<input type="radio" class="btn-check" name="category" id="food8" value="페어링">
								<label class="btn btn-outline-danger" for="food8">페어링</label>
								
								<input type="radio" class="btn-check" name="category" id="food9" value="커피">
								<label class="btn btn-outline-danger" for="food9">커피</label>
								
								<input type="radio" class="btn-check" name="category" id="food10" value="와인">
								<label class="btn btn-outline-danger" for="food10">와인</label>
								
								<input type="radio" class="btn-check" name="category" id="food11" value="칵테일">
								<label class="btn btn-outline-danger" for="food11">칵테일</label>
								
								<input type="radio" class="btn-check" name="category" id="food12" value="맥주">
								<label class="btn btn-outline-danger" for="food12">맥주</label>
								
								<input type="radio" class="btn-check" name="category" id="food13" value="위스키">
								<label class="btn btn-outline-danger" for="food13">위스키</label>
								
								<input type="radio" class="btn-check" name="category" id="food14" value="전통주">
								<label class="btn btn-outline-danger" for="food14">전통주</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>취미</h5>
								<input type="radio" class="btn-check" name="category" id="hobby1" value="보드게임">
								<label class="btn btn-outline-danger" for="hobby1">보드게임 </label>
								
								<input type="radio" class="btn-check" name="category" id="hobby2" value="사진">
								<label class="btn btn-outline-danger" for="hobby2">사진</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby3" value="방탈출">
								<label class="btn btn-outline-danger" for="hobby3">방탈출</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby4" value="VR">
								<label class="btn btn-outline-danger" for="hobby4">VR</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby5" value="음악감상">
								<label class="btn btn-outline-danger" for="hobby5">음악감상</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby6" value="댄스">
								<label class="btn btn-outline-danger" for="hobby6">댄스</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby7" value="악기연주">
								<label class="btn btn-outline-danger" for="hobby7">악기연주</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby8" value="명상">
								<label class="btn btn-outline-danger" for="hobby8">명상</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby9" value="대화">
								<label class="btn btn-outline-danger" for="hobby9">대화</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby10" value="봉사활동">
								<label class="btn btn-outline-danger" for="hobby10">봉사활동</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby11" value="컬러링">
								<label class="btn btn-outline-danger" for="hobby11">컬러링</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby12" value="캘리그리피">
								<label class="btn btn-outline-danger" for="hobby12">캘리그리피</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby13" value="가드닝">
								<label class="btn btn-outline-danger" for="hobby13">가드닝</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby14" value="반려동물">
								<label class="btn btn-outline-danger" for="hobby14">반려동물</label>
								
								<input type="radio" class="btn-check" name="category" id="hobby15" value="만화">
								<label class="btn btn-outline-danger" for="hobby15">만화</label>
							</div>
						</div>
				
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>여행·나들이</h5>
								<input type="radio" class="btn-check" name="category" id="travel1" value="복합문화공간">
								<label class="btn btn-outline-danger" for="travel1">복합문화공간</label>
								
								<input type="radio" class="btn-check" name="category" id="travel2" value="테마파크">
								<label class="btn btn-outline-danger" for="travel2">테마파크</label>
								
								<input type="radio" class="btn-check" name="category" id="travel3" value="피크닉">
								<label class="btn btn-outline-danger" for="travel3">피크닉</label>
								
								<input type="radio" class="btn-check" name="category" id="travel4" value="드라이브">
								<label class="btn btn-outline-danger" for="travel4">드라이브</label>
								
								<input type="radio" class="btn-check" name="category" id="travel5" value="캠핑">
								<label class="btn btn-outline-danger" for="travel5">캠핑</label>
								
								<input type="radio" class="btn-check" name="category" id="travel6" value="국내여행">
								<label class="btn btn-outline-danger" for="travel6">국내여행</label>
								
								<input type="radio" class="btn-check" name="category" id="travel7" value="해외여행">
								<label class="btn btn-outline-danger" for="travel7">해외여행</label>
							</div>
						</div>	
						<div class="btn-group btn-group-sm mt-3">	
							<div class="form-check">
								<h5>창작</h5>
								<input type="radio" class="btn-check" name="category" id="create1" value="글쓰기">
								<label class="btn btn-outline-danger" for="create1">글쓰기</label>
								
								<input type="radio" class="btn-check" name="category" id="create2" value="드로잉">
								<label class="btn btn-outline-danger" for="create2">드로잉</label>
								
								<input type="radio" class="btn-check" name="category" id="create3" value="영상편집">
								<label class="btn btn-outline-danger" for="create3">영상편집</label>
								
								<input type="radio" class="btn-check" name="category" id="create4" value="공예">
								<label class="btn btn-outline-danger" for="create4">공예</label>
								
								<input type="radio" class="btn-check" name="category" id="create5" value="DIY">
								<label class="btn btn-outline-danger" for="create5">DIY</label>
								
								<input type="radio" class="btn-check" name="category" id="create6" value="작곡">
								<label class="btn btn-outline-danger" for="create6">작곡</label>
							</div>
						</div>
						<div class="btn-group btn-group-sm mt-3">
							<div class="form-check">
								<h5>성장·자기계발</h5>
								<input type="radio" class="btn-check" name="category" id="improvement1" value="독서">
								<label class="btn btn-outline-danger" for="improvement1">독서</label>
								
								<input type="radio" class="btn-check" name="category" id="improvement2" value="외국어">
								<label class="btn btn-outline-danger" for="improvement2">외국어</label>
								
								<input type="radio" class="btn-check" name="category" id="improvement3" value="재테크">
								<label class="btn btn-outline-danger" for="improvement3">재테크</label>
								
								<input type="radio" class="btn-check" name="category" id="improvement4" value="브랜딩">
								<label class="btn btn-outline-danger" for="improvement4">브랜딩</label>
								
								<input type="radio" class="btn-check" name="category" id="improvement5" value="커리어">
								<label class="btn btn-outline-danger" for="improvement5">커리어</label>
								
								<input type="radio" class="btn-check" name="category" id="improvement6" value="사이드 프로젝트">
								<label class="btn btn-outline-danger" for="improvement6">사이드 프로젝트</label>
							</div>
						</div>
						<div align="center" class="mt-3 my-3">
							<button class="btn btn-lg btn-danger mb-3" type="button" id="createBtn">모임 만들기</button>	
						</div>
						
					</form>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
	</div>
	<script>
		$().ready(function(){
			
			$("#createBtn").on("click",function(){
				
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				let date = $("#dateInput").val();
				let headcount = $("#headcountInput").val();
				let category = $("input[name='category']:checked").val();
				
				// 폼 유효성 검사
				if(title == "") {
					alert("제목을 입력하세요");
					return;
				}
				if(content == "") {
					alert("내용을 입력하세요");
					return;
				}
				if(date == "") {
					alert("날짜를 선택하세요");
					return;
				}
				if(headcount == "sel") {
					alert("인원 수를 선택하세요");
					return;
				}
				
				if(category == null) {
					alert("카테고리를 선택해주세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:{"title":title,"content":content,"meetingDate":date,"headcount":headcount,"postCategory":category},
					success:function(data){
						if(data.result == "success") {
							alert("업로드 성공");
							location.href="/post/timeline_view";
						}
						else {
							alert("업로드 실패");
						}
					},
					error:function(){
						alert("에러발생");
					}
				});
			});
		});
	</script>

</body>
</html>