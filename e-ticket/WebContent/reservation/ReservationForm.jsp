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
<title>Ƽ�Ͽ�����</title>
<script language = "JavaScript">
function op(f){
	if(f.value != "����"){
		document.all.theater1.style.display="none";
		document.all.theater1.value="";
	}
	if(f.value == "����"){
		document.all.theater1.style.display="block";
	}
	
	if(f.value != "��⵵"){
		document.all.theater2.style.display="none";
		document.all.theater2.value="";
	}
	
	if(f.value == "��⵵"){
		document.all.theater2.style.display="block";
	}
		
	if(f.value != "��û��"){
		document.all.theater3.style.display="none";
		document.all.theater3.value="";
	}
	
	if(f.value == "��û��"){
		document.all.theater3.style.display="block";
	}
	
	if(f.value != "����"){
		document.all.theater4.style.display="none";
		document.all.theater4.value="";
	}
	
	if(f.value == "����"){
		document.all.theater4.style.display="block";
	}
	
	if(f.value != "���"){
		document.all.theater5.style.display="none";
		document.all.theater5.value="";
	}
	
	if(f.value == "���"){
		document.all.theater5.style.display="block";
	}
	
	if(f.value != "������"){
		document.all.theater6.style.display="none";
		document.all.theater6.value="";
	}
	
	if(f.value == "������"){
		document.all.theater6.style.display="block";
	}
	
	if(f.value != "���ֵ�"){
		document.all.theater7.style.display="none";
		document.all.theater7.value="";
	}
	
	if(f.value == "���ֵ�"){
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
				��¥
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
				����
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
					area="����";
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
					area="��⵵";
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
					area="��û��";
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
					area="����";
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
					area="���";
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
					area="������";
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
					area="���ֵ�";
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
			<td>��ȭ����</td>
			<td>
				<input id = "moviename" name = "moviename"  type = "text" readonly/>
				<input id = "moviebutton" type = "button" value = "��ȭ �˻�" OnClick = "movie_search()" readonly/>
			</td>
		</tr>
		<tr>
			<td>�󿵰�����</td>
			<td>
				<input id = "screen" name = "screen"  type = "text" readonly/>
			</td>
		</tr>
		<tr>
			<td>��ȸ��</td>
			<td>
				<input id = "playround" name = "playround"  type = "text" readonly/>
			</td>
		</tr>
		<tr>
			<td>�ð�����</td>
			<td>
				<input id = "starttime" name = "starttime"  type = "text" readonly/>
				<input id = "starttimebutton" type = "button" value = "�󿵰�&�ð�����" OnClick = "screen_search()" readonly/>
			</td>
		</tr>
		<tr>
			<td>�ο�������</td>
			<td>
				<select id = "people" name = "people" class="timetable">
					<option value = "" selected = "selected">-------------</option>
					<option value = "1">1��</option>
					<option value = "2">2��</option>
					<option value = "3">3��</option>	
					<option value = "4">4��</option>					
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input id = "submit" name = "submit" type = "submit" value="��ȸ"/>
			</td>
		</tr>
	</table>
</form>
<%}else{
%>
<table>
	<tr>
		<td>
			�α��� �� �̿��� �ּ���
		</td>
	</tr>
	<tr>
		<td>
			<a href="../login/Login.jsp">[�α���]</a>
			<a href="../main/main.jsp">[������������]</a>
		</td>
	</tr>
</table>
<%
}%>

</body>
</html>