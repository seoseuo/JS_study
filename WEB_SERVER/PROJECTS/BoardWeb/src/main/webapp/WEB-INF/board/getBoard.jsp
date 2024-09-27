<%@ page import="com.ssamz.biz.board.BoardDAO" %>
<%@ page import="com.ssamz.biz.board.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%--
	// 1. 컨트롤러(Servlet)가 모델(DAO)을 이용하여 request에 등록한 글 목록을 가져옵니다.
	BoardVO board = (BoardVO) request.getAttribute("board");
--%>


<%--
	// 1. 사용자 입력 정보 추출
	String seq = request.getParameter("seq");
	
	// 2. DB 연동 처리
	BoardVO vo = new BoardVO();
	vo.setSeq(Integer.parseInt(seq));
	
	BoardDAO boardDAO = new BoardDAO();
	BoardVO board = boardDAO.getBoard(vo);
	
	//3. 화면 이동

--%>


	<center>
		<form action="updateBoard.do" method="post">
			<input name="seq" type="hidden" value="${board.seq}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<!-- 제목 -->
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left">
						<input type="text" name="title" value="${board.title}" />
					</td>
				</tr>
				<!-- //제목 -->
				<!-- 작성자 -->
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">
						<!--  추가 구현된 부분 - No.2 -->
						<input type="text" name="writer" size="10" value="${board.writer}" readonly />
					</td>
				</tr>
				<!-- //작성자 -->
				<!-- 내용 -->
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">
						<textarea name="content" cols="40" rows="10">${board.content}</textarea>
					</td>
				</tr>
				<!-- //내용 -->
				<!-- 등록일 -->
				<tr>
					<td bgcolor="orange">등록일</td>
					<td align="left">${board.regDate}</td>
				</tr>
				<!-- //등록일 -->
				<!-- 조회수 -->
				<tr>
					<td bgcolor="orange">조회수</td>
					<td align="left">${board.cnt}</td>
				</tr>
				<!-- //조회수 -->
				<!-- 글 수정 -->
				<!--  추가 구현된 부분 - No.2 -->
				<%-- if( user!= null && user.getId().equals(board.getWriter())){ --%>
				<c:if test="${user != null && user.id == board.writer }">
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 수정" />
					</td>
				</tr>
				</c:if>
				<%-- } --%>
				<!-- //글 수정 -->
				
			</table>
		</form>
		
		<br>
		<!-- 글 삭제 -->
		<!--  추가 구현된 부분 - No.3 -->
<%-- if (user != null && user.getRole().equals("ADMIN") || user.getId().equals(board.getWriter())) {  --%>
		<c:if test="${user != null && user.role == 'ADMIN' || user.id == board.writer }">
		<a href="deleteBoard.do?seq=${board.seq}"> 글 삭제</a>
		</c:if>
<%--} --%>
		<!-- //글 삭제 -->
		
	</center>


<%@ include file="../layout/footer.jsp" %>




