<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel = stylesheet href="../css/style.css" type="text/css">
<script language="JavaScript">
function loginCheck(){
	if(document.member.id.value==""){
		alert("���̵� �Է��� �ּ���");
		document.member.id.focus();
		return;
	}
	if(document.member.password.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.member.password.focus();
		return;
	}
	document.member.submit();
}
</script>
<title>�α���</title>
</head>
<body>

<form name = "member" action = "LoginOk.jsp" method = "post">
	<div id="bone">
		<div id = "header">
		<div id = "logname"><font color="#ca582a"><b>��&nbsp;LOGIN</b></font>
			<div id = "logout">		
				<div id = "log">
				<center>
				<table width = "260px" border = "0" cellspacing = "1" cellpadding ="0" >
					<tr>
						<td>
							<table border = "0" cellspacing = "0" cellpadding ="0" >
								<tr>
									<td class = "login" align = "right"><font color = "#df3835"><b>���̵� :</b></font></td><td class = "login" >&nbsp;<input type = "text" name = "id" size = "15"></td>
									<td rowspan = "2" align = "center"><input type="Image" src = "../login/image/login2.jpg" name="submit" value="�α���" onclick="loginCheck()"></td>
								</tr>
								<tr>
									<td class = "login" align = "right"><font color = "#df3835"><b>��й�ȣ :</b></font></td class = "login" ><td><input type = "password" name = "pass" size = "15"></td>
								</tr>
								<tr>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
		</div>
	</div>
</form>
	</body>
</html>