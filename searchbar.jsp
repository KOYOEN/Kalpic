<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
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
	$(function(){
		$("#loginBtn").on("click",function(){
			window.location.href="login.jsp";
		});
		$("#logoutBtn").on("click",function(){
			window.location.href="logout.jsp";
		});
		$.ajax({
			url:"http://haemukja.com/main",
			dataType:"html",
			success: function(data){
				var $main_rcps=$(data).find(".lst_recipe.cool_recipes > li");
				if($main_rcps.length>0){
					var rcps_tb=$("<table id='rcmd_rcps' style='float:left;width:2000px;margin-left:-4.25px'/>");
					var row_pic=$("<tr id='rcmd_pic' style='margin-top=10px'/>");
					var row_title=$("<tr id='rcmd_title'/>");
					$.each($main_rcps,function(i,o){
						var $pic=$(o).html();
						row_pic.append($("<td />").html($($pic).filter("a")));
						var $title=$(o).find("p");
						var title_str=$($title).find("strong").text();
						$title=$($title).html();
						row_title.append($("<td style='text-align:center'/>").html($($title).text(title_str)));
					});
					rcps_tb.append(row_pic).append(row_title);
					$("#main_rcps").append("<button id='prev' style='float:left;width:24px;height:252px'>◀</button>");
					$("#main_rcps").append($("<div id='display_rcps' style='float:left;width:250px;height:300px;overflow:hidden;'/>").append(rcps_tb));
					$("#main_rcps ").append("<button id='next' style='float:left;width:24px;height:252px'>▶</button>");
					var $search_select=$("#rcmd_rcps a");
					$.each($search_select,function(i,o){
						var href_str=$(o).attr("href");
						var url_str="recipes.jsp?url_str="+href_str;
						$(o).attr("href",url_str);
						$(o).attr("target","_blank");
						$(o).css("text-decoration","none");
						$(o).css("color","black");
						$(o).css("font-size","20px");
					});
					var list=$("#rcmd_rcps");
					var num=0;//이전, 다음 버튼 클릭할 때 증감되는 값
					var total=7;
					var li_width=254;
					var copyObj_pic=$("#rcps_pic >tr:lt(1)",$("#rcps_pic >tr")).clone();
					var copyObj_title=$("#rcps_title >tr:lt(1)",$("#rcps_title >tr")).clone();
					$("#next").on("click",function(){
						if(num==total){
							num=0;
							list.css("margin-left",num);
						}
						else
							num++;
						list.stop().animate({marginLeft:-li_width*num+"px"},500);
						return false;
					});
					$("#prev").on("click",function(){
						if(num==0){
							list.css("margin-left",-num*li_width+"px");
							num=total;
						}
						else
							num--;
						list.stop().animate({marginLeft:-li_width*num+"px"},500);
						return false;

					});
					$("login").css("font-family","'Do Hyeon', sans-serif;");
				}
				else{
					window.alert("죄송합니다. 추천 메뉴를 받아오는데 오류가 발생하였습니다.");
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
<body style="font-family:'Do Hyeon', sans-serif;font-size:20px;">
<div style="width:400px;float:left;">
<form method = "post" action = "recipe_list.jsp">
<h1>음식 재료를 선택해주세요!</h1>
<p>- 육류<br>
<input type="checkbox" name="ingredient" value="2488"/>돼지고기
<input type="checkbox" name="ingredient" value="2448"/>소고기
<input type="checkbox" name="ingredient" value="2529"/>닭고기
<input type="checkbox" name="imgredient" value="2612"/>양고기
</p>
<p>- 채소류<br>
<input type="checkbox" name="ingredient" value="4398"/>채소
<input type="checkbox" name="ingredient" value="4400"/>버섯
</p>
<p>- 해산물<br>
<input type="checkbox" name="ingredient" value="2848"/>고등어
<input type="checkbox" name="ingredient" value="3425"/>새우
</p>
<p>- 콩류<br>
<input type="checkbox" name="ingredient" value="1163"/>두부
</p>
<p>- 면<br>
<input type="checkbox" name="ingredient" value="243"/>면
</p>
<p>- 김치<br>
<input type="checkbox" name="ingredient" value="1968"/>김치
</p>
<p>- 유제품류<br>
<input type="checkbox" name="ingredient" value="2781"/>달걀
<input type="checkbox" name="ingredient" value="3815"/>치즈
</p>
<p><input type="submit" value="검색"/>
&nbsp;&nbsp;<input type="reset" value="취소"/>
</form>
</p>
</div>
<div style="float:left;width:300px">
	<div id="login" style="height:25px;align:right">
	<%if(id!=null){%>
		<font color = "blue"><%=nick%></font>님! 환영합니다.
		<button id="logoutBtn" style="float:right">로그아웃</button>
	<%}
	else{%>
		<button id="loginBtn" style="float:right">로그인</button>
	<%}%>
	</div>
	<div id="main_rcps" style="float:top;width:300px;margin-top:200px">
	<h3 align="center">오늘의 추천메뉴</h3>
	</div>
</div>
</body>
</html>