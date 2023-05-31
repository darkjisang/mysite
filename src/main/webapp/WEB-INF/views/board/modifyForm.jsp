<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
	
<script>
	function validateForm() {
		var title = document.forms["modifyForm"]["title"].value;
		if (title === "") {
			alert("제목을 입력해주세요.");
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
			<h2>게시판</h2>
			<ul>
				<li><a href="">일반게시판</a></li>
				<li><a href="">댓글게시판</a></li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>게시판</h3>
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
				<div id="modifyForm">
					<form name="modifyForm" action="/mysite/board/update" method="get" onsubmit="return validateForm()">
						<input type="hidden" name="boardNo" value="${boardList.boardNo}">
						<!-- 작성자 -->
						<div class="form-group">
							<span class="form-text">작성자</span> <span class="form-value">${boardList.userName}</span>
						</div>

						<!-- 조회수 -->
						<div class="form-group">
							<span class="form-text">조회수</span> <span class="form-value">${boardList.cnt}</span>
						</div>

						<!-- 작성일 -->
						<div class="form-group">
							<span class="form-text">작성일</span> <span class="form-value">${boardList.regdate}</span>
						</div>

						<!-- 제목 -->
						<div class="form-group">
							<label class="form-text" for="txt-title">제목</label> <input
								type="text" id="txt-title" name="title" value="${boardList.title}">
						</div>

						<!-- 내용 -->
						<div class="form-group">
							<textarea id="txt-content" name="content">${boardList.content}</textarea>
						</div>

						<a id="btn_cancel" href="/mysite/board/read/${boardList.boardNo}">취소</a>
						<button id="btn_modify" type="submit">수정</button>

					</form>
					<!-- //form -->
				</div>
				<!-- //modifyForm -->
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