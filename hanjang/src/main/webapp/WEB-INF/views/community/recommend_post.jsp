<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	// 댓글 등록 버튼 클릭 시 로그인 체크
	function clickReplyInsertConfirm() {
		var id = '<%= session.getAttribute("loginVO") %>';
		
		if(id == 'null') {
			swal("로그인 안내","로그인 후 이용하실 수 있습니다.","warning");
			document.getElementById("replyTextarea").setAttribute("disabled", true);
		} else {
			if(confirm("댓글을 등록하시겠습니까?")) {
				var form = document.getElementById("replyForm");
				form.action = "recommendReplyInsert.do";
				form.method = "POST";
				form.submit();
			}
		}
	}
</script>
</head>
<body>
<div class="boardTitle">이 책 추천해요</div>
<div class="boardSubTitle">인상 깊게 읽었던 책을 공유하는 커뮤니티입니다.</div>
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:30px;"><hr class="headline"></td>
	</tr>
	<tr style="height:32px;">
		<td style="width:120px;">제목</td>
		<td colspan="4">${post.title }</td>
	</tr>
	<tr style="height:30px;">
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td style="height:30px;">작성자</td>
		<td colspan="4" style="height:30px;">${post.writerNick }</td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="5"><textarea class="postsection" rows="20" cols="100" readonly>${post.content }</textarea></td>
	</tr>
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
		<table border="1" class="replyOutputTable">
			<tr style="height:30px;">
				<td style="font-weight:bold; text-align:left; width:80%;">${reply.replyWriterNick }</td>
				<!-- 로그인 한 아이디 == 해당 댓글 작성한 아이디, 관리자 아이디만 권한주기 -->
				<c:if test="${(loginVO == reply.replyWriterId || loginVO == 'ADMIN')}" >
				<td style="text-align:right;"><input type="button" class="submitBtn" onclick="clickReplyUpdateConfirm()" value="수정" />
				<script>
				// 댓글 수정 시 확인 창
				function clickReplyUpdateConfirm() {
					var replyNo = "<c:out value='${reply.replyNo}'/>";
					var boardNo = "<c:out value='${post.boardNo}'/>";
					if(confirm("댓글을 수정하시겠습니까?")) {
						location.href = "recommendReplyDelete.do?replyNo="+replyNo+"&boardNo="+boardNo;
						swal("댓글 안내", "댓글이 삭제되었습니다.", "success");
					}
				}
				</script></td>
				<td style="text-align:right;"><input type="button" class="submitBtn" onclick="clickReplyDeleteConfirm()" value="삭제" />
				<script>
				// 댓글 삭제 시 확인 창
				function clickReplyDeleteConfirm() {
					var replyNo = "<c:out value='${reply.replyNo}'/>";
					var boardNo = "<c:out value='${post.boardNo}'/>";
					if(confirm("댓글을 삭제하시겠습니까?")) {
						location.href = "recommendReplyDelete.do?replyNo="+replyNo+"&boardNo="+boardNo;
						swal("댓글 안내", "댓글이 삭제되었습니다.", "success");
					}
				}
				</script></td></c:if>
				<td class="replyRegDate">${reply.regDate }</td>
			</tr>
			<tr>
				<td colspan="5" style="padding:10px; background-color:#f5f5f5; border:none; border-radius:4px; height:30px; text-align:left; vertical-align:middle;">${reply.replyContent }</td>
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
			<table border="1" class="replyInputTable">
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
		<td style="text-align:right;"><a href="recommendList.do" style="margin-right:20px;">목록</a>
		<!-- 해당 글을 작성한 사람과 관리자만 삭제 가능 -->
		<c:if test="${(loginVO == post.writerId || loginVO == 'ADMIN')}" >
		<input type="button" class="submitBtn" value="수정" onclick="clickUpdateConfirm()" style="margin-right:20px;"/>
		<script>
		function clickUpdateConfirm() {
			if(confirm("해당 게시물을 수정하시겠습니까?")) {
				var boardNo = "<c:out value='${post.boardNo}'/>";
				location.href = 
			}
		}
		</script>
		<input type="button" class="submitBtn" value="삭제" onclick="clickDeleteConfirm()" style="margin-right:20px;"/>
		<script>
		function clickDeleteConfirm() {
			if(confirm("해당 게시물을 삭제하시겠습니까?")) {
				var boardNo = "<c:out value='${post.boardNo}'/>";
				location.href = "recommendDelete.do?boardNo="+boardNo;
			}
		}
		</script></c:if></td>
	</tr>
</table>
</body>
</html>