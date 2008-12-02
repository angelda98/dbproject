package com.beans.theater;
import java.sql.*;

import com.beans.db.*;
import com.beans.etc.Utility;
public class theater {
	ConnManager mgr = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Utility util = new Utility();
	String sql;
	
	String areaname;
	String theatername;
	String theateraddr;
	String theaterphone;
	String theateropendate;
	String theaterimage;
/*	
	public void setAreaname(String areaname){
		this.areaname = util.getHan(areaname);
	}
*/
	public void setTheatername(String theatername){
		this.theatername = theatername;
	}
/*	
	public void setTheateraddr(String theateraddr){
		this.theateraddr = theateraddr;
	}
	
	public void setTheaterphone(String theaterphone){
		this.theaterphone = theaterphone;
	}
	
	public void setTheateropendate(String theateropendate){
		this.theateropendate = theateropendate;
	}
	
	public void setTheaterimage(String theaterimage){
		this.theaterimage = theaterimage;
	}
*/
	public String getAreaname(){
		return areaname;
	}
	
	public String getTheatername(){
		return theatername;
	}
	
	public String getTheateraddr(){
		return theateraddr;
	}
	
	public String getTheaterphone(){
		return theaterphone;
	}
	public String getTheateropendate(){
		return theateropendate;
	}
	public String getTheaterimage(){
		return theaterimage;
	}
	
	public boolean TheaterInfo() throws SQLException{
		try{
			sql = "select areaname, theatername, theateraddr, theaterphone, theateropendate, theaterimage from area a, theater t where t.areacode(+)=a.areacode and t.theatername= ?";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println(theatername);
			pstmt.setString(1, theatername);
			rs = pstmt.executeQuery();
			rs.next();
			theatername = rs.getString("theatername");
			theateraddr = rs.getString("theateraddr");
			theaterphone = rs.getString("theaterphone");
			theateropendate = rs.getString("theateropendate");
			theaterimage = rs.getString("theaterimage");
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		finally{
			close();
		}
	}
	
	public ResultSet Theatername(String area){
		try{
			sql = "select theatername from theater t, area a where t.areacode(+)=a.areacode and a.areaname=?";
		
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
		 	pstmt.setString(1,area);
 	    	rs = pstmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
}
