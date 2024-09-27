<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

	<center>
		<form action="insertBoard.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0">
				<!-- 제목 -->
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left">
						<input type="text" name="title"/>
					</td>
				</tr>
				<!-- //제목 -->
				<!-- 작성자 -->
				<tr>
					<td bgcolor="orange">작성자</td>
					<td align="left">
					    <!--  추가 구현된 부분 - No.1 -->
						<input type="text" name="writer" size="10" readonly value="${user.id}" />
					</td>
				</tr>
				<!-- //작성자 -->
				<!-- 내용 -->
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left">
						<textarea name="content" cols="40" rows="10"></textarea>
					</td>
				</tr>
				<!-- //내용 -->
				<!-- 새글 등록 -->
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="새글등록"/>
					</td>
				</tr>
				<!-- //새글 등록 -->
			</table>
		</form>
		
	</center>

<%@ include file="../layout/footer.jsp" %>
