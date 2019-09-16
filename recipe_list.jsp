<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String ingredient[] = request.getParameterValues("ingredient");
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	int ingred_size=0;
	if(ingredient!=null)
		ingred_size=ingredient.length;
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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//<![CDATA[
var basefood = new Array();
var base_url = "https://haemukja.com/recipes?utf8=%E2%9C%93&sort=rlv";
<%for(int i=0;i<ingred_size;i++){%>
basefood[<%=i%>]='<%=ingredient[i]%>';
base_url+="&basefoods%5B%5D="+basefood[<%=i%>];
<%}%>
console.log(basefood[0]);
$(function(){
		$("#loginBtn").on("click",function(){
			window.location.href="login.jsp";
		});
		$("#logoutBtn").on("click",function(){
			window.location.href="logout.jsp";
		});
	$.ajax({
		url:base_url,
		dataType:"html",
		success: function(data){
			var $dish=$(data).find(".lst_recipe > li");
			if($dish.length>0){
				if(<%=ingred_size%>==0){
					$(".wrap").append("<h1>해당하는 레시피가 없습니다.</h1><h1>아래와 같은 요리는 어떠세요?</h1>");
				}
				else{
					$(".wrap").append("<h1>원하시는 요리를 선택해주세요</h1>");
				}
				var rcps_tb=$("<table id='search' style='border-spacing:20px 10px'>");
				var row_pic=$("<tr />");
				var row_title=$("<tr align='center' />");
				$.each($dish,function(i,o){
					var $pic=$(o).html();
					row_pic.append($("<td />").html($($pic).filter("a")));
					var $title=$(o).find("p");
					var title_str=$($title).find("strong").text();
					$title=$($title).html();
					row_title.append($("<td style='width:250px;height:40px;background-color:#edb202;'/>").html($($title).text(title_str)));
					if(i%3==2){
						rcps_tb.append(row_pic);
						rcps_tb.append(row_title);
						row_pic = $("<tr />");
						row_title = $("<tr align='center'/>");
					}
				});
				$(".wrap").append(rcps_tb);
				var $search_select=$("#search a");
				$.each($search_select,function(i,o){
					var href_str=$(o).attr("href");
					var url_str="recipes.jsp?url_str="+href_str;
					$(o).attr("href",url_str);
					$(o).attr("target","_blank");
					$(o).css("text-decoration","none");
					$(o).css("color","black");
					$(o).css("font-size","20px");
				});
			}else{
				$(".wrap").append("<h2>해당하는 레시피가 없습니다.</h2><h2>아래와 같은 메뉴는 어떠세요?</h2>");
			}
		}
	});
});
//]]>
</script>
<style>
	<link rel="stylesheet" type="text/css" href="a.css"/>
</style>
</head>
<body style="font-family:'Do Hyeon', sans-serif;">
<div style="width:630px;height:40px;float:left"><img src="prev_btn.png" onclick="location.href='searchbar.jsp'"></img></div>
<div style="width:200px;height:40px;float:left">
<%if(id!=null){%>
		<font color = "blue"><%=nick%></font>님! 환영합니다.
		<button id="logoutBtn" style="float:right">로그아웃</button><p>
	<%}
	else{%>
		<button id="loginBtn" style="float:right">로그인</button><p>
	<%}%>
</div>
<div class="wrap" style="width:830px;"></div>

</body>
</html>