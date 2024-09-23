<%@ page import="java.util.List" %>
<%@ page import="com.ssamz.biz.board.BoardDAO" %>
<%@ page import="com.ssamz.biz.board.BoardVO" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>
	
<%
	// 1. DB 연동 처리
	BoardVO vo = new BoardVO();
	vo.setSearchCondition("TITLE");
	vo.setSearchKeyword("");
	
	BoardDAO dao = new BoardDAO();
	List<BoardVO> boardList = dao.getBoardList(vo);
	
	// 2. 화면 이동

%>	

	<center>
	
		<h1>
			<font color="green">게스트</font>님 환영합니다.
		</h1>
	
		<!-- 검색 시작 -->
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
					<option value="TITLE">제목
					<option value="CONTENT">내용
					</select>
					<input name="searchKeyword" type="text"/>
					<input type="submit" value="검색"/>
				</td>
			</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
		
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
	
			<% for(BoardVO board : boardList) { %>
			<tr>
				<td><%= board.getSeq() %></td>
				<td align="left"><a href="getBoard.jsp"><%= board.getTitle() %></a></td>
				<td><%= board.getWriter() %></td>
				<td><%= board.getRegDate() %></td>
				<td><%= board.getCnt() %></td>
			</tr>
			<% } %>
			
		</table>
		
	</center>
		
	<%--
	for (BoardVO board : boardList){
		out.print(board.getSeq() + " : " + board.getTitle() + " : "  +
				board.getContent() + "<br>");
	}
	--%>
	
<%@ include file="../layout/footer.jsp" %>





