<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery List</title>

<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/gallery.css" rel="stylesheet" type="text/css">
<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<!-- 부트스트랩js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
	<div id="wrap">
		<!-- nav -->
		<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
		<!-- //nav -->
		<c:import url="/WEB-INF/views/main/galleryAside.jsp"></c:import>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>갤러리</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>갤러리</li>
						<li class="last">갤러리</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->


			<div id="gallery">
				<div id="list">
					<button type="button" id="btnImgUpload" class="btn btn-default" data-dismiss="modal">이미지올리기</button>
					<div class="clear"></div>
					<ul id="viewArea">
						<!-- 이미지반복영역 -->
						<c:forEach var="list" items="${list}">
						<li>
							<div class="view">
								<img class="imgItem" src="${pageContext.request.contextPath }/upload/${list.saveName}" data-no="${list.fileNo}">
								<div class="imgWriter" align="center">
									작성자: <strong>${list.userName}</strong>
								</div>
							</div>
						</li>
						</c:forEach>
						<!-- 이미지반복영역 -->
					</ul>
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


	<!-- 이미지등록 팝업(모달)창 -->
	<div class="modal fade" id="addModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이미지등록</h4>
				</div>

				<form method="post" action="${pageContext.request.contextPath}/gallery/upload" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group">
							<label class="form-text">글작성</label> <input id="addModalContent" type="text" name="content" value="">
						</div>
						<div class="form-group">
							<label class="form-text">이미지선택</label> <input id="file" type="file" name="file" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" id="btnUpload">등록</button>
					</div>
				</form>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 이미지보기 팝업(모달)창 -->
	<div class="modal fade" id="viewModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이미지 상세보기</h4>
				</div>
				<div class="modal-body">

					<div class="formgroup">
						<img id="viewModelImg" style="width: 400px;" src="">
						<!-- ajax로 처리 : 이미지출력 위치-->
					</div>

					<div class="formgroup">
						<p id="viewModelContent">CONTENT</p>
					</div>

				</div>
				<form method="" action="">
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger" id="btnDel">삭제</button>
					</div>

				</form>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>

<script type="text/javascript">
	
	$(document).ready(function() {
		
	});

	$("#btnImgUpload").on("click", function() {
		$("#addModal").modal("show");
	});
	
	$("#btnUpload").on("click", function() {
		console.log("Btn click");
		var content = $("#addModalContent").val();
		var file = $("#file").val();
		console.log(content);
		console.log(file);
	});
	
	$(".imgItem").on("click", function() {
		//이벤트확인
		//데이터 수집
		var no = $(this).data("no");
		
		//통신
		$.ajax({
			//호출	
			url : "${pageContext.request.contextPath}/gallery/getGallery",
			type : "post",
			//contentType : "application/json",
			//data : str,//JSON.stringify(guestVO),
			data : {no : no},
			//리턴받는 형식			
			dataType : "json",
			success : function(jsonResult) {
				console.log(jsonResult);
				if (jsonResult.result == "success") {
					var imgSrc = "${pageContext.request.contextPath}/upload/" + jsonResult.data.saveName
					$("#viewModelImg").attr("src", imgSrc);
					$("#viewModelContent").text(jsonResult.data.content);
				} else {
					//오류처리
				}
						/*성공시 처리해야될 코드 작성*/
				},
				error : function(XHR, status, error) {
					//$("#idCheckMsg").css("color", "blue").html(id + " 사용가능");
				}
			});
		$("#viewModal").modal("show");
	});
	
	
</script>




</html>

