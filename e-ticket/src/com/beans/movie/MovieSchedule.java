package com.beans.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.beans.db.ConnManager;
import com.beans.etc.Utility;

public class MovieSchedule {
	String sql="";
	ConnManager mgr = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	Utility util = new Utility();
		
	public ResultSet Scheduleinfo(String searchdate, String theatername){
		try{
			sql = "select movietitle,screenname,runtime,playstarttime from movieschedule s, movie m,theater t, screen c where s.moviecode=m.moviecode(+) and t.theatercode=s.theatercode and c.screencode = s.screencode and playdate=? and theatername=? order by screenname, playstarttime";
		
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
		 	pstmt.setString(1, searchdate);
 	    	pstmt.setString(2, theatername);
 	    	rs = pstmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet ScreenTime(String searchdate, String theatername, String movietitle){
		try{
			sql = "select screenname,runtime,playstarttime,playround from movieschedule s, movie m,theater t, screen c where s.moviecode=m.moviecode(+) and t.theatercode=s.theatercode and c.screencode = s.screencode and playdate=? and theatername=? and movietitle =? order by screenname, playround";
		
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
		 	pstmt.setString(1, searchdate);
 	    	pstmt.setString(2, theatername);
 	    	pstmt.setString(3, movietitle);
 	    	rs = pstmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet Area(){
		try{
			sql = "select * from area";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
}
