<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.beans.etc.Utility" %>
<jsp:useBean id="movieinfo" scope="page" class="com.beans.movie.Movie"></jsp:useBean>
<jsp:setProperty property="*" name="movieinfo"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화상세정보</title>
</head>
<body>
<%
Utility util = new Utility();
movieinfo.MovieInfo();
movieinfo.MovieDirector();
movieinfo.MovieActor();
movieinfo.MovieGenre();
%>
<table>
<tr>
	<th><%=movieinfo.getMovietitle()%></th>
</tr>
<tr>
	<td>
		<img name="poster" height="100" width="150" src="<%=movieinfo.getMovieposter()%>">
	</td>
	<td>
	<table>
		<tr>
			<td>
				감독
			</td>
			<td>
				<%=movieinfo.getDirector() %>
			</td>
		</tr>
		<tr>
			<td>
				주연
			</td>
			<td>
				<%=movieinfo.getActor()%>
			</td>
		</tr>
		<tr>
			<td>
				등급 
			</td>
			<td>
				<%=movieinfo.getGrade() %>
			</td>
		</tr>
		<tr>
			<td>
				상영시간
			</td>
			<td>
				<%=movieinfo.getRuntime() %>
			</td>
		</tr>
		<tr>
			<td>
				장르
			</td>
			<td>
				<%=movieinfo.getGenre()%>
			</td>
		</tr>
		<tr>
			<td>
				개봉일
			</td>
			<td>
				<%=movieinfo.getOpeningdate() %>
			</td>
		</tr>
		<tr>
			<td>
				영화사
			</td>
			<td>
				<%=movieinfo.getMoviecompany() %>
			</td>
		</tr>
		<tr>
			<td>
				영화상태
			</td>
			<td>
				<%=movieinfo.getMoviestate() %>
			</td>
		</tr>
		<tr>
			<td>
				줄거리
			</td>
			<td>
				<%=movieinfo.getStory() %>
			</td>
		</tr>
	</table>
	</td>
</tr>
</table>
</body>
</html>