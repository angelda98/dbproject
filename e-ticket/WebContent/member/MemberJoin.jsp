<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel = stylesheet href="../css/style.css" type="text/css">
<script language = "JavaScript">
function op(f){
	if(f.value != "00"){
		document.all.email2.style.display="none";
	}
	if(f.value == "00"){
		document.all.email2.style.display="block";
	}
	
}

function check_id(){
	browsing_window=window.open("CheckId.jsp?id="+member.id.value, "_idcheck","height=300,width=200, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
}
function post_search()	{ 
	browsing_window=window.open("Post.jsp", "_postcheck","height=400,width=300, menubar=no,scrollbars=yes");
	browsing_window.focus();
}

</script>
</head>
<body bgcolor="white">
<%
String id = (String)session.getAttribute("id");
if(id==null){%>
<div id="bone">
	<div id="header">
	<div id="register">
		<center>
		<table width="600px" border="0" cellspacing="0" cellpadding="5">
		<tr>
		<td valign="middle">
<form id = "member" name = "member" method = "post" action = "MemberJoinResult.jsp">
	<table border = "0"	id="jointable" width="580px" cellspacing="0" cellpadding="2">
	<tr><td class="title" colspan ="2"><font class = title color="#df3835">&nbsp;ȸ���⺻���� �Է�</font></td></tr>
		<tr><td class="detail_menu" width="20%"><font class= menu><font color="#71c671">&nbsp
			���̵�</font></td>
			<td colspan="2" class=grey>
				<input id = "id" name = "id" type="text"  size=15 maxlength="10"/>
				<input id = "idcheck" type = "button" value = "���̵� �ߺ� üũ" OnClick = "check_id()">*6~10���ڷ� ���ּ���.
			</td>
		</tr>
		<tr><td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�н�����</font></td>
			<td colspan="2" class=grey>
				<input id = "pass" name = "pass" type = "password"   maxlength="10" size=15/>*6~10���ڷ� ���ּ���
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�н�����Ȯ��</font></td>
			<td colspan="2" class=grey>
				<input id = "pass1" name = "pass1" type = "password"   size=15 maxlength="10"/>
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�� ��</font></td>
			<td colspan="2" class=grey>
				<input id = "name" name = "name" type = "text"  size=15 maxlength="4"/>*4���ڱ���
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�ֹε�Ϲ�ȣ</font></td>
			<td colspan="2" class="grey">
				<input id = "birth" name = "birth" type = "text"  class = "mjoin" maxlength="6"/>
				<input id = "jumin"	name = "jumin" type = "password" class = "mjoin" maxlength="7" />	
			</td>
		</tr>
		<tr><td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�̸���</font></td>
			<td colspan="2" class=grey>
				<input id = "email" name = "email" type = "text"  class = "mjoin"/>@
				<select id = "email1" name = "email1" onchange = op(this)>
					<option value = "" selected = "selected">�̸��� ����Ʈ</option>
					<option value = "naver.com">naver.com</option>
					<option value = "hanmail.net">hanmai.net</option>
					<option value = "freechal.com">freechal.com</option>
					<option value = "gmail.com">gmail.com</option>
					<option value = "00">�����Է�</option>
				</select>
					<input id = "email2" name = "email2" type = "text" class = "mjoin" style="display:none"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�����ȣ</font></td>
			<td colspan="2" class=grey>
				<input id = "zipcode" name = "zipcode" type = "text"  class = "mjoin" maxlength="7" readonly/>
				<input id = "post" type = "button" value = "�����ȣ �˻�" OnClick = "post_search()" readonly>*6~10���ڷ� ���ּ���.
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�ּ�</font></td>
			<td colspan="2" class=grey>
				<input id = "addr" name = "addr" type = "text"  class = "mjoin"/>
				<input id = "addr1" name = "addr1" type = "text"  class = "mjoin"/>	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�޴���ȭ</font></td>
			<td colspan="2" class=grey>
				<input id = "mobile" name = "mobile" type = "text" class = "mjoin" maxlength="3"/>
				<input id = "mobile1" name = "mobile1" type = "text" class = "mjoin" maxlength="4"/>
				<input id = "mobile2" name = "mobile2" type = "text" class = "mjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			��ȭ��ȣ</font></td>
			<td colspan="2" class=grey>
				<input id = "phone" name = "phone" type = "text" class = "sjoin" maxlength="3"/>
				<input id = "phone1" name = "phone1" type = "text" class = "sjoin" maxlength="4"/>
				<input id = "phone2" name = "phone2" type = "text" class = "sjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			Ȩ������</font></td>
			<td colspan="2" class=grey>
				<input id = "homepage" name = "homepage" type = "text" class = "sjoin"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			����</font></td>
			<td colspan="2" class=grey>
				<select id = "job" name = "job" class = "sjoin">
					<option value = "" selected = "selected">-------------</option>
					<option value = "�л�">�л�</option>
					<option value = "�ֺ�">�ֺ�</option>
					<option value = "ȸ���">ȸ���</option>
					<option value = "������">������</option>
					<option value = "�ǻ�">�ǻ�</option>
					<option value = "���">���</option>
					<option value = "�ǻ�">�ǻ�</option>
					<option value = "�˻�">�˻�</option>
					<option value = "����">����</option>
					<option value = "����">����</option>
					<option value = "�����̳�">�����̳�</option>
					<option value = "����">����</option>
					<option value = "��Ÿ">��Ÿ</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			�ڱ�Ұ�</font></td>
			<td colspan="2" class=grey>
				<textarea id = "description" name = "description" cols = "50" rows = "5" class = "sjoin"></textarea>
			</td>
		</tr>
		<tr>
			<td  class=grey colspan = "2" scope = "row" style = "text-align:center;border;none;">
				<input id = "reset" name = "reset" type = "reset" value="���ۼ�"/>
		   	 	<input id = "submit" name = "submit" type = "submit" value="���"/>
			</td>
		</tr>				
	</table>
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	
</form>
</td>
</tr>
</table>
</center>
</div>
</div>
</div>
<%}else{%>
		<table>
			<tr>
				<td>
					�α׾ƿ� �� �̿��� �ּ���..
				</td>
			</tr>
			<tr>
				<td>
					<a href = "../login/Logout.jsp">[�α׾ƿ�]</a>
					<a href = "../main/main.jsp">[��������]</a>
				</td>
			</tr>	
		</table>
<%} %>
</body>
</html>