<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinForm</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">

		<!-- //header -->
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
		<!-- //nav -->

		<div id="aside">
			<h2>회원</h2>
			<ul>
				<li>회원정보</li>
				<li><a href="/mysite/user/loginForm">로그인</a></li>
				<li><a href="/mysite/user/joinForm">회원가입</a></li>
			</ul>
		</div>
		<!-- //aside -->
		<div id="content">
			<div id="content-head">
				<h3>회원가입</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>회원</li>
						<li class="last">회원가입</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->
			<div id="user">
				<div id="joinForm">
					<form id="joinSubmitForm" action="/mysite/user/join" method="get" name="joinForm" onsubmit="return validateForm()">
						<!-- 아이디 -->
						<div class="form-group">
							<label class="form-text" for="input-uid">아이디</label> 
							<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요" class="userJoin">
							<button type="button" id="checkBtn">중복체크</button>
							<p id="idCheckMsg" align="center" />
						</div>
						<!-- 비밀번호 -->
						<div class="form-group">
							<label class="form-text" for="input-pass">패스워드</label> 
							<input type="password" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요" class="userJoin">
						</div>
						<!-- 이름 -->
						<div class="form-group">
							<label class="form-text" for="input-name">이름</label> 
							<input type="text" id="input-name" name="name" value="" placeholder="이름을 입력하세요" class="userJoin">
						</div>
						<!-- 성별 -->
						<div class="form-group">
							<span class="form-text">성별</span> 
							<label for="rdo-male">남</label> <input type="radio" id="rdo-male" name="gender" value="male" class="userJoin">
							<label for="rdo-female">여</label> 
							<input type="radio" id="rdo-female" name="gender" value="female" class="userJoin">
						</div>
						<!-- 약관동의 -->
						<div class="form-group">
							<span class="form-text">약관동의</span> <input type="checkbox" id="chk-agree" value="" name=""> 
							<label for="chk-agree">서비스 약관에 동의합니다.</label>
						</div>
						<!-- 버튼영역 -->
						<div class="button-area">
							<button type="submit" id="btn-submit">회원가입</button>
						</div>
						<a id="naver" href="https://www.naver.com/">Naver</a>
					</form>
				</div>
				<!-- //joinForm -->
			</div>
			<!-- //user -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>
		<div id="footer">Copyright ⓒ 2023 박재우. All right reserved</div>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
</body>

<script type="text/javascript">
	//event Default
	$("#naver").on("click", function(e) {
		e.preventDefault();
	});

	//회원가입 버튼 클릭 : 전송 submit은 form에 이벤트 
	$("#btn-submit").on("click", function() {
		//console.log("Submit Click");
		//id 체크
		var id = $("#input-uid").val();
		if(id.length < 1){	//글자수가 0
			alert("id 없음");
			return false;
		}
		//pwd 체크
		var pwd = $("#input-pass").val();
		if(pwd.length < 1){	//글자수가 0
			alert("pwd 없음");
			return false;
		}
		//name 체크
		var name = $("#input-name").val();
		if(name.length < 1){	//글자수가 0
			alert("name 없음");
			return false;
		}
		//name 체크
		//약관 동의
		var gender = $("rdo-female").is(":checked");
		console.log(gender);
		if(gender == false){
			alert("성별확인");
		}
		
		
		var agree = $("#chk-agree").is(":checked");
		if(agree == false){
			alert("약관에 동의해주세요.");
			return false;
		}
		
		return true;
	});
	//클래스로 묶어서 처리
	/* function validateForm() {
		var check = $(".userJoin").val();
		if (check === "") {
			alert("입력 확인.");
			return false; 
		}
	}*/
	
	$("#checkBtn").on("click", function() {
				var check = $("#input-uid").val();
				if (check === "") {
					alert("아이디를 입력하시오.");
					return false;
				}
				//id 추출
				var id = $("[name = id]").val();

				//통신
				$.ajax({
					url : "${pageContext.request.contextPath}/user/idCheck",
					type : "post",
					/* contentType : "application/json", */
					data : {
						id : id
					},
					dataType : "json",
					success : function(jsonResult) {
						console.log(jsonResult);
						if (jsonResult.result == 'success') {
							if (jsonResult.data == true) {
								$("#idCheckMsg").css("color", "blue").html(
										id + " 사용가능");
							} else {
								$("#idCheckMsg").css("color", "red").html(
										id + " 사용불가");
							}
						}
						/* if (result !== null) {
							//$("#idCheckMsg").css(" 사용불가", "red");
							//$("#idCheckMsg").html(id + " 사용불가");
							$("#idCheckMsg").css("color", "red").html(id + " 사용불가");
						}  */
						/*성공시 처리해야될 코드 작성*/
					},
					error : function(XHR, status, error) {
						//$("#idCheckMsg").css("color", "blue").html(id + " 사용가능");
					}
				});
			});

</script>
</html>
