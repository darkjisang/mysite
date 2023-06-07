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
<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<!-- 부트스트랩js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
	<div id="wrap">

		<!-- //header -->
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
		<!-- //nav -->

		<div id="aside">
			<h2>방명록</h2>
			<ul>
				<li><a href="/mysite/guestbook/addList">일반방명록</a></li>
				<li><a href="/mysite/api/guestbook/addList">ajax방명록</a></li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>ajax방명록</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>방명록</li>
						<li class="last">ajax방명록</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="guestbook">
				<!-- <form name= "addList" action="./boardInsert" method="get" onsubmit="return validateForm()"> -->
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
							<td><input id="input-uname" type="text" name="name" required></td>
							<th><label class="form-text" for="input-pass">패스워드</label>
							</td>
							<td><input id="input-pass" type="password" name="pwd"
								required></td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="content" id="input-content"
									cols="72" rows="5" required></textarea></td>
						</tr>
						<tr class="button-area">
							<td colspan="4"><button type="button" id="btnSubmit">등록</button></td>
						</tr>
					</tbody>

				</table>
				<!-- //guestWrite -->
				<input type="hidden" name="action" value="add">

				<!-- </form> -->


				<!-- //guestRead -->

				<div id="guestbookListArea">
					<c:forEach var="list" items="${list}">
						<table id="t-${list.boardId}" class="guestRead">
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
								<td><button type="button"
										class="btn btn-primary btn-sm btnModal"
										data-no="${list.boardId}" data-name="${list.name}"
										data-content="${list.content}" data-pwd="${list.pwd}">
										Delete</button></td>
							</tr>
							<tr>
								<td colspan=4 class="text-left">${list.content}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
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

	<!---------------------------------------- 삭제폼 모달창 ---------------------------------------------->

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Delete Modal</h4>
				</div>
				<div class="modal-body">
					<table border="1">
						<input id="modalId" type="hidden" name="boardId" value="">
						<tr>
							<td>비밀번호</td>
							<td><input id="modalPwd" type="password" value="" style="width: 98%; border: none;" placeholder="비밀번호를 입력하세요"></td>
						<tr>
							<td>작성자</td>
							<td><input id="modalName" type='text' name="name" style="width: 98%; border: none;" value="" disabled></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="modalContent" name="content" cols="68" rows="5" style="width: 98%; border: none;" disabled>
							</textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="btnDel" type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<!---------------------------------------- 삭제폼 모달창 ---------------------------------------------->

</body>

<script type="text/javascript">
	//모달창 삭제버튼
	$("#btnDel").on("click", function() {
						//데이터 모으기

						$([ "name='name'" ]).val("");
						$([ "name='content'" ]).val("");

						var pwd = $("#modalPwd").val();
						var boardId = $("#modalId").val();
						console.log("btnDel");
						console.log(boardId);
						console.log(pwd);

						var guestVO = {
							boardId : boardId,
							pwd : pwd
						};

						//통신
						$.ajax({
									url : "${pageContext.request.contextPath}/api/guestbook/boardRemove",
									type : "post",
									/* contentType : "application/json", */
									data : guestVO,

									dataType : "json",
									success : function(jsonResult) {
										console.log(jsonResult);
										if (jsonResult.result == "success") {
											if(jsonResult.data > 0){
												//모달창 닫기
												$("#myModal").modal("hide");
												$("#t-" + boardId).remove();
												Swal.fire({
													  icon: 'success',
													  title: '삭제 되었습니다.',
													  showConfirmButton: false,
													  timer: 1500
													})
											}else{
												Swal.fire({
													  icon: 'error',
													  title: '비밀번호 확인',
													  text: '비밀번호를 확인해주세요.',
													  //footer: '<a href="">Why do I have this issue?</a>'
													});
											}

										} else {
											//오류처리
										}

										/*성공시 처리해야될 코드 작성*/
									},
									error : function(XHR, status, error) {
										//$("#idCheckMsg").css("color", "blue").html(id + " 사용가능");
									}
								});

					});

	//리스트 삭제버튼
	$("#guestbookListArea").on("click", ".btnModal", function() {
		var boardId = $(this).data("no");
		var name = $(this).data("name");
		var content = $(this).data("content");
		console.log(name);
		$("#modalId").val(boardId);
		$("#modalName").val(name);
		$("#modalContent").val(content);
		//초기화
		$("#modalPwd").val("");

		//모달창 호출
		$("#myModal").modal("show");
	});

	$("#btnSubmit").on("click", function() {
						//이벤트확인
						console.log("Btn click");
						//데이터 수집
						var name = $("#input-uname").val();
						var pwd = $("#input-pass").val();
						var content = $("#input-content").val();
						var guestVO = {
							name : name,
							pwd : pwd,
							content : content
						};

						//통신
						$.ajax({
							url : "${pageContext.request.contextPath}/api/guestbook/boardInsert",
							type : "post",
							/* contentType : "application/json", */
							data : guestVO,

							dataType : "json",
							success : function(jsonResult) {
								console.log(jsonResult);
								if (jsonResult.result == "success") {
									render(jsonResult.data); //리스트 추가
									//등록폼 비우기
									$([ "name='name'" ]).val("");
									$([ "name='pwd'" ]).val("");
									$([ "name='content'" ]).val("");
								} else {
									//오류처리
								}

										/*성공시 처리해야될 코드 작성*/
								},
								error : function(XHR, status, error) {
									//$("#idCheckMsg").css("color", "blue").html(id + " 사용가능");
								}
							});

					});

	//방명록 그리기
	function render(guestbookVO) {
		var str = "";
		str += '<table id="t-'+ guestbookVO.boardId +'" class="guestRead">';
		str += "<colgroup>";
		str += '<col style="width: 10%;">';
		str += '<col style="width: 40%;">';
		str += '<col style="width: 40%;">';
		str += '<col style="width: 10%;">';
		str += "</colgroup>";
		str += "<tr>";
		str += "<td>" + guestbookVO.boardId + "</td>";
		str += "<td>" + guestbookVO.name + "</td>";
		str += "<td>" + guestbookVO.regDate + "</td>";
		str += '<td><button type="button" class="btn btn-primary btn-sm btnModal" data-no="'+guestbookVO.boardId +'" data-name="'+guestbookVO.name +'" data-content="'+guestbookVO.content +'" >[삭제]</button></td>';
		str += "</tr><tr>";
		str += '<td colspan=4 class="text-left">' + guestbookVO.content
				+ '</td>';
		str += "</tr>";
		str += "</table>";

		$("#guestbookListArea").prepend(str);
	}

	/* var name = $("#input-uname").val().trim();
	var pwd = $("#input-pass").val.trim();
	var content = $("#input-content").val.trim();
	if (name === "") {
		return false;
	}
	if (pwd === "") {
		alert("패스워드를 입력해주세요.");
		return false;
	}
	if (content === "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	return true; */
</script>

</html>