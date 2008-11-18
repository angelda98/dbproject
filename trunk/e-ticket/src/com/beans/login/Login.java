package com.beans.login;

import java.sql.*;
import java.io.*;
import com.beans.db.*;

public class Login {
	private ConnManager mgr = null;
	private Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public Login(){
		
	}
	public void close() throws SQLException{
		if(rs!=null){
			rs.close();
		}
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
	
	public boolean validateUser(String userid, String password)throws SQLException{
		mgr = ConnManager.getInstance();
		conn = mgr.GetConnection();
		String query = "select id,pass from member";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		String UserID = null;
		String Password = null;
		while(rs.next()){
			UserID = rs.getString(1).trim();
		    Password = rs.getString(2).trim();
		}
		if((UserID.equals(userid))&&(Password.equals(password))){
			return true;
		}
		return false;
	}
	
}
