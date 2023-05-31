<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteForme</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/guestbook.css"
	rel="stylesheet" type="text/css">

<script>
	function validateForm() {
		var password = document.forms["deleteForm"]["pwd"].value;
		if (password === "") {
			alert("비밀번호를 입력해주세요.");
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
			<h2>방명록</h2>
			<ul>
				<li>일반방명록</li>
				<li>ajax방명록</li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>일반방명록</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>방명록</li>
						<li class="last">일반방명록</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="guestbook">
				<form name="deleteForm" action="./deleteForm" method="post"
					onsubmit="return validateForm()">
					<table id="guestDelete">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 25%;">
							<col style="width: 25%;">
						</colgroup>
						<input type="hidden" name="boardId" value="${list.boardId}">
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd"></td>
							<td><button type="submit">삭제</button></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><input type='text' name="name" style="width: 98%"
								value="${list.name}"></td>
						</tr>
						<tr>
							<td colspan="3"><textarea name="content" cols="68" rows="5" style="width: 100%">${list.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="3"><a href="/mysite/guestbook/addList">[목록으로
									돌아가기]</a></td>
						</tr>
					</table>
				</form>

			</div>
			<!-- //guestbook -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>

		<div id="footer">Copyright ⓒ 2023 박재우. All right reserved</div>
		<!-- //footer -->

	</div>
	<!-- //wrap -->

</body>

</html>
