<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>    
<jsp:useBean id="util" scope="page" class="com.beans.etc.Utility"></jsp:useBean>
<jsp:useBean id="movieschedule" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<jsp:useBean id="theater" scope="page" class="com.beans.theater.theater"></jsp:useBean>
<jsp:useBean id="movie" scope="page" class = "com.beans.movie.Movie"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화선택</title>
<script language="JavaScript">
function sel(val){
	if(val==""){
		alert("영화를 선택해주세요");
		document.selectmovie.movietitle.focus();
		return false;
	}
	opener.document.choice.moviename.value=val;
	window.close();
}

</script>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

ResultSet rs;
String playdate = request.getParameter("date");
String area = util.getHan(request.getParameter("area"));
String theatername="";
String theater1 = util.getHan(request.getParameter("theater1"));
String theater2 = util.getHan(request.getParameter("theater2"));
String theater3 = util.getHan(request.getParameter("theater3"));
String theater4 = util.getHan(request.getParameter("theater4"));
String theater5 = util.getHan(request.getParameter("theater5"));
String theater6 = util.getHan(request.getParameter("theater6"));
String theater7 = util.getHan(request.getParameter("theater7"));
theatername = theater1+theater2+theater3+theater4+theater5+theater6+theater7;

%>
<form id="selectmovie" name="selectmovie" method="post">
<table>
	<tr>
		<td>
			<input type="text" name="playday" value="<%=playdate %>">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="area" value="<%=area %>">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="theatername" value="<%=theatername %>">
		</td>
	</tr>
	<tr>
		<td>
			<select id = "movietitle" name = "movietitle"  class ="timetable">
				<option value = "" selected = "selected">------</option>
			
	
			<%rs = movie.Movietitle(theatername,playdate);
			while(rs.next()){
			%>
			<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
									
			<%
			}
			if(rs!=null)rs.close();
			movie.close();
			%>
			</select>
		</td>
	</tr>
	<tr>
		<td>	
	 		<input id = "submit" name = "submit" type = "submit" value="등록" onclick="sel(document.selectmovie.movietitle.value);"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>