<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<script>
   $(document).ready(function() {

      $("#paging .pageInfo a").on("click", function(e) {
         e.preventDefault();
         var pageNum = $(this).attr("href");
         $("#moveForm input[name='pageNum']").val(pageNum);
         $("#moveForm").submit();
      });

   });
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
				<div id="list">
					<form action="./list" method="get">
						<div class="form-group text-right">
							<select name="type">
				                <option value="" <c:out value="${pageMake.cri.type == null?'selected':'' }"/>>--</option>
				                <option value="T" <c:out value="${pageMake.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				                <option value="C" <c:out value="${pageMake.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				                <option value="W" <c:out value="${pageMake.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
				                <option value="TC" <c:out value="${pageMake.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
				            </select>
							<input type="text" name="keyword" value="${pageMake.cri.keyword }">
							<%-- <input type="hidden" name="type" value="${pageMake.cri.type }"> --%>
							<button type="submit" id=btn_search>검색</button>
						</div>
					</form>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>관리</th>
							</tr>
						</thead>

						<c:forEach var="boardList" items="${boardList}">
							<input type="hidden" name="boardNo" value="${boardList.boardNo}">
							<tbody>
								<tr>
									<td>${boardList.boardNo}</td>
									<td class="text-center"><a
										href="./read/${boardList.boardNo}">${boardList.title}</a></td>
									<td>${boardList.userName}</td>
									<td>${boardList.cnt}</td>
									<td>${boardList.regdate}</td>

									<c:choose>
										<c:when test="${user.no == boardList.userNo}">
											<td><a href="./delete/${boardList.boardNo}">[삭제]</a></td>
										</c:when>
									</c:choose>

								</tr>
							</tbody>
						</c:forEach>
					</table>

					<div id="paging">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전페이지 버튼 -->
			                <c:if test="${pageMake.prev}">
			                    <li class="pageInfo_btn previous"><a href="${pageMake.startPage-1}">◀</a></li>
			                </c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMake.startPage }" end="${pageMake.endPage }">
								<li class="pageInfo_btn ${pageMake.cri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
			                <c:if test="${pageMake.next}">
			                    <li class="pageInfo_btn next"><a href="${pageMake.endPage + 1 }">▶</a></li>
			                </c:if>
						</ul>

						<div class="clear"></div>
					</div>
					<form action="list" id="moveForm" method="get">
						<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMake.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMake.cri.keyword }">
						<input type="hidden" name="type" value="${pageMake.cri.type }">
					</form>

					<c:choose>
						<c:when test="${!empty user.id}">
							<a id="btn_write" href="/mysite/board/writeForm">글쓰기</a>
						</c:when>
						<c:otherwise>
							<a id="btn_write" href="/mysite/user/loginForm">글쓰기</a>
						</c:otherwise>
					</c:choose>


				</div>
				<!-- //list -->
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