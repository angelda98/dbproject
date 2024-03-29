<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.beans.db.ConnManager"%>
<%@page import="com.beans.etc.Utility"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="movie" scope="page" class="com.beans.movie.Movie"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화목록</title>
</head>
<body>
<center>
<table>
	<tr>
			<th>영화명</th>
			<td></td>
			<th>상영여부</th>
	</tr>
<%
	ConnManager mgr = null;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int pagecount;
	int datacount=0;
	
	try{
		String movieposter;
		String movietitle;
		
		rs = movie.Moviecount();
		if(rs.next()){
			datacount = rs.getInt(1);
		}
		rs.close();
		movie.close();
	
		int pagesize = 10;
		
		pagecount = datacount%pagesize;
		
		if(pagecount==0){
			pagecount=datacount/pagesize;
		}
		else pagecount=datacount/pagesize+1;
		
		int mypage = 1;
		int abpage = 1;
		if(request.getParameter("mypage")!=null){
			mypage = Integer.parseInt(request.getParameter("mypage"));
			abpage = (mypage-1)*pagesize+1;
			if(abpage <=0)abpage=1;
		}
		
		rs = movie.Movielist();
		
		for(int k=1; k<abpage; k++)rs.next();
		
		int k = 1;
		
		while(rs.next()&&k<=pagesize){
			movieposter = rs.getString(1);
			movietitle = rs.getString(2);
			
			k++;
%>
				<tr>
					<td><img name="poster" height="100" width="150" src="<%=movieposter%>"></td>
					<td><a href ="MovieInfo.jsp?movietitle=<%=java.net.URLEncoder.encode(rs.getString(2), "euc-kr")%>"><%=movietitle %></a></td>
				</tr>
	
<%
		}
%></table></center>
<%
		int gopage=1;
		
		if(mypage != 1){
			gopage = mypage-1;
			out.print("<a href=MovieList.jsp?mypage="+gopage+"><<이전</a>");
		}
		if(mypage != pagecount){
			gopage = mypage+1;
			out.print("<a href=MovieList.jsp?mypage="+gopage+">다음>></a>");
		}
		rs.close();
		movie.close();

	}catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null){rs.close();}
	}
%>
	
</body>
</html>