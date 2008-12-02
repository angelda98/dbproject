<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, java.sql.*" %>
<jsp:useBean id="ticket" scope="page" class="com.beans.reservation.Ticket"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>예약처리</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
ResultSet rs;
String id = (String)session.getAttribute("id");
String checkbox="";
int ticketcode1=0;
int ticketcode2=0;
int ticketcode3=0;
int ticketcode4=0;
int reservationcode=0;
int checkboxvalue=0;
boolean funxyn=false;
int schedulecode=0;
int srow=0;
int scol=0;
String playround=request.getParameter("playround");
String people=request.getParameter("people");
String playdate = request.getParameter("playdate");
String movietitle = request.getParameter("movietitle");
String screen = request.getParameter("screen");
String starttime = request.getParameter("starttime");
String theatername = request.getParameter("theatername");
String row = request.getParameter("row");
String col = request.getParameter("col");
int totalticket =Integer.parseInt(request.getParameter("totalticket"));
int minticket = Integer.parseInt(request.getParameter("minticket"));
int maxticket = Integer.parseInt(request.getParameter("maxticket"));
String []reqcheck = new String[totalticket];

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"/";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"/";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE));

for(int i=minticket-1,j=0; i<maxticket; i++){
	checkboxvalue=i+1;
	checkbox = "check"+checkboxvalue;
	reqcheck[i] = request.getParameter(""+checkbox+"");
	if(reqcheck[i]!=null&&j==0){
		ticketcode1 = Integer.parseInt(reqcheck[i]);
		j++;
	}
	else if(reqcheck[i]!=null&&j==1){
		ticketcode2 = Integer.parseInt(reqcheck[i]);
		j++;
	}
	else if(reqcheck[i]!=null&&j==2){
		ticketcode3 = Integer.parseInt(reqcheck[i]);
		j++;
	}
	else if(reqcheck[i]!=null&&j==3){
		ticketcode4 = Integer.parseInt(reqcheck[i]);
		j++;
	}
	System.out.println(reqcheck[i]);
}

if(ticketcode1!=0){
	funxyn = ticket.ReservationInsert(indate,7000*Integer.parseInt(people),Integer.parseInt(people),id);
	if(funxyn==false){
%>
		<table>
			<tr>
				<td>
					예매 되지 않았습니다. 다시 예매해주세요
				</td>
				<td>
					<a href="../main/main.jsp">[메인으로]</a>
					<a href="../reservation/ReservationForm.jsp">[예매]</a>
				</td>
			</tr>
		</table>
<%
	}
	funxyn=ticket.TicketChange(ticketcode1);
	if(funxyn==false){
%>	
		<table>
			<tr>
				<td>
					예매 되지 않았습니다. 다시 예매해주세요
				</td>
				<td>
					<a href="../main/main.jsp">[메인으로]</a>
					<a href="../reservation/ReservationForm.jsp">[예매]</a>
				</td>
			</tr>
		</table>
<%	
	}
	reservationcode = ticket.LastestReservationcode();
	funxyn=ticket.Reservation_TicketInsert(reservationcode,ticketcode1);
	if(funxyn==false){
%>	
		<table>
			<tr>
				<td>
					예매 되지 않았습니다. 다시 예매해주세요
				</td>
				<td>
					<a href="../main/main.jsp">[메인으로]</a>
					<a href="../reservation/ReservationForm.jsp">[예매]</a>
				</td>
			</tr>
		</table>
<%}	
}
if(ticketcode2!=0){
	funxyn=ticket.TicketChange(ticketcode2);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
	}
	reservationcode = ticket.LastestReservationcode();
	funxyn=ticket.Reservation_TicketInsert(reservationcode,ticketcode2);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
	}
}
if(ticketcode3!=0){
	funxyn=ticket.TicketChange(ticketcode3);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
	}
	reservationcode = ticket.LastestReservationcode();
	funxyn=ticket.Reservation_TicketInsert(reservationcode,ticketcode3);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
		}
}
if(ticketcode4!=0){
	funxyn=ticket.TicketChange(ticketcode4);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
	}
	reservationcode = ticket.LastestReservationcode();
	funxyn=ticket.Reservation_TicketInsert(reservationcode,ticketcode4);
	if(funxyn==false){
		%>	
				<table>
					<tr>
						<td>
							예매 되지 않았습니다. 다시 예매해주세요
						</td>
						<td>
							<a href="../main/main.jsp">[메인으로]</a>
							<a href="../reservation/ReservationForm.jsp">[예매]</a>
						</td>
					</tr>
				</table>
		<%	
	}
}
%>
<table>
	<tr>
		<td>
			예약완료....<br>이용해주셔서 감사합니다.
		</td>
		<td>
			<a href="../main/main.jsp">[메인으로]</a>
			<a href="../reservation/ReserveResult.jsp">[예약확인]</a>
		</td>
	</tr>
</table>
</body>
</html>