<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteFail</title>
<script>
	window.onload = function() {
		alert("Delete 실패. 패스워드 확인요망!!!"); // 페이지 로딩 후 경고창 표시
		<c:if test="${not empty boardId}">
		var boardId = "${boardId}";
		var url = "/mysite/guestbook/deleteForm/" + boardId; // URL을 동적으로 구성합니다.
		window.location.href = url; // /deleteForm 페이지로 이동
		</c:if>
	};
</script>
</head>
<body>
</body>
</html>