<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*, java.sql.*" %>
<jsp:useBean id="movieschedule" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<jsp:useBean id="theater" scope="page" class="com.beans.theater.theater"></jsp:useBean>
<jsp:useBean id="movie" scope="page" class = "com.beans.movie.Movie"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>티켓예매폼</title>
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

function movie_search()	{ 
	browsing_window=window.open("MovieChoice.jsp?date="+choice.date.value+"&area="+choice.area.value+"&theater1="+choice.theater1.value+"&theater2="+choice.theater2.value+"&theater3="+choice.theater3.value+"&theater4="+choice.theater4.value+"&theater5="+choice.theater5.value+"&theater6="+choice.theater6.value+"&theater7="+choice.theater7.value, "_moviechoice","height=400,width=300, menubar=no,scrollbars=yes");
	browsing_window.focus();
}

function screen_search()	{ 
	browsing_window=window.open("ScreenTimeChoice.jsp?date="+choice.date.value+"&area="+choice.area.value+"&theater1="+choice.theater1.value+"&theater2="+choice.theater2.value+"&theater3="+choice.theater3.value+"&theater4="+choice.theater4.value+"&theater5="+choice.theater5.value+"&theater6="+choice.theater6.value+"&theater7="+choice.theater7.value+"&moviename="+choice.moviename.value, "_moviechoice","height=300,width=550, menubar=no,scrollbars=yes");
	browsing_window.focus();
}

function seat_search()	{ 
	browsing_window=window.open("SeatSelect.jsp?date="+choice.date.value+"&area="+choice.area.value+"&theater1="+choice.theater1.value+"&theater2="+choice.theater2.value+"&theater3="+choice.theater3.value+"&theater4="+choice.theater4.value+"&theater5="+choice.theater5.value+"&theater6="+choice.theater6.value+"&theater7="+choice.theater7.value+"&moviename="+choice.moviename.value+"&screen="+choice.screen.value+"&starttime="+choice.starttime.value+"&people="+choice.people.value, "_moviechoice","height=300,width=550, menubar=no,scrollbars=yes");
	browsing_window.focus();
}
</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
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

String sql="";
ResultSet rs=null;
String area="";

String date[] = new String[7];

int i = 0;

for(i=0; i<7; i++){
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"/";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"/";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)+i);
	date[i] = indate;
}

theater.setTheatername(theatername);
if(id!=null){
%>
<form id="choice" name="choice" method="post" action="SeatSelect.jsp">
	<table>
		<tr>
		
		</tr>
		<tr>
			<td>
				날짜
			</td>
			<td>
				<select id = "date" name = "date" class="timetable">
					<option value = "" selected = "selected">-------------</option>
					<option value = "<%=date[0] %>"><%=date[0] %></option>
					<option value = "<%=date[1] %>"><%=date[1] %></option>
					<option value = "<%=date[2] %>"><%=date[2] %></option>
					<option value = "<%=date[3] %>"><%=date[3] %></option>
					<option value = "<%=date[4] %>"><%=date[4] %></option>
					<option value = "<%=date[5] %>"><%=date[5] %></option>
					<option value = "<%=date[6] %>"><%=date[6] %></option>			
				</select>
			</td>
		</tr>
		<tr>
			<td>
				지역
			</td>
			<td><%
			rs = movieschedule.Area();
			%>
				<select id = "area" name = "area" onchange = op(this) class ="timetable">
					<option value = "" selected = "selected">------</option>
					<%while(rs.next()){ %>
						<option value = "<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
					<%}
					rs.close();
					movie.close();%>
				</select>
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
					theater.close();%>
				</select>  	
			</td>
		</tr>
		<tr>
			<td>영화선택</td>
			<td>
				<input id = "moviename" name = "moviename"  type = "text" readonly/>
				<input id = "moviebutton" type = "button" value = "영화 검색" OnClick = "movie_search()" readonly/>
			</td>
		</tr>
		<tr>
			<td>상영관선택</td>
			<td>
				<input id = "screen" name = "screen"  type = "text" readonly/>
			</td>
		</tr>
		<tr>
			<td>상영회차</td>
			<td>
				<input id = "playround" name = "playround"  type = "text" readonly/>
			</td>
		</tr>
		<tr>
			<td>시간선택</td>
			<td>
				<input id = "starttime" name = "starttime"  type = "text" readonly/>
				<input id = "starttimebutton" type = "button" value = "상영관&시간선택" OnClick = "screen_search()" readonly/>
			</td>
		</tr>
		<tr>
			<td>인원수선택</td>
			<td>
				<select id = "people" name = "people" class="timetable">
					<option value = "" selected = "selected">-------------</option>
					<option value = "1">1명</option>
					<option value = "2">2명</option>
					<option value = "3">3명</option>	
					<option value = "4">4명</option>					
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input id = "submit" name = "submit" type = "submit" value="조회"/>
			</td>
		</tr>
	</table>
</form>
<%}else{
%>
<table>
	<tr>
		<td>
			로그인 후 이용해 주세요
		</td>
	</tr>
	<tr>
		<td>
			<a href="../login/Login.jsp">[로그인]</a>
			<a href="../main/main.jsp">[메인페이지로]</a>
		</td>
	</tr>
</table>
<%
}%>

</body>
</html>