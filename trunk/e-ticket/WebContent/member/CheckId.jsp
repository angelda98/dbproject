<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<jsp:useBean id="idcheck" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� �ߺ�üũ</title>
<script language="JavaScript">
function checkid(p_id) {	
	if(document.p_id.id.value.length < 0 || document.p_id.id.value == "" ){
		alert("ID�� �Է��� �ּ���!");
		document.p_id.id.focus();
		return;
	}
	else {
		document.p_id.submit();
	}
}

function SendId(c_id){ 				 		
	var id = c_id;
	if(id.length<0){
		alert("ID�� �Է��� �ּ���!");
		document.p_id.id.focus();
		return;
	}
	else { 
		opener.document.member.id.value = id;
		window.close(); 
	}    	
}
</script>
</head>

<%	
	String id = request.getParameter("id");
	String c_id="";
	boolean data_yn = false;
	if(id != null) {
		c_id = id;
		try{
			data_yn = idcheck.getIdcheck(id);
		    //out.println("Msg = "+ b_sel.show_msg()); 
			//out.println(b_sel.Error_show()); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}  
%>

<body>
<table>

	<%  if(id=="") { %>
	<tr>
		<td>�� ����ϰ��� �ϴ� ID�� �Է��� �ֽʽÿ�.<br>�� ������ ������ �������� 4���̻� 8�� ���Ϸ� �����մϴ�..</td>
	</tr>
	<%	}else {	
			if(data_yn==true) {		
	%>
	<tr>
		<td>��� ������ ���̵� �Դϴ�...</td>
	</tr>
		<%	}else { %>
	<tr>
			<td>���̵� �̹� �����մϴ�...</td>
	</tr>
	<%  	}
		} %>	
</table>
<form name=p_id method="post" action="CheckId.jsp"  >							
	<table>
		<tr>
			<td>
				<input type=text name="id"  size="10" maxlength="10" value="<%=c_id%>">
			</td>
			<td>
				<input type="Button" value="�� ȸ" onClick="javascript:checkid(p_id);"> 
			</td>
		</tr>
	</table>
</form>
<table>
	<tr align=center>
		<td colspan=3> 
		    <input type="Button" value="Ȯ ��" onClick="javascript:SendId('<%=c_id%>');" class=form> 
			<input type="Button" value="�� ��" onClick="javascript:window.close();" class=form>
		</td>	
	</tr>
</table>
</body>
</HTML>
