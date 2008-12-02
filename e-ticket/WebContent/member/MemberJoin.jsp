<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
	<tr><td class="title" colspan ="2"><font class = title color="#df3835">&nbsp;회원기본정보 입력</font></td></tr>
		<tr><td class="detail_menu" width="20%"><font class= menu><font color="#71c671">&nbsp
			아이디</font></td>
			<td colspan="2" class=grey>
				<input id = "id" name = "id" type="text"  size=15 maxlength="10"/>
				<input id = "idcheck" type = "button" value = "아이디 중복 체크" OnClick = "check_id()">*6~10글자로 해주세요.
			</td>
		</tr>
		<tr><td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			패스워드</font></td>
			<td colspan="2" class=grey>
				<input id = "pass" name = "pass" type = "password"   maxlength="10" size=15/>*6~10글자로 해주세요
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			패스워드확인</font></td>
			<td colspan="2" class=grey>
				<input id = "pass1" name = "pass1" type = "password"   size=15 maxlength="10"/>
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			이 름</font></td>
			<td colspan="2" class=grey>
				<input id = "name" name = "name" type = "text"  size=15 maxlength="4"/>*4글자까지
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			주민등록번호</font></td>
			<td colspan="2" class="grey">
				<input id = "birth" name = "birth" type = "text"  class = "mjoin" maxlength="6"/>
				<input id = "jumin"	name = "jumin" type = "password" class = "mjoin" maxlength="7" />	
			</td>
		</tr>
		<tr><td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			이메일</font></td>
			<td colspan="2" class=grey>
				<input id = "email" name = "email" type = "text"  class = "mjoin"/>@
				<select id = "email1" name = "email1" onchange = op(this)>
					<option value = "" selected = "selected">이메일 사이트</option>
					<option value = "naver.com">naver.com</option>
					<option value = "hanmail.net">hanmai.net</option>
					<option value = "freechal.com">freechal.com</option>
					<option value = "gmail.com">gmail.com</option>
					<option value = "00">직접입력</option>
				</select>
					<input id = "email2" name = "email2" type = "text" class = "mjoin" style="display:none"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			우편번호</font></td>
			<td colspan="2" class=grey>
				<input id = "zipcode" name = "zipcode" type = "text"  class = "mjoin" maxlength="7" readonly/>
				<input id = "post" type = "button" value = "우편번호 검색" OnClick = "post_search()" readonly>*6~10글자로 해주세요.
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			주소</font></td>
			<td colspan="2" class=grey>
				<input id = "addr" name = "addr" type = "text"  class = "mjoin"/>
				<input id = "addr1" name = "addr1" type = "text"  class = "mjoin"/>	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			휴대전화</font></td>
			<td colspan="2" class=grey>
				<input id = "mobile" name = "mobile" type = "text" class = "mjoin" maxlength="3"/>
				<input id = "mobile1" name = "mobile1" type = "text" class = "mjoin" maxlength="4"/>
				<input id = "mobile2" name = "mobile2" type = "text" class = "mjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			전화번호</font></td>
			<td colspan="2" class=grey>
				<input id = "phone" name = "phone" type = "text" class = "sjoin" maxlength="3"/>
				<input id = "phone1" name = "phone1" type = "text" class = "sjoin" maxlength="4"/>
				<input id = "phone2" name = "phone2" type = "text" class = "sjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			홈페이지</font></td>
			<td colspan="2" class=grey>
				<input id = "homepage" name = "homepage" type = "text" class = "sjoin"/>  	
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			직업</font></td>
			<td colspan="2" class=grey>
				<select id = "job" name = "job" class = "sjoin">
					<option value = "" selected = "selected">-------------</option>
					<option value = "학생">학생</option>
					<option value = "주부">주부</option>
					<option value = "회사원">회사원</option>
					<option value = "공무원">공무원</option>
					<option value = "의사">의사</option>
					<option value = "약사">약사</option>
					<option value = "판사">판사</option>
					<option value = "검사">검사</option>
					<option value = "교수">교수</option>
					<option value = "교사">교사</option>
					<option value = "디자이너">디자이너</option>
					<option value = "군인">군인</option>
					<option value = "기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="detail_menu"><font class= menu><font color="#71c671">&nbsp
			자기소개</font></td>
			<td colspan="2" class=grey>
				<textarea id = "description" name = "description" cols = "50" rows = "5" class = "sjoin"></textarea>
			</td>
		</tr>
		<tr>
			<td  class=grey colspan = "2" scope = "row" style = "text-align:center;border;none;">
				<input id = "reset" name = "reset" type = "reset" value="재작성"/>
		   	 	<input id = "submit" name = "submit" type = "submit" value="등록"/>
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
					로그아웃 후 이용해 주세요..
				</td>
			</tr>
			<tr>
				<td>
					<a href = "../login/Logout.jsp">[로그아웃]</a>
					<a href = "../main/main.jsp">[메인으로]</a>
				</td>
			</tr>	
		</table>
<%} %>
</body>
</html>