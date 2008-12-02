<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mem" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:setProperty property="*" name="mem"/>
<jsp:useBean id="memjoin" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입처리</title>
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
			회원가입에 실패하셨습니다.<br>
			다시가입해주세요.
		</td>
	</tr>
	<tr>
		<td>
			<a href="./MemberJoin.jsp">[다시 회원가입]</a>
		</td>
		<td>
			<a href="../main/main.jsp">[메인으로 ]</a>
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
			회원가입을 축하드립니다.<br>
		</td>
	</tr>
	<tr>
		<td>
			<a href="../main/main.jsp">[메인으로]</a>
		</td>
		<td>
			<a href="../login/Login.jsp">[로그인 하기]</a>
		</td>
	</tr>
</table>
<%} %>
</body>
</html>