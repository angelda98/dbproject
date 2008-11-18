<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>
<form id="idform" name = "idform" method="post" action="LoginOk.jsp">
	<table>
		<tr>
			<td>
				ID
			</td>
			<td>
				<input type="text" name = "id" id="id">
				<a href ="IdPassSearch.jsp">아이디/비번찾기</a>
			</td>
		</tr>
		<tr>
			<td>
				PS
			</td>
			<td>
				<input type="password" name="pass" id="pass">
				<input type="submit" name="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>
	</body>
</html>