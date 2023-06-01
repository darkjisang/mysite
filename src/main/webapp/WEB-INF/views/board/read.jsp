<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Page</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrap">

		<!-- //header -->
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
		<!-- //nav -->

		<div id="aside">
			<h2>게시판</h2>
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
				<div id="read">
					<form action="#" method="get">
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
							<span class="form-text">제 목</span> <span class="form-value">${boardList.title}</span>
						</div>

						<!-- 내용 -->
						<div id="txt-content">
							<span class="form-value">
								<script>
									var content = "${boardList.content}";
									var maxLength = 50; // 일정 길이 지정
									var formattedContent = "";
									for (var i = 0; i < content.length; i += maxLength) {
										var substring = content.substring(i, i
												+ maxLength);
										formattedContent += substring + "<br>";
									}
									document.write(formattedContent);
								</script>
							</span>
						</div>
						
						<c:choose>
							<c:when test="${user.no == boardList.userNo}">
								<a id="btn_modify" href="/mysite/board/modifyForm/${boardList.boardNo}">수정</a> 
							</c:when>
						</c:choose>
						<a id="btn_modify" href="/mysite/board/list">목록</a>

					</form>
					<!-- //form -->
				</div>
				<!-- //read -->
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