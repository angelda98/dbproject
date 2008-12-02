<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="login" scope="session" class="com.beans.login.Login"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 처리</title>
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
					아이디 혹은 비밀번호가 없거나 틀렸습니다.
				</td>
			</tr>
			<tr>
				<td>
					<a href = "./Login.jsp">[다시 로그인]</a>
					<a href = "../main/main.jsp">[메인으로]</a>
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