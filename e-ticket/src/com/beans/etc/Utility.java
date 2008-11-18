package com.beans.etc;

import java.net.*;
import java.sql.*;
import java.util.*;
import com.beans.db.*;



public class Utility {
	
	ConnManager mgr = null;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String date;
	String sql = "";


	
	public static String getHanEncoding(String str){
		if(str==null) return "";
		String result=null;
		
		try{
			result = URLEncoder.encode(str, "ISO-8859-1");
		}catch(Exception e){
			e.printStackTrace();
			result = null;
		}
		return result;
	}
	
	public static String getHanDecode(String str){
		if(str==null)return "";
		String result = null;
		
		try{
			result = URLDecoder.decode(str, "euc-kr");
		}catch (Exception e) {
			result = null;
		}
		
		return result;
	}
	
	//euckr
	public static String getHan(String str){
		if(str == null){return new String("");}
		try{
			str = new String(str.getBytes("ISO-8859-1"),"euc-kr");
		}catch(Exception e){
		}
		return str;
	}
	
	//Iso
	public static String getEuckr(String str){
		if(str == null){return new String("");}
		try{
			str = new String(str.getBytes("euc-kr"),"ISO-8859-1");
		}catch(Exception e){
		}
		return str;
	}
	

	
	public String getDate(Calendar dateIn){
		
		return date;
	}
}
