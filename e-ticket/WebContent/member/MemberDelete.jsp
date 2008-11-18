<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(session.getAttribute("id")==null){
	%>
		<table>
			<tr>
				<td>
					로그인후 이용해주세요..
				</td>
			</tr>
			<tr>
				<td><a href="../login/Login.jsp">[로그인하기]</a></td>	
				<td><a href="../main/main.jsp">[메인으로]</a></td>
			</tr>
		</table>
	<%
}else{
	mem.MemberDelete(id);
	%>
	<table>
		<tr>
			<td>
				탈퇴가 정상적으로 처리되었습니다.<br>
				이용해주셔서 감사합니다.
			</td>
		</tr>
		<tr>
			<td>
				<a href="../main/main.jsp">[메인으로]</a>
			</td>
		</tr>
	</table>
	<%
}
%>
</body>
</html>