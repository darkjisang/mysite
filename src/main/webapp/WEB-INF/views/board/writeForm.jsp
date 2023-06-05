<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">	
function validateForm() {
	var check = $(".userJoin").val();
	if (check === "" && (alert("내용 확인."), true)) {
		return false;
	}
}
</script>

</head>
<body>
	<div id="wrap">

		<!-- //header -->
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
		<!-- //nav -->

		<div id="aside">
			<h2>일반게시판</h2>
			<ul>
				<li><a href="/mysite/board/list">일반게시판</a></li>
				<li><a href="">댓글게시판</a></li>
			</ul>
		</div>
		<!-- //aside -->


		<div id="content">

			<div id="content-head">
				<h3>일반 게시판</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>게시판</li>
						<li class="last">일반게시판</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="board">
				<div id="writeForm">
					<form action="./boardInsert" method="get" name="writeForm" onsubmit="return validateForm()">
						<!-- 제목 -->
						<div class="form-group">
							<label class="form-text" for="txt-title">제목</label> <input
								type="text" id="txt-title" name="title" value="" class="userJoin"
								placeholder="제목을 입력해 주세요">
						</div>

						<!-- 내용 -->
						<div class="form-group">
							<textarea id="txt-content" name="content" class="userJoin"></textarea>
						</div>
						<input type="hidden" name="userNo" value="${user.no}"> <a
							id="btn_cancel" href="./list">취소</a>
						<button id="btn_add" type="submit">등록</button>

					</form>
					<!-- //form -->
				</div>
				<!-- //writeForm -->
			</div>
			<!-- //board -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>

		<div id="footer">Copyright ⓒ 2023 박재우. All right reserved</div>
		<!-- //footer -->
	</div>
	<!-- //wrap -->

</body>

</html>
