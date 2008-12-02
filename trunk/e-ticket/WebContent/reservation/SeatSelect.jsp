<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="util" scope="page" class="com.beans.etc.Utility"></jsp:useBean>
<jsp:useBean id="movieschedule" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<jsp:useBean id="theater" scope="page" class="com.beans.theater.theater"></jsp:useBean>
<jsp:useBean id="movie" scope="page" class = "com.beans.movie.Movie"></jsp:useBean>
<jsp:useBean id="seat" scope="page" class="com.beans.reservation.Ticket"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석선택</title>
<script language="JavaScript">
</script>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
ResultSet rs;
int row=0;
int col=0;
int totalticket;
int minticket=0;
int maxticket=0;
int checkboxvalue=0;
String reserveseat="";
String playround=request.getParameter("playround");
String people=request.getParameter("people");
String playdate = request.getParameter("date");
String area = (request.getParameter("area"));
String movietitle = (request.getParameter("moviename"));
String screen = (request.getParameter("screen"));
String starttime = request.getParameter("starttime");
String theatername="";
String theater1 = (request.getParameter("theater1"));
String theater2 = (request.getParameter("theater2"));
String theater3 = (request.getParameter("theater3"));
String theater4 = (request.getParameter("theater4"));
String theater5 = (request.getParameter("theater5"));
String theater6 = (request.getParameter("theater6"));
String theater7 = (request.getParameter("theater7"));

theatername = theater1+theater2+theater3+theater4+theater5+theater6+theater7;

seat.SeatInfo(theatername,playdate,movietitle,screen,starttime);
col = seat.getCol();
row = seat.getRow();
seat.TicketCount(theatername,playdate,movietitle,screen,starttime);
rs = seat.ReservationColum(theatername,playdate,movietitle,screen,starttime);
totalticket = seat.getTotalTicket();
minticket = seat.getMinTicket();
maxticket = seat.getMaxTicket();

System.out.println(theatername);
System.out.println(playdate);
System.out.println(movietitle);
System.out.println(screen);
System.out.println(starttime);
System.out.println(col);
System.out.println(row);
System.out.println(totalticket);
System.out.println(minticket);
System.out.println(maxticket);
System.out.println(people);
%>

<form id ="seat" name="seat" method="post" action="Reservation.jsp">
<table>
<tr><% 
	String no="no";
	String checkbox="";
	for(int i=minticket-1,j=0; i<maxticket; i++,j++){
		rs.next();
		reserveseat=rs.getString(1);
		checkboxvalue = i+1;
		checkbox = "check"+checkboxvalue;
		System.out.println(checkbox);
		if(reserveseat.equals(no)){
%>	
		<td>
			<input type="checkbox" id="<%=checkbox %>" name="<%=checkbox %>" value="<%=checkboxvalue %>">
		</td>

<%
		}else{
%>
		<td>
			<font size="0.8">▨</font>
		</td>
<%
		}if(j%col==(col-1)){
			%>
			<table>
			<tr>
			</tr>
			</table>
			<%
		}
	}
	rs.close();
	seat.close();
%></tr>
	<tr>
		<td>
			<input type="text" name="theatername" value="<%=theatername %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="people" value="<%=people %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="playdate" value="<%=playdate %>" style="display:none"readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="movietitle" value="<%=movietitle %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="screen" value="<%=screen %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="starttime" value="<%=starttime %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="col" value="<%=col %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="playround" value="<%=playround %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="row" value="<%=row %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="totalticket" value="<%=totalticket %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="minticket" value="<%=minticket %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="maxticket" value="<%=maxticket %>" style="display:none" readonly>
		</td>
	</tr>
	<tr>
		<td>
			<input id = "submit" name = "submit" type = "submit" value="결제"/>	
		</td>
	</tr>
</table>
</form>
</body>
</html>