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
<meta charset="UTF-8">
<title>Post Form</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/header.jsp"/>
		<section>
			<form>
				<h1 align="center">모임 만들기</h1>
				
				<!-- 제목 -->
				<input type=text id="titleInput" placeholder="제목">
				
				<!-- 내용 -->
				<textarea id="contentInput" placeholder="내용을 입력하세요"></textarea>
				
				<!-- 날짜 -->
				<input type=date id="dateInput">
				
				<!-- 인원 수 -->
				<select id="headcountInput">
					<option value="sel">인원수</option>
					<c:forEach var="i" begin="2" end="15" step="1">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select>
				
				<!-- 관심사 -->
				<h3>카테고리를 선택해주세요(중복체크 가능)</h3>
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
						<label class="btn btn-outline-danger" for="culture5">공연</label>	
						
						<input type="checkbox" class="btn-check" name="interest" id="culture6" value="culture_박물관">
						<label class="btn btn-outline-danger" for="culture6">박물관</label>	
						
						<input type="checkbox" class="btn-check" name="interest" id="culture7" value="culture_연극">
						<label class="btn btn-outline-danger" for="culture7">연극</label>	
					
						<input type="checkbox" class="btn-check" name="interest" id="culture8" value="culture_콘서트">
						<label class="btn btn-outline-danger" for="culture8">콘서트</label>	
					</div>
				</div>
				
				<button type="button" id="createBtn">모임 만들기</button>
			</form>
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
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:{"title":title,"content":content,"meetingDate":date,"headcount":headcount},
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