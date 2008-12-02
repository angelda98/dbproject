<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<jsp:useBean id="ticket" scope="page" class="com.beans.reservation.Ticket"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약확인</title>
</head>
<body>
<%
int reservationyn=0;
int reservationcode=0;
int resercode=0;
int srow=0;
int scol=0;
int peoplenumber=0;
int count=0;
String movietitle;
String playround;
String playstarttime;
String theatername;
String screenname;
String playdate;

String id = (String)session.getAttribute("id");
ResultSet rs=null;
rs = ticket.TicketResult(id);
reservationyn = ticket.ReservationYN(id);

if(id==null){
%><table>
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
}
else if(id!=null){
	if(reservationyn!=0){
		%><table><%
		while(rs.next()){
			resercode = rs.getInt("reservationcode");
			if(resercode!=reservationcode){
					if(count!=0){
					%></tr>
					<%			
				}
				count++;
				reservationcode = resercode;
				movietitle = rs.getString("movietitle");
				playround = rs.getString("playround");
				playdate = rs.getString("playdate");
				screenname = rs.getString("screenname");
				theatername = rs.getString("theatername");
				playstarttime = rs.getString("playstarttime");
				peoplenumber = rs.getInt("peoplenumber");
				%>
					<tr>
						<td>상영관</td>
						<td><%=theatername %></td>
						<td><%=screenname %></td>
					</tr>
					<tr>
						<td>영화제목</td>
						<td><%=movietitle %></td>
					</tr>
					<tr>
						<td>상영날짜</td>
						<td><%=playdate %></td>
						<td>상영회차</td>
						<td><%=playround %></td>
						<td>영화시작시간</td>
						<td><%=playstarttime %></td>
					</tr>
					<tr>
						<td>총인원</td>
						<td><%=peoplenumber %></td>
						<td>좌석</td>
			<%}
			srow=rs.getInt("srow");
			scol=rs.getInt("scol");
			%><td><%=srow %>행 <%=scol %>열</td>
		<%}
		%>
		</tr>
		</table>
	<%}
	else if(reservationyn==0){
		%>
			<table>
				<tr>
					<td>
						예매정보가 없습니다.
					</td>
					<td>
						<a href="../main/main.jsp">[메인으로]</a>
					</td>					
				</tr>
			</table>
		<%
	}
}%>
</body>
</html>