<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mem" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:setProperty property="*" name="mem"/>
<jsp:useBean id="memjoin" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ó��</title>
</head>
<body>
<%
String id = request.getParameter("id");
out.println(id);

boolean result = false;
try{
	mem.Comb();
	result = memjoin.MemberResult(mem);
	
}catch(Exception e){
	e.printStackTrace();
}


if(result==false){
%>
<table>
	<tr>
		<td>
			ȸ�����Կ� �����ϼ̽��ϴ�.<br>
			�ٽð������ּ���.
		</td>
	</tr>
	<tr>
		<td>
			<a href="./MemberJoin.jsp">[�ٽ� ȸ������]</a>
		</td>
		<td>
			<a href="../main/main.jsp">[�������� ]</a>
		</td>
	</tr>
</table>
<%	
}
else{
%>
<table>
	<tr>
		<td>
			ȸ�������� ���ϵ帳�ϴ�.<br>
		</td>
	</tr>
	<tr>
		<td>
			<a href="../main/main.jsp">[��������]</a>
		</td>
		<td>
			<a href="../login/Login.jsp">[�α��� �ϱ�]</a>
		</td>
	</tr>
</table>
<%} %>
</body>
</html>