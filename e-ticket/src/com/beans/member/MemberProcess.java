package com.beans.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.beans.db.ConnManager;
import com.beans.etc.ServerInfo;
import com.beans.etc.Utility;


public class MemberProcess{
	
	private ConnManager mgr;
	private boolean han_yn = ServerInfo.SET_HAN; 
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String strSQL="";
	Utility util = new Utility();
	
	public MemberProcess(){
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	
	public boolean MemberResult(Member data) throws SQLException {
		try{
			strSQL = "insert into member(id,pass,name,birth,jumin,email,zipcode,addr,addr1,mobile,phone,homepage,job,description) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(strSQL);
			
			pstmt.setString(1,data.getId());
			pstmt.setString(2,data.getPass());
			pstmt.setString(3,data.getName(han_yn));
			pstmt.setString(4,data.getBirth());
			pstmt.setString(5,data.getJumin());
			pstmt.setString(6,data.getEmail());
			pstmt.setString(7,data.getZipcode());
			pstmt.setString(8,data.getAddr(han_yn));
			pstmt.setString(9,data.getAddr1(han_yn));
			pstmt.setString(10,data.getMobile());
			pstmt.setString(11,data.getPhone());
			pstmt.setString(12,data.getHomepage(han_yn));
			pstmt.setString(13,data.getJob(han_yn));
			pstmt.setString(14,data.getDescription(han_yn));
			
			pstmt.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close();
		}
		return false;
	}
	
	public void MemberInfo(Member data) throws SQLException{
		try{
			strSQL = "select * from member where id = '"+ data.getId() +"'";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strSQL);
			
			if(rs.next()){
				data.setId(rs.getString(1));
				data.setPass(rs.getString(2));
				data.setName(rs.getString(3));
				data.setBirth(rs.getString(4));
				data.setJumin(rs.getString(5));
				data.setEmail(rs.getString(6));
				data.setZipcode(rs.getString(7));
				data.setAddr(rs.getString(8));
				data.setAddr1(rs.getString(9));
				data.setMobile(rs.getString(10));
				data.setPhone(rs.getString(11));
				data.setHomepage(rs.getString(12));
				data.setJob(rs.getString(13));
				data.setDescription(rs.getString(14));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
	}
	
	public boolean MemberUpdateResult(Member data) throws SQLException {
		try {
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
	
			String strSQL = "update member set pass=?,email=?,zipcode=?,addr=?,addr1=?,mobile=?,phone=?,homepage=?,job=?,description=?";
			strSQL = strSQL + " where id ='"+data.getId()+"'";
			
			pstmt = conn.prepareStatement(strSQL);
			
			pstmt.setString(1,data.getPass());
			System.out.println(data.getPass());
			pstmt.setString(2,data.getEmail());
			pstmt.setString(3,data.getZipcode());
			pstmt.setString(4,data.getAddr(han_yn));
			pstmt.setString(5,data.getAddr1(han_yn));
			pstmt.setString(6,data.getMobile());
			pstmt.setString(7,data.getPhone());
			pstmt.setString(8,data.getHomepage(han_yn));
			pstmt.setString(9,data.getJob(han_yn));
			pstmt.setString(10,data.getDescription(han_yn));
			pstmt.executeUpdate();
			pstmt.close();
				
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close();
		}
		return false;
	}
	
	public boolean getIdcheck(String id) throws SQLException{
		boolean succ = false;
		
		try{
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();

			strSQL  =	"select count(id) from member where id = ? ";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();	
			rs.next();		
			if(rs.getInt(1) < 1) {
				succ  = true;
			}
			if(rs != null) rs.close();				
		}catch(Exception e){
  			e.printStackTrace();
  		}
  		finally{
  			close();
  		}
  		return  succ;
  	}
	
	public boolean MemberDelete(String id) throws SQLException{
		try{
			strSQL = "delete from member where id=?";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		return false;
	}

}
