<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������������ó��</title>
</head>
<body>
<%
boolean result = false;
try{
	String id = (String)session.getAttribute("id");
	member.setId(id);
	out.print(member.getId());
	out.print(member.getEmail());

	out.print(member.getPass());

	out.print(member.getPhone());

	out.print(member.getMobile());
	
	member.Comb();
	result = mem.MemberUpdateResult(member);
	
}catch(Exception e){
	e.printStackTrace();
}

if(result==false){
	%>
	<table>
		<tr>
			<td>
				���������� �����ϼ̽��ϴ�..<br>
				�ٽ� ������ �ּ���.
			</td>
		</tr>
		<tr>
			<td>
				<a href="./MemberUpdate.jsp">[�ٽü����ϱ�]</a>
			</td>
			<td>
				<a href="../main/main.jsp">[��������]</a>
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
				ȸ�������� �����ϼ̽��ϴ�.<br>
			</td>
		</tr>
		<tr>
			<td>
				<a href="../main/main.jsp">[��������]</a>
			</td>
		</tr>
	</table>
	<%} %>
</body>
</html>