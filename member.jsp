<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String age = request.getParameter("age");
	String phone = request.getParameter("phone");
	String job = request.getParameter("job");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj?serverTimezone=UTC","root","mysql");
		PreparedStatement pp = cc.prepareStatement("insert into member_ values(?,?,?,?,?,?,?,sysdate())");
		pp.setString(1,id);
		pp.setString(2,pw);
		pp.setString(3,name);
		pp.setString(4,nick);
		pp.setString(5,age);
		pp.setString(6,phone);
		pp.setString(7,job);
		pp.executeUpdate();
%>
<script>
	alert("환영합니다!! 회원님이 정상적으로 등록되었습니다!");
	location.href="login.jsp";
</script>
<%
}catch(SQLException ex){
	out.println("회원님, 죄송하지만 회원가입 도중 오류가 발생했어요;;\n(오류코드 :"+ex.getMessage()+")");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title> new document </title>
<meta name="generator" content="editplus" />
<meta name="author" content="" />
<meta name="keyword" content="" />
<meta name="description" content="" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//<![CDATA[

//]]>
</script>
</head>
<body>
 
</body>
</html>