<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/guestbook.css"
	rel="stylesheet" type="text/css">
	
<script>
	function validateForm() {
		var name = document.forms["addList"]["name"].value.trim();
		var pwd = document.forms["addList"]["pwd"].value.trim();
		var content = document.forms["addList"]["content"].value.trim();
		return name !== "" ? pwd !== "" ? content !== "" : (alert("내용을 입력해주세요."), false) : (alert("패스워드를 입력해주세요."), false);
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
				<form name= "addList" action="./boardInsert" method="get" onsubmit="return validateForm()">
					<table id="guestAdd">
						<colgroup>
							<col style="width: 70px;">
							<col>
							<col style="width: 70px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th><label class="form-text" for="input-uname">이름</label>
								</td>
								<td><input id="input-uname" type="text" name="name"></td>
								<th><label class="form-text" for="input-pass">패스워드</label>
								</td>
								<td><input id="input-pass" type="password" name="pwd"></td>
							</tr>
							<tr>
								<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
							</tr>
							<tr class="button-area">
								<td colspan="4"><button type="submit">등록</button></td>
							</tr>
						</tbody>

					</table>
					<!-- //guestWrite -->
					<input type="hidden" name="action" value="add">

				</form>


				<!-- //guestRead -->

				<c:forEach var="list" items="${list}">
					<table class="guestRead">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
						</colgroup>
						<tr>
							<td>${list.boardId}</td>
							<td>${list.name}</td>
							<td>${list.regDate}</td>
							<td><a href="./deleteForm/${list.boardId}">[삭제]</a></td>
						</tr>
						<tr>
							<td colspan=4 class="text-left">${list.content}</td>
						</tr>
					</table>
					<br>
				</c:forEach>
				<!-- //guestRead -->

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