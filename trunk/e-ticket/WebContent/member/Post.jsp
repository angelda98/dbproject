<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.beans.etc.*"%>
    
<jsp:useBean id="post" scope="page" class="com.beans.etc.Post_Query"></jsp:useBean>
<jsp:useBean id="data" scope="page" class="com.beans.etc.Post_Entity"></jsp:useBean>
<jsp:setProperty property="*" name="data"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ȣ ã��</title>
<script language="JavaScript">
function postnum(dong_name){
	if(document.dong_name.dongid.value<1&&document.dong_name.dongid.value==""){
		alert("ã���� �ϴ� ������ �Է��ϼ���");
		return false;
	}
	else{
		document.dong_name.subnit();
	}
}

function research(){
	location.href="Post.jsp?key=a";
}

function SendAddress(zipcode, addr){
	opener.document.member.zipcode.value = zipcode;
	opener.document.member.addr.value = addr;
	window.close(); 
}

</script>
</head>
<body>
<%
boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();

String key=request.getParameter("key");
key = (key == null) ?  "a" : key;
if(key.equals("b")) {		
	list  = new Vector();
	try{
		list = post.getMul_Data(request);
		//out.println(b_sel.show_msg()); 
		out.println(post.Error_show()); 
	}catch(Exception e){
		out.println("error ="+ e +"<Br>");
	}	
}   
%>
<table>
	<tr>
		<td>ã���� �ϴ� ������ �����̸����� �Է��� �ֽʽÿ�.<br>��) ����� ������ �Ｚ1�� �̶�� <br>���Ｚ1���� �Է��Ͻø� �˴ϴ�.</td>
	</tr>
</table>

						 
<form name=dong_name method="post" action="Post.jsp"  >
	<input type="hidden" value="b" name="key">	
		<table>
			<tr>
				<td>�ּ��Է�</td>
				<td>								
					<input type=text name="dongid" size="10" class="form"> ��(����)
				</td>
				<td>
					<input type="image"  onclick="postnum(dong_name)" src="./image/button_seach.gif">
				</td>
			</tr>
		</table>
</form>	

<%  if("b".equals(key)) {
		for(int i=0; i < list.size() ; i++){						
			Post_Entity pe = (Post_Entity)list.get(i);
			String zipcode = pe.getZipcode();
			String addr_1 = pe.getSido(han_yn)+" "+pe.getGugun(han_yn)+" "+pe.getDong(han_yn)+" "+pe.getRi(han_yn);
%>  							
<table>
	<tr>
		<td>
			<a href="javascript:SendAddress('<%=zipcode%>','<%=addr_1%>');" style="text-decoration:none;font-size:12">&nbsp;&nbsp;&nbsp;&nbsp;
					<%=pe.getZipcode()%>&nbsp;&nbsp;&nbsp;&nbsp;
					<%=pe.getSido(han_yn)%>&nbsp;<%=pe.getGugun(han_yn)%>&nbsp;
					<%=pe.getDong(han_yn)%>&nbsp;<%=pe.getRi(han_yn)%>&nbsp;<%=pe.getBunji(han_yn)%><br>
			</a>													
		</td>
	</tr>
 	<%  }  						
	 } //���� ��ȣ�˻� �Ϸ� %>		
</table>

</body>
</html>