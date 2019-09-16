<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/proj?serverTimezone=UTC","root","mysql");
		PreparedStatement pp = cc.prepareStatement("select* from member_ where id = ? and pw = ?");
		pp.setString(1,id);
		pp.setString(2,pw);
		ResultSet rr = pp.executeQuery();
		if(rr.next()){
			session.setAttribute("id",id);
			session.setAttribute("nick",rr.getString("nick"));
			session.setMaxInactiveInterval(60*5);
			response.sendRedirect("searchbar.jsp");
		}
		else{
%>
<script>
	alert("미등록 아이디입니다~ 고객센터를 통해 문의해주세요");
	location.href="login.jsp";
</script>
<%
		}
	}catch(SQLException ex){
		out.println("로그인도중 에러가 발생했습니다!\n(에러내용 : "+ex.getMessage()+")");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
hello~
</body>
</html>