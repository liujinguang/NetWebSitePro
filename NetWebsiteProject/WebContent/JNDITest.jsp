<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JNDI Tester</title>
</head>
<body>
	<%
		Context context = new InitialContext();
		Context envContext = (Context) context.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/ConnectionPool");
		Connection conn = ds.getConnection();
	%>
</body>
</html>