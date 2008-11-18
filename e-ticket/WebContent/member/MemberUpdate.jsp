<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" scope="page" class="com.beans.member.Member"></jsp:useBean>
<jsp:useBean id="mem" scope="page" class="com.beans.member.MemberProcess"></jsp:useBean>
<jsp:useBean id="util" scope="page" class="com.beans.etc.Utility"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인정보 수정</title>
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
			<th scope = "row"><strong>아이디</strong></th>
			<td>
				<input id = "id" name = "id" type="text" value="<%=member.getId()%>" class="mjoin" maxlength="10" readonly/>
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>패스워드</strong></th>
			<td>
				<input id = "pass" name = "pass" type = "password" value="<%=member.getPass()%>" class = "mjoin" maxlength="10"/>*6~10글자로 해주세요
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>패스워드확인</strong></th>
			<td>
				<input id = "pass1" name = "pass1" type = "password" value="<%=member.getPass()%>" class = "mjoin" maxlength="10"/>
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>이름</strong></th>
			<td>
				<input id = "name" name = "name" type = "text" value="<%=member.getName(false)%>" class = "mjoin" maxlength="4" readonly/>*4글자까지
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>주민등록번호</strong></th>
			<td>
				<input id = "birth" name = "birth" type = "text" value="<%=member.getBirth() %>" class = "mjoin" maxlength="6" readonly/>
				<input id = "jumin"	name = "jumin" type = "password" value="<%=member.getJumin()%>" class = "mjoin" maxlength="7" readonly/>	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>이메일</strong></th>
			<td>
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
			<th scope = "row"><strong>우편번호</strong></th>
			<td>
				<input id = "zipcode" name = "zipcode" value="<%=member.getZipcode()%>" type = "text"  class = "mjoin" maxlength="7" readonly/>
				<input id = "post" type = "button" value = "우편번호 검색" OnClick = "post_search()" readonly>*6~10글자로 해주세요.
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>주소</strong></th>
			<td>
				<input id = "addr" name = "addr" value="<%=member.getAddr(false)%>" type = "text"  class = "mjoin"/>
				<input id = "addr1" name = "addr1" value="<%=member.getAddr1(false)%>" type = "text"  class = "mjoin"/>	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>핸드폰</strong></th>
			<td>
				<input id = "mobile" name = "mobile" type = "text" class = "mjoin" maxlength="3"/>
				<input id = "mobile1" name = "mobile1" type = "text" class = "mjoin" maxlength="4"/>
				<input id = "mobile2" name = "mobile2" type = "text" class = "mjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>전화번호</strong></th>
			<td>
				<input id = "mobile1" name = "phone" type = "text" class = "sjoin" maxlength="3"/>
				<input id = "mobile1" name = "phone1" type = "text" class = "sjoin" maxlength="4"/>
				<input id = "mobile2" name = "phone2" type = "text" class = "sjoin" maxlength="4"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>홈페이지</strong></th>
			<td>
				<input id = "homepage" name = "homepage" type = "text" value="<%=member.getHomepage(false)%>"class = "sjoin"/>  	
			</td>
		</tr>
		<tr>
			<th scope = "row"><strong>직업</strong></th>
			<td>
				<select id = "job" name = "job" class = "sjoin">
					<option value = "<%=member.getJob(false)%>" selected = "selected"><%=member.getJob(false)%></option>
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
			<th scope = "row"><strong>자기소개</strong></th>
			<td>
				<textarea id = "description" name = "description" value="<%=member.getDescription(false)%>" cols = "50" rows = "5" class = "sjoin"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2" scope = "row" style = "text-align:center;border;none;">
				<input id = "reset" name = "reset" type = "reset" value="재작성"/>
		   	 	<input id = "submit" name = "submit" type = "submit" value="등록"/>
			</td>
		</tr>				
	</table>
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	
</form>
</body>
</html>