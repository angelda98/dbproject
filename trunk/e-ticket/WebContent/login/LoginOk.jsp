<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="login" scope="session" class="com.beans.login.Login"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ó��</title>
</head>
<body>
<%
String id="";
String ps="";

try{
	id = request.getParameter("id");
	ps = request.getParameter("pass");
	boolean valid = login.validateUser(id,ps);

	if(valid == false){
		session = request.getSession(false);
		%>
		<table>
			<tr>
				<td>
					���̵� Ȥ�� ��й�ȣ�� ���ų� Ʋ�Ƚ��ϴ�.
				</td>
			</tr>
			<tr>
				<td>
					<a href = "./Login.jsp">[�ٽ� �α���]</a>
					<a href = "../main/main.jsp">[��������]</a>
				</td>
			</tr>	
		</table>
		<%
	}
	else{
		session = request.getSession(true);
		session.putValue("id",id);
		session.putValue("ps",ps);
		response.sendRedirect("../main/main.jsp");
	}

}catch(Exception e){
	e.printStackTrace();
}finally{
	login.close();		
}
%>
</body>
</html>