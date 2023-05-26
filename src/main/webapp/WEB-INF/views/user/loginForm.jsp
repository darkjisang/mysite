<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet"
	type="text/css">

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
				<h3>로그인</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>회원</li>
						<li class="last">로그인</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="user">
				<div id="loginForm">
					<form action="/mysite/user/login" method="get">

						<!-- 아이디 -->
						<div class="form-group">
							<label class="form-text" for="input-uid">아이디</label> <input
								type="text" id="input-uid" name="id" value=""
								placeholder="아이디를 입력하세요">
						</div>

						<!-- 비밀번호 -->
						<div class="form-group">
							<label class="form-text" for="input-pass">비밀번호</label> <input
								type="password" id="input-pass" name="password" value=""
								placeholder="비밀번호를 입력하세요">
						</div>
						
						<p>로그인에 실패했습니다. 다시 시도하세요.</p>

						<!-- 버튼영역 -->
						<div class="button-area">
							<button type="submit" id="btn-submit">로그인</button>
						</div>

					</form>
				</div>
				<!-- //loginForm -->
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

</html>