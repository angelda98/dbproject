<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="../base/Top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel = stylesheet href="../css/style.css" type="text/css">
<script language="JavaScript">
<!--
function getFlash(swfName,wt,ht,id){
    document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="'+wt+'" height="'+ht+'" id="'+id+'">');
    document.write('<param name="movie" value="'+swfName+'">');
    document.write('<param name="quality" value="high">');
    document.write('<param name="wmode" value="transparent">');
    document.write('<param name="allowScriptAccess" value="always">');
    document.write('<div id="content" >'); 
    document.write('<embed src="'+swfName+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" width="'+wt+'" height="'+ht+'" allowScriptAccess="sameDomain" id="'+id+'"></embed></object>');
    document.write('</div>');
}

//-->
</script>
<style type="text/css">
<!--
#content {
	position:absolute;
	left:50px;
	top:250px;
	width:91px;
	height:31px;
	z-index:7;
	background:D3BC78;
}
-->
</style>
</head>
<body>
<div id="content">
<% 

// <OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 //codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
 //WIDTH=640 HEIGHT=400>
 //<PARAM NAME=movie VALUE="menu.swf"> <PARAM NAME=loop VALUE=false> 
 //<PARAM NAME=quality VALUE=high> 
 //<PARAM NAME=bgcolor VALUE=#000000> 
 //<EMBED src="menu.swf" loop=false quality=high bgcolor=#000000  WIDTH=800 HEIGHT=660 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED>
//</div>
 
 %>
<div id="header">
				<div id="nav">	
					<b><font class = "menu">스케줄/예약</font></b>
			</div>
		</div>
		<div id="shadow"></div>	

</body>
<%@include file="../base/Floor.jsp" %>
</html>