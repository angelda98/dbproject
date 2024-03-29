<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*, java.sql.*" %>
<jsp:useBean id="movie" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<jsp:useBean id="theater" scope="page" class="com.beans.theater.theater"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화시간표</title>
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

ResultSet rs = null;
String sql ="";

String date[] = new String[7];
//String searchdate = request.getParameter("date");
String searchdate = request.getParameter("date");
String area = request.getParameter("area");
String playstarttime="";
String movietitle="";
String screenname="";
String runtime="";

int i = 0;

for(i=0; i<7; i++){
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"/";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"/";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)+i);
	date[i] = indate;
}

%>
<form id="search" name="search" method="post" action="MovieSchedule.jsp">
<table>
	<tr>
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
<table>
		<tr>
			<td>
				<%=theatername %>	
			<td>
		</tr>	
		<tr> 
            <td width="159" height="35" bgcolor="#F6F2ED" style="padding-left:10px"><b>영화명</b></td> 
            <td width="50" align="center" bgcolor="#F6F2ED"><b>상영관</b></td> 
            <td width="50" align="center" bgcolor="#F6F2ED"><b>상영시간</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>1회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>2회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>3회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>4회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>5회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>6회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>7회</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>8회</b></td> 
          </tr> 
         <%
         try{
        	 int count=0;
        	 String moviename="";
    	     sql = "select movietitle,screenname,runtime,playstarttime from movieschedule s, movie m,theater t, screen c where s.moviecode=m.moviecode(+) and t.theatercode=s.theatercode and c.screencode = s.screencode and playdate=? and theatername=? order by screenname, playstarttime";
    	     
    	     rs = movie.Scheduleinfo(searchdate, theatername);
 	   
 	    	 while(rs.next()){
 	    		 if(!(moviename.equals(movietitle))){
 	    			 	if(count!=0){
 	    			 		%>
 	    			 			</tr>
 	    			 		<%
 	    			 	}
 	    			 moviename = rs.getString(1);
 	    			 screenname = rs.getString(2);
 	    			 runtime = rs.getString(3);
 	    			 count=0;
 	    		 }
 	    		 movietitle = rs.getString(1); 
 	    		 screenname = rs.getString(2);
 	    		 runtime = rs.getString(3);
 	    		 playstarttime = rs.getString(4);
 	    		 
 	    		 if(!(moviename.equals(movietitle))){
 	    			 %>
 	    			 <tr>
 	    			 	<td>
 	    			 		<b>
 	    			 		<a href ="../movie/MovieInfo.jsp?movietitle=<%=java.net.URLEncoder.encode(movietitle, "euc-kr")%>"><%=movietitle %></a>
 	    			 		</b>
 	    			 	</td>
 	    			 	<td>
 	    			 		<b>
 	    			 		<%=screenname %>
 	    			 		</b>
 	    			 	</td>
 	    			 	<td>
 	    			 		<b>
 	    			 		<%=runtime %>
 	    			 		</b>
 	    			 	</td>
 	    			 <%
 	    		 }%>
 	    		 	<td>
 	    		 		<b>
 	    		 		<%=playstarttime %>
 	    		 		</b>
 	    		 	</td>
 	    		 <%
 	    	
 	    	}
 	    	rs.close();
 			movie.close();
 	    }catch(Exception e){
 	    	e.printStackTrace();
 	    }finally{
 	    	if(rs!=null)rs.close();
 	    }
%>
</table>
</body>
</html>