<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상위화면</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
String id = null;
id = (String)session.getAttribute("id");
%>
<div id="wrapper">
	<table class="tab">
		<tr>
		<td>
			<table>
				<tr>
					<td id = "logo" width = "180" rowspan = "2"><a href = "../main/main.jsp"><img src = "../base/image/logo.JPG" border=0></a></td>
					<td id = "login" width = "40" rowspan = "2" align="right"><a href = "../login/Login.jsp"></a></td>
				</tr>
			</table>
		</td>
		<td><%
			if(id==null){
			%>
			<form id ="top_menu" name = "top_menu" method = "post" action = "../login/LoginOk.jsp">
			<table>
				<tr>
					<td align="right">
					<font color="#ca582a"><b>	id/ps</b></font>
					</td>
					<td>
						<input type="text" id="id" name="id">	
					</td>
					<td>
						<input type="password" id="pass" name="pass">
						<input type="submit" name="submit" value="로그인">
					</td>
				</tr>
			</table>
			</form>
			<%
			}
			else{
			%>
			<form id ="top_menu" name = "top_menu" method = "post" action = "../login/Logout.jsp">
			<table>
				<tr>
					<td>
						<%=id %>님
					</td>
					<td>
						<input type="submit" id="submit" name="submit" value="로그아웃">
					</td>
					<td>
						<a href="../member/MemberDelete.jsp"><font color="#ca582a"><b>회원탈퇴</b></font></a>
					</td>
					<td>
						<a href="../member/MemberUpdate.jsp"><font color="#ca582a"><b>개인정보수정</b></font></a>
					</td>
				</tr>
			</table>
			</form>
			<%
			}
			%>
			<table>
				<tr>
					<td height = "20" colspan = "2" align = "right" valign = "top">
						<a href = "../movie/MovieList.jsp"><font color="#ca582a"><b>영화정보</b></font> </a> |
						<a href = ""><font color="#ca582a"><b>예매</b></font> </a> |
						<a href = "../schedule/MovieSchedule.jsp"><font color="#ca582a"><b>영화시간 </b></font></a> |
						<a href = "../member/MemberJoin.jsp"><font color="#ca582a"><b>회원가입</b></font></a>&nbsp;&nbsp;&nbsp;
					</td>	
				</tr>
			</table>
		</td>
	</tr>
	<table>
		<tr>
			<td colspan = "2" class = "td_line"></td>
		</tr>	
	</table>
	<table border = "0" width = "824" cellpadding = "0" cellspacing = "0">
		<tr>
			<td><hr size = "0" noshade></td>
		</tr>
	</table>
	</table>
	</div>
</body>
</html>