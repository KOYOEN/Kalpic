<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String url_str=request.getParameter("url_str");
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
//<![CDATA[]
var rcps_url_str="https://haemukja.com"+"<%=url_str%>";
$(function(){
	$.ajax({
		url:rcps_url_str,
		dataType:"html",
		success: function(data){
			var $rcp_ingre=$(data).find(".btm").html();
			$("#ingre").append($rcp_ingre);
			var ingre_title=$("#ingre > h2").html();
			$("#ingre > h2").css("display","none");
			$(".dropdown").prepend("(");
			$(".dropdown").append(")");
			$(".dropdown").prepend($("<span style='font-size:1.5em;font-weight:bold' />").append(ingre_title));
			var $rcp_step=$(data).find(".lst_step");
			$.each($rcp_step.find("li"),function(i,o){
				$("#wrap").append($(o).html());
			});
			$.each($("#wrap img"),function(i,o){
				$(o).css("width","400px");
			});
			var currentPosition = parseInt($("#ingre").css("top"));
			$(window).scroll(function(){
				var position = $(window).scrollTop();
				$("#ingre").stop().animate({"top":position+currentPosition+"px"},800);
			});
		}
	});
});

//]]>
</script>
</head>
<body style="font-family: 'Do Hyeon', sans-serif;">
<div id="wrap" style="width:400px;float:left;">
<h1>레시피</h1>
</div>
<div id="sidebox" style="float:left;margin-left:50px;">
	<div id="ingre" style="position:absolute;width:200px;top:200px;"/>
</div>
</body>
</html>