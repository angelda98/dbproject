<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α׾ƿ�</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null){
	session.invalidate();
%>
<table>
	<tr>
		<td>�α׾ƿ� �Ǿ����ϴ�</td>
	</tr>
	<tr>
		<td>
			<a href="./Login.jsp">[�ٽ� �α��� �ϱ�]</a>
		<td>
		<td>
			<a href="../main/main.jsp">[��������]</a>
		<td>
	</tr>
</table>
<%
}
%>
</body>
</html>