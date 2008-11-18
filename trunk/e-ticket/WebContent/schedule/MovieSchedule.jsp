<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*, java.sql.*" %>
<%@page import="com.beans.db.ConnManager"%>
<%@page import="com.beans.etc.Utility"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ�ð�ǥ</title>
<script language = "JavaScript">
function op(f){
	if(f.value != "����"){
		document.all.theater.style.display="none";
	}
	if(f.value == "����"){
		document.all.theater.style.display="block";
	}
	
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");

ConnManager mgr = null;
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql ="";

String date[] = new String[7];
//String searchdate = request.getParameter("date");
String searchdate = "2008/11/16";
String area = request.getParameter("area");
String theater = request.getParameter("theater");
String playstarttime="";
String movietitle="";
String screenname="";

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
			<td>
				<select id = "area" name = "area" onchange = op(this) class ="timetable">
					<option value = "" selected = "selected">------</option>
					<option value = "����">����</option>
					<option value = "��⵵">���</option>
					<option value = "��û�ϵ�">���</option>
					<option value = "��û����">�泲</option>
					<option value = "����ϵ�">����</option>
					<option value = "���󳲵�">����</option>
					<option value = "���ϵ�">���</option>
					<option value = "��󳲵�">�泲</option>
					<option value = "������">����</option>
					<option value = "���ֵ�">����</option>
				</select>
			</td>
			<td>
					<select id = "theater" name = "theater" class = "timetable" style="display:none"/>
						<option value = "" selected = "selected">-------------</option>
						<option value = "cgv �б���">cgv �б���</option>
						<option value = "cgv ������">cgv ������</option>
					</select>  	
			</td>
		
		<td>
			<input id = "submit" name = "submit" type = "submit" value="��ȸ"/>
		</td>
	</tr>
</table>
</form>
<table>
          <tr> 
            <td width="159" height="35" bgcolor="#F6F2ED" style="padding-left:10px"><b>��ȭ��</b></td> 
            <td width="50" align="center" bgcolor="#F6F2ED"><b>�󿵰�</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>1ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>2ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>3ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>4ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>5ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>6ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>7ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>8ȸ</b></td> 
            <td width="41" align="center" bgcolor="#F6F2ED"><b>9ȸ</b></td> 
          </tr> 
         <%
         try{
        	 int count=0;
        	 String moviename="";
    	     sql = "select movietitle, screenname, playstarttime, playround  from movieschedule s, movie m, theater t,screen c where m.moviecode(+)=s.moviecode and playdate=? and theatername=? and c.screencode = s.screencode order by playround asc";
       	     mgr = ConnManager.getInstance();
 	    	 conn = mgr.GetConnection();
 	    	 pstmt = conn.prepareStatement(sql);
 	    	 pstmt.setString(1, searchdate);
 	    	 pstmt.setString(2, theater);
 	    	 rs = pstmt.executeQuery();
 	   
 	    	 while(rs.next()){
 	    		 if(!(moviename.equals(movietitle))){
 	    			 	if(count!=0){
 	    			 		%>
 	    			 			</tr>
 	    			 		<%
 	    			 	}
 	    			 moviename = rs.getString(1);
 	    			 screenname = rs.getString(2);
 	    			 count++;
 	    		 }
 	    		 movietitle = rs.getString(1); 
 	    		 screenname = rs.getString(2);
 	    		 playstarttime = rs.getString(3);
 	    		 
 	    		 if(!(moviename.equals(movietitle))){
 	    			 %>
 	    			 <tr>
 	    			 	<td>
 	    			 		<b>
 	    			 		<%=movietitle %>
 	    			 		</b>
 	    			 	</td>
 	    			 	<td>
 	    			 		<b>
 	    			 		<%=screenname %>
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
 	    }catch(Exception e){
 	    	e.printStackTrace();
 	    }finally{
 	    	if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
 	    }
%>
</table>
</body>
</html>