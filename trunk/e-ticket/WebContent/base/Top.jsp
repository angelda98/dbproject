<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����ȭ��</title>
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
						<input type="submit" name="submit" value="�α���">
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
						<%=id %>��
					</td>
					<td>
						<input type="submit" id="submit" name="submit" value="�α׾ƿ�">
					</td>
					<td>
						<a href="../member/MemberDelete.jsp"><font color="#ca582a"><b>ȸ��Ż��</b></font></a>
					</td>
					<td>
						<a href="../member/MemberUpdate.jsp"><font color="#ca582a"><b>������������</b></font></a>
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
						<a href = "../movie/MovieList.jsp"><font color="#ca582a"><b>��ȭ����</b></font> </a> |
						<a href = ""><font color="#ca582a"><b>����</b></font> </a> |
						<a href = "../schedule/MovieSchedule.jsp"><font color="#ca582a"><b>��ȭ�ð� </b></font></a> |
						<a href = "../member/MemberJoin.jsp"><font color="#ca582a"><b>ȸ������</b></font></a>&nbsp;&nbsp;&nbsp;
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