<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그아웃</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null){
	session.invalidate();
%>
<table>
	<tr>
		<td>로그아웃 되었습니다</td>
	</tr>
	<tr>
		<td>
			<a href="./Login.jsp">[다시 로그인 하기]</a>
		<td>
		<td>
			<a href="../main/main.jsp">[메인으로]</a>
		<td>
	</tr>
</table>
<%
}
%>
</body>
</html>