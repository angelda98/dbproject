<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��Ż��</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(session.getAttribute("id")==null){
	%>
		<table>
			<tr>
				<td>
					�α����� �̿����ּ���..
				</td>
			</tr>
			<tr>
				<td><a href="../login/Login.jsp">[�α����ϱ�]</a></td>	
				<td><a href="../main/main.jsp">[��������]</a></td>
			</tr>
		</table>
	<%
}else{
	mem.MemberDelete(id);
	%>
	<table>
		<tr>
			<td>
				Ż�� ���������� ó���Ǿ����ϴ�.<br>
				�̿����ּż� �����մϴ�.
			</td>
		</tr>
		<tr>
			<td>
				<a href="../main/main.jsp">[��������]</a>
			</td>
		</tr>
	</table>
	<%
}
%>
</body>
</html>