<%@ page contentType="text/html; charset=UTF-8" %>
<%-- page contentType="text/html; charset=UTF-8" 
	errorPage="errors/boardError.jsp"
    session="false" --%>
<%@ include file="../WEB-INF/layout/footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
</head>
<body>
	
	<!-- HTML 주석입니다. -->
	<%-- JSP 주석입니다. --%>
	<center>
		<h1><font color="green"><%= request.getParameter("id").toString() %></font>님 환영합니다.</h1>
		<%-- HttpSession session = request.getSession(); --%>
		<%-- 세션 아이디 : <%= session.getId() %> --%>
	</center>
	
<%@ include file="../WEB-INF/layout/footer.jsp" %>

</body>
</html>