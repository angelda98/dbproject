<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<jsp:useBean id="util" scope="page" class="com.beans.etc.Utility"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ����</title>
<script language="JavaScript">
function op(f){
	if(f.value != "00"){
		document.all.email2.style.display="none";
	}
	if(f.value == "00"){
		document.all.email2.style.display="block";
	}
	
}

function post_search()	{ 
	browsing_window=window.open("Post.jsp", "_postcheck","height=400,width=300, menubar=no,scrollbars=yes");
	browsing_window.focus();
}
</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
member.setId(id);
mem.MemberInfo(member);
%>
<form id = "member" name = "member" method = "post" action = "MemberUpdateResult.jsp">
	<table border = "1"	id="jointable">
		<tr>
			<th scope = "row"><strong>���̵�</strong></th>
			<td>
				<input id = "id" name = "id" type="text" value="<%=member.getId()%>" class="mjoin" maxlength="10" readonly/>
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�н�����</strong></th>
			<td>
				<input id = "pass" name = "pass" type = "password" value="<%=member.getPass()%>" class = "mjoin" maxlength="10"/>*6~10���ڷ� ���ּ���
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�н�����Ȯ��</strong></th>
			<td>
				<input id = "pass1" name = "pass1" type = "password" value="<%=member.getPass()%>" class = "mjoin" maxlength="10"/>
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�̸�</strong></th>
			<td>
				<input id = "name" name = "name" type = "text" value="<%=member.getName(false)%>" class = "mjoin" maxlength="4" readonly/>*4���ڱ���
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�ֹε�Ϲ�ȣ</strong></th>
			<td>
				<input id = "birth" name = "birth" type = "text" value="<%=member.getBirth() %>" class = "mjoin" maxlength="6" readonly/>
				<input id = "jumin"	name = "jumin" type = "password" value="<%=member.getJumin()%>" class = "mjoin" maxlength="7" readonly/>	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�̸���</strong></th>
			<td>
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
			<th scope = "row"><strong>�����ȣ</strong></th>
			<td>
				<input id = "zipcode" name = "zipcode" value="<%=member.getZipcode()%>" type = "text"  class = "mjoin" maxlength="7" readonly/>
				<input id = "post" type = "button" value = "�����ȣ �˻�" OnClick = "post_search()" readonly>*6~10���ڷ� ���ּ���.
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�ּ�</strong></th>
			<td>
				<input id = "addr" name = "addr" value="<%=member.getAddr(false)%>" type = "text"  class = "mjoin"/>
				<input id = "addr1" name = "addr1" value="<%=member.getAddr1(false)%>" type = "text"  class = "mjoin"/>	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>�ڵ���</strong></th>
			<td>
				<input id = "mobile" name = "mobile" type = "text" class = "mjoin" maxlength="3"/>
				<input id = "mobile1" name = "mobile1" type = "text" class = "mjoin" maxlength="4"/>
				<input id = "mobile2" name = "mobile2" type = "text" class = "mjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>��ȭ��ȣ</strong></th>
			<td>
				<input id = "mobile1" name = "phone" type = "text" class = "sjoin" maxlength="3"/>
				<input id = "mobile1" name = "phone1" type = "text" class = "sjoin" maxlength="4"/>
				<input id = "mobile2" name = "phone2" type = "text" class = "sjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>Ȩ������</strong></th>
			<td>
				<input id = "homepage" name = "homepage" type = "text" value="<%=member.getHomepage(false)%>"class = "sjoin"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>����</strong></th>
			<td>
				<select id = "job" name = "job" class = "sjoin">
					<option value = "<%=member.getJob(false)%>" selected = "selected"><%=member.getJob(false)%></option>
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
			<th scope = "row"><strong>�ڱ�Ұ�</strong></th>
			<td>
				<textarea id = "description" name = "description" value="<%=member.getDescription(false)%>" cols = "50" rows = "5" class = "sjoin"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2" scope = "row" style = "text-align:center;border;none;">
				<input id = "reset" name = "reset" type = "reset" value="���ۼ�"/>
		   	 	<input id = "submit" name = "submit" type = "submit" value="���"/>
			</td>
		</tr>				
	</table>
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	
</form>
</body>
</html>