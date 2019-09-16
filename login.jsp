<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj?serverTimezone=UTC","root","mysql");
}catch(SQLException ex){
	out.println("SQL Error!"+ex.getMessage());
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
</head>
<body style="font-family:'Do Hyeon', sans-serif;">
<div align="center">
	<h1>칼픽!</h1><p>
	<form method="post" action="check_id.jsp">
	&nbsp;&nbsp;ID:<input type="text" name="id"/><br>
	PW:<input type="password" name="pw"/><p>
	<input type="submit" value="Login"/>
	</form>
	&nbsp;&nbsp; <button onclick="location.href='member.html'">회원가입</button>
</div>
</body>
</html>