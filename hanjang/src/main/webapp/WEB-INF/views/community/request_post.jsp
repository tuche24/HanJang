<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<style>
.footer div{
	float:left;
}
.footer{
	margin:0 auto;
	width:1050px;
	height:300px;
}
</style>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
//댓글 등록 버튼 클릭 시 로그인 체크
function clickReplyInsertConfirm() {
	var id = '<%= session.getAttribute("loginVO") %>';
	if(id == 'null') {
		swal.fire({
			icon:'error',
			title:'댓글 등록 안내',
			text:'로그인 후 이용하실 수 있습니다.'
		});
		document.getElementById("replyTextarea").setAttribute("disabled", true);
	} else {
		swal.fire({
			icon:'warning',
			title:'댓글 등록 안내',
			text:'해당 댓글을 등록시겠습니까?',
			showCancelButton: true,
			confirmButtonText: '등록',
			cancelButtonText: '취소'
		}).then((result) => {
			if(result.isConfirmed) {
				var textarea = document.getElementById("replyTextarea");
				if(textarea.value.length == 0) {
					swal.fire({
						icon:'error',
						title:'댓글 등록 안내',
						text:'댓글 내용을 입력해주세요.'
					});
				} else {
				var form = document.getElementById("replyForm");
					form.action = "requestReplyInsert.do";
					form.method = "POST";
					form.submit();	
				}
			}
		})
	}
}
</script>
</head>
<body>
<!-- header부분 -->
<%@ include file="/resources/jsp/header/header.jsp" %>
<div class="boardTitle">없는 책 요청해요</div>
<div class="boardSubTitle">한장두장에 없는 도서를 입고요청하는 게시판입니다.</div>
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:20px;"><hr class="headline"></td>
	</tr>
	<tr style="height:35px;">
		<td style="width:120px;">제목</td>
		<td colspan="4">${post.title }</td>
	</tr>
	<tr style="height:20px;">
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td style="height:35px;">작성자</td>
		<td colspan="4" style="height:30px;">${post.writerNick }</td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr style="height:20px;"/>
	<tr>
		<td colspan="5">
		<div class="postSection">
		<table border="1" style="width:100%;">	<!-- 글 내용 출력 부분 -->
			<!-- 첨부 이미지 파일 출력 부분 -->
			<!-- 이미지 첨부 했을 시에만 보여지고, 첨부 안했을 시에 뜨는 엑박 없애기 -->
			<c:set var="str" value="${post.imgFile}"/>
			<c:set var="length" value="${fn:length(str)}" />
			<c:if test="${fn:substring(str, length-8, length) != 'none.png'}">
			<tr>
				<td class="imgSection"><img src="${post.imgFile }" class="postSection_img"></td>
			</tr></c:if>
			<tr>	<!-- 글 내용 부분 -->
				<td><textarea class="postSection_txt" readonly>${post.content }</textarea></td>
			</tr>
		</table>
		</div>
		</td>
	</tr>
	<tr style="height:40px;"/>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<!-- 댓글 시작 부분 -->
	<tr>
		<td style="height:30px;">댓글
		<!-- 댓글 개수 표시 부분 -->
		 (<div style="display:inline-block; color:red;">${post.reCnt }</div>)</td>
	</tr>
	<!-- 댓글 목록 부분 -->
	<c:if test="${!empty reply }">
	<c:forEach var="reply" items="${reply }">
	<tr>
		<td colspan="5">
		<table class="replyOutputTable">
			<tr style="height:30px;">
				<td style="font-weight:bold; text-align:left;">${reply.replyWriterNick }</td>
				<!-- 로그인 한 아이디 == 해당 댓글 작성한 아이디, 관리자 아이디만 삭제 권한주기 -->
				<c:if test="${(loginVO == reply.replyWriterId || loginVO == 'ADMIN')}" >
				<td style="text-align:right;"><input type="button" class="submitBtn" onclick="clickReplyDeleteConfirm()" value="삭제" />
				<script>
				// 댓글 삭제 시 확인 창
				function clickReplyDeleteConfirm() {
					swal.fire({
						icon:'warning',
						title:'댓글 삭제 안내',
						text:'해당 댓글을 삭제하시겠습니까?',
						showCancelButton: true,
						confirmButtonColor: '#d90000',
						confirmButtonText: '삭제',
						cancelButtonText: '취소'
					}).then((result) => {
						if(result.isConfirmed) {
							var replyNo = "<c:out value='${reply.replyNo}'/>";
							var boardNo = "<c:out value='${post.boardNo}'/>";
							location.href = "requestReplyDelete.do?replyNo="+replyNo+"&boardNo="+boardNo;
							swal.fire({
								icon:'success',
								title:'댓글 삭제 안내',
								text:'댓글이 삭제되었습니다.'
							})
						}
					})
				}
				</script></td></c:if>
				<td style="width:90px" class="replyRegDate">${reply.regDate }</td>
			</tr>
			<tr>
				<td colspan="4" style="padding:10px; background-color:#f5f5f5; border:none; border-radius:4px; height:30px; text-align:left; vertical-align:middle;">${reply.replyContent }</td>
			</tr>
		</table>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	<!-- 댓글 목록 부분 끝 -->
	<!-- 댓글 작성 부분 -->
	<tr>
		<td colspan="5">
		<form id="replyForm">
			<table class="replyInputTable">
				<tr>
					<td class="replysection"><textarea id="replyTextarea" class="replytextarea" name="replyContent" placeholder="댓글을 작성해주세요." required></textarea>
					<!-- 로그인한 아이디 sessionScope 들어갈 hidden -->
					<input type="hidden" name="replyWriterId" value="<%= session.getAttribute("loginVO") %>" />
					<input type="hidden" name="replyWriterNick" value="<%= session.getAttribute("loginNick") %>" />
					<input type="hidden" name="boardNo" value="${post.boardNo }" />
					<input type="button" class="replySubmitBtn" value="댓글등록" onclick="clickReplyInsertConfirm()" /></td>
				</tr>
			</table>
		</form>
		</td>
	</tr>
	<!-- 댓글 작성 부분 끝 -->
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="4"></td>
		<td style="text-align:right;"><a href="requestList.do" style="margin-right:20px;">목록</a>
		<!-- 해당 글을 작성한 사람과 관리자만 삭제 가능 -->
		<c:if test="${(loginVO == post.writerId || loginVO == 'ADMIN')}" >
		<input type="button" class="submitBtn" value="수정" onclick="clickUpdateConfirm()" style="margin-right:20px;"/>
		<script>
		// 게시물 수정 확인창
		function clickUpdateConfirm() {
			swal.fire({
				icon:'warning',
				title:'게시글 수정 안내',
				text:'해당 게시물을 수정하시겠습니까?',
				showCancelButton: true,
				confirmButtonText: '수정',
				cancelButtonText: '취소'
			}).then((result) => {
				if(result.isConfirmed) {
					var boardNo = "<c:out value='${post.boardNo}'/>";
					location.href = "requestUpdateForm.do?boardNo="+boardNo;
				}
			})
		}
		</script>
		<input type="button" class="submitBtn" value="삭제" onclick="clickDeleteConfirm()" style="margin-right:20px;"/>
		<script>
		// 게시물 삭제 확인창
		function clickDeleteConfirm() {
			swal.fire({
				icon:'warning',
				title:'게시글 삭제 안내',
				text:'해당 게시물을 삭제하시겠습니까?',
				showCancelButton: true,
				confirmButtonColor: '#d90000',
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
			}).then((result) => {
				if(result.isConfirmed) {
					var boardNo = "<c:out value='${post.boardNo}'/>";
					location.href = "requestDelete.do?boardNo="+boardNo;
				}
			})
		}
		</script></c:if></td>
	</tr>
</table>
<!-- footer부분 -->
<%@ include file="/resources/jsp/footer/footer.jsp" %> 
</body>
</html>