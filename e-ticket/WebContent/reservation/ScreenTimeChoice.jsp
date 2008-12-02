<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>    
<jsp:useBean id="util" scope="page" class="com.beans.etc.Utility"></jsp:useBean>
<jsp:useBean id="movieschedule" scope="page" class="com.beans.movie.MovieSchedule"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>시간상영관선택</title>
<script language="JavaScript">
function time(val1,val2,val3){
	opener.document.choice.screen.value=val1;
	opener.document.choice.starttime.value=val2;
	opener.document.choice.playround.value=val3;
	
	window.close();
}

</script>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

ResultSet rs=null;
String playdate = request.getParameter("date");
String area = util.getHan(request.getParameter("area"));
String movietitle = util.getHan(request.getParameter("moviename"));
String theatername="";
String screenname="";
String runtime="";
String playstarttime="";
String playround="";
String theater1 = util.getHan(request.getParameter("theater1"));
String theater2 = util.getHan(request.getParameter("theater2"));
String theater3 = util.getHan(request.getParameter("theater3"));
String theater4 = util.getHan(request.getParameter("theater4"));
String theater5 = util.getHan(request.getParameter("theater5"));
String theater6 = util.getHan(request.getParameter("theater6"));
String theater7 = util.getHan(request.getParameter("theater7"));
theatername = theater1+theater2+theater3+theater4+theater5+theater6+theater7;
%>
<table>
		<tr>
			<td>
				<%=theatername %>	
			<td>
		</tr>	
		<tr> 
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
        	 String screen="";
    	     
    	     rs = movieschedule.ScreenTime(playdate, theatername, movietitle);
 	   
 	    	 while(rs.next()){
 	    		 if(!(screen.equals(screenname))){
 	    			if(count!=0){
	    			 		%>
	    			 			</tr>
	    			 		<%
	    			 	}
	    			 screen = rs.getString(1);
	    			 runtime = rs.getString(2);
	    			 count=0;
 	    		 }
 	    		 
 	    		 screenname = rs.getString(1); 
	    		 runtime = rs.getString(2);
	    		 playstarttime = rs.getString(3);
	    		 playround = rs.getString(4);
	    		 
 	    		 if(!(screen.equals(screenname))){
 	    			 %>
 	    			 <tr>
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
 	    		 		<a href="javascript:time('<%=screenname %>','<%=playstarttime %>','<%=playround %>')"><%=playstarttime %></a>
 	    		 		</b>
 	    		 	</td>
 	    		 <%
 	    	}
 	    	
 	    }catch(Exception e){
 	    	e.printStackTrace();
 	    }finally{
 	    	if(rs!=null)rs.close();
 	    	movieschedule.close();
 	    }
%>
</table>
</body>
</html>