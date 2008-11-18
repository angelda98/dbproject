<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인정보수정처리</title>
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
				정보수정에 실패하셨습니다..<br>
				다시 수정해 주세요.
			</td>
		</tr>
		<tr>
			<td>
				<a href="./MemberUpdate.jsp">[다시수정하기]</a>
			</td>
			<td>
				<a href="../main/main.jsp">[메인으로]</a>
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
				회원수정에 성공하셨습니다.<br>
			</td>
		</tr>
		<tr>
			<td>
				<a href="../main/main.jsp">[메인으로]</a>
			</td>
		</tr>
	</table>
	<%} %>
</body>
</html>