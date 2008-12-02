<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@include file="../base/Top.jsp" %>
<jsp:useBean id="movie" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<jsp:useBean id="theater" scope="page" class="com.beans.theater.theater"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화관 정보</title>
<script language = "JavaScript">
function op(f){
	if(f.value != "서울"){
		document.all.theater1.style.display="none";
		document.all.theater1.value="";
	}
	if(f.value == "서울"){
		document.all.theater1.style.display="block";
	}
	
	if(f.value != "경기도"){
		document.all.theater2.style.display="none";
		document.all.theater2.value="";
	}
	
	if(f.value == "경기도"){
		document.all.theater2.style.display="block";
	}
		
	if(f.value != "충청도"){
		document.all.theater3.style.display="none";
		document.all.theater3.value="";
	}
	
	if(f.value == "충청도"){
		document.all.theater3.style.display="block";
	}
	
	if(f.value != "전라도"){
		document.all.theater4.style.display="none";
		document.all.theater4.value="";
	}
	
	if(f.value == "전라도"){
		document.all.theater4.style.display="block";
	}
	
	if(f.value != "경상도"){
		document.all.theater5.style.display="none";
		document.all.theater5.value="";
	}
	
	if(f.value == "경상도"){
		document.all.theater5.style.display="block";
	}
	
	if(f.value != "강원도"){
		document.all.theater6.style.display="none";
		document.all.theater6.value="";
	}
	
	if(f.value == "강원도"){
		document.all.theater6.style.display="block";
	}
	
	if(f.value != "제주도"){
		document.all.theater7.style.display="none";
		document.all.theater7.value="";
	}
	
	if(f.value == "제주도"){
		document.all.theater7.style.display="block";
	}
}
</script>
</head>
<body>
<%
ResultSet rs=null;
String area="";
request.setCharacterEncoding("euc-kr");
String theatername="";
String theatername1="";
String theatername2="";
String theatername3="";
String theatername4="";
String theatername5="";
String theatername6="";
String theatername7="";

theatername1=request.getParameter("theater1");
theatername2=request.getParameter("theater2");
theatername3=request.getParameter("theater3");
theatername4=request.getParameter("theater4");
theatername5=request.getParameter("theater5");
theatername6=request.getParameter("theater6");
theatername7=request.getParameter("theater7");

if(theatername1!=""){
	theatername = theatername1;
}
else if(theatername2!=""){
	theatername = theatername2;
}
else if(theatername3!=""){
	theatername = theatername3;
}
else if(theatername4!=""){
	theatername = theatername4;
}
else if(theatername5!=""){
	theatername = theatername5;
}
else if(theatername6!=""){
	theatername = theatername6;
}
else if(theatername7!=""){
	theatername = theatername7;
}
out.print(theatername);
theater.setTheatername(theatername);
%>
<form id="search" name="search" method="post" action="TheaterInfo.jsp">
<table>
	<tr>
		<td><%
		rs = movie.Area();
		%>
			<select id = "area" name = "area" onchange = op(this) class ="timetable">
				<option value = "" selected = "selected">------</option>
				<%while(rs.next()){ %>
					<option value = "<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
				<%}
				rs.close();
				movie.close();%>
			</select>
		</td>
		<td>
			<select id = "theater1" name = "theater1" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="서울";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater2" name = "theater2" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="경기도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater3" name = "theater3" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="충청도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater4" name = "theater4" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="전라도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater5" name = "theater5" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="경상도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater6" name = "theater6" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="강원도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();%>
			</select>  	
		</td>
		<td>
			<select id = "theater7" name = "theater7" class = "timetable" style="display:none"/>
				<option value = "" selected = "selected">-------------</option>
				<%
				area="제주도";
				rs = theater.Theatername(area);
				while(rs.next()){
				%>
				<option value = "<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%}
				rs.close();
				theater.close();
				%>
			</select>  	
		</td>
		<td>
			<input id = "submit" name = "submit" type = "submit" value="조회"/>
		</td>
	</tr>
</table>
</form>
<%if(theatername!=null){
	if(theater.TheaterInfo()==true){%>
<table>
	<tr>
		<td>	
			영화관 명
		</td>
		<td>
			<%=theater.getTheatername() %>
		</td>
	</tr>
	<tr>
		<td>
			ARS문의
		</td>
		<td>
			<%=theater.getTheaterphone() %>
		</td>
	</tr>
	<tr>
		<td>
			주소	
		</td>
		<td>
			<%=theater.getTheateraddr() %>
		</td>
	</tr>
	<tr>
		<td>
			오픈일
		</td>
		<td>
			<%=theater.getTheateropendate() %>
		</td>
	</tr>
	<tr>
		<td>
			약도
		</td>
		<td>
			<img name="poster" height="300" width="600" src="<%=theater.getTheaterimage()%>">
		</td>
	</tr>
</table>
<%}
}%>

</body>
<%@include file="../base/Floor.jsp" %>
</html>