<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="header">
	<h1>
		<a href="/mysite/main">MySite</a>
	</h1>

	<!-- JSTL 로그인시-->
	<ul>
		<c:choose>
			<c:when test="${!empty user.id}">
				<li>${user.id}님안녕하세요^^</li>
				<li><a href="/mysite/user/logout">로그아웃</a></li>
				<li><a href="/mysite/user/modifyForm">회원정보수정</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/mysite/user/loginForm">로그인</a></li>
				<li><a href="/mysite/user/joinForm">회원가입</a></li>
			</c:otherwise>
		</c:choose>
	</ul>

</div>

<div id="nav">
	<ul>
		<li><a href="/mysite/guestbook/addList">방명록</a></li>
		<li><a href="">갤러리</a></li>
		<li><a href="/mysite/board/list">게시판</a></li>
		<li><a href="">입사지원서</a></li>
	</ul>
	<div class="clear"></div>
</div>