package com.beans.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.beans.db.ConnManager;

public class Ticket {
	int row=0;
	int col=0;
	int totalticket=0;
	int minticket=0;
	int maxticket=0;
	int reservationcode=0;
	int reservationcounet=0;
	
	String sql="";
	ConnManager mgr = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public void setRowCol(int row,int col){
		this.row = row;
		this.col = col;
	}
	
	public int getTotalTicket(){
		return totalticket;
	}
	
	public int getMinTicket(){
		return minticket;
	}
	
	public int getMaxTicket(){
		return maxticket;
	}
	
	public int getRow(){
		return row;
	}
	
	public int getCol(){
		return col;
	}
		
	public int LastestReservationcode() throws SQLException{
		try{
			sql = "select MAX(reservationcode) from reservation";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery(sql);
			rs.next();
			reservationcode = rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
		return reservationcode;
	}
	
	public boolean Reservation_TicketInsert(int reservationcode,int ticketcode) throws SQLException{
		try{
			sql = "insert into reservation_ticket values(?,?)";
			
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservationcode);
			pstmt.setInt(2, ticketcode);
			
			pstmt.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			close();
		}
		return true;
	}
	
	public boolean ReservationInsert(String date,int totalprice,int people,String id) throws SQLException{
		sql = "insert into reservation values(RESERVATION_SEQ.NEXTVAL,?,?,?,?,?)";
		try{
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, people);
			pstmt.setInt(2, totalprice);
			pstmt.setString(3, date);
			pstmt.setString(4, id);
			pstmt.setString(5, "¿œπ›");

			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			close();
		}
		return true;
	}
	
	public boolean TicketChange(int ticketcode) throws SQLException{
		sql = "update ticket set reservation='yes' where ticketcode = ?";
		try{
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,ticketcode);
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			close();
		}
		return true;
	}
	
	public ResultSet TicketResult(String id){
		try{
			sql = "select r.reservationcode,reservationdate,peoplenumber,srow,scol,movietitle,playround,playstarttime,theatername,screenname,playdate from screen c, theater th, reservation_ticket rt, reservation r,ticket t, movie m, movieschedule s where t.schedulecode(+)=s.schedulecode and rt.reservationcode = r.reservationcode and rt.ticketcode=t.ticketcode and m.moviecode=s.moviecode and th.theatercode=s.theatercode and s.screencode = c.screencode and id=? order by reservationcode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet ReservationColum(String theatername, String playdate, String movietitle, String screenname, String playstarttime){
		sql = "select reservation from ticket t, movieschedule s,movie m,theater h,screen c where s.schedulecode=t.schedulecode and s.moviecode=m.moviecode and c.screencode=s.screencode and theatername=? and playdate=? and movietitle=? and screenname=? and playstarttime=? and h.theatercode = s.theatercode  order by ticketcode";
		try {
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theatername);
			pstmt.setString(2, playdate);
			pstmt.setString(3, movietitle);
			pstmt.setString(4, screenname);
			pstmt.setString(5, playstarttime);
			rs = pstmt.executeQuery();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public int ReservationYN(String id) throws SQLException{
		try{
			sql = "select count(reservationcode) from reservation where id=?";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
 	    	rs.next();
 	    	reservationcounet = rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
			return 0;
		}finally{
			close();
		}
		return reservationcounet;
	}
	
	public void TicketCount(String theatername, String playdate, String movietitle, String screenname, String playstarttime) throws SQLException{
		try{
			sql = "select count(ticketcode),Min(ticketcode),Max(ticketcode) from ticket t, movieschedule s,movie m,theater h,screen c where s.schedulecode=t.schedulecode and s.moviecode=m.moviecode and c.screencode=s.screencode and theatername=? and playdate=? and movietitle=? and screenname=? and playstarttime=? and h.theatercode = s.theatercode  order by ticketcode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theatername);
			pstmt.setString(2, playdate);
			pstmt.setString(3, movietitle);
			pstmt.setString(4, screenname);
			pstmt.setString(5, playstarttime);
			
			rs = pstmt.executeQuery();
 	    	rs.next();
 	    	
 	    	totalticket = rs.getInt(1);
 	    	minticket = rs.getInt(2);
 	    	maxticket = rs.getInt(3);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close();
		}
	}
	
	public void SeatInfo(String theatername, String playdate, String movietitle, String screenname, String playstarttime) throws SQLException{
		try {
			sql = "select seatrow,seatcol from movieschedule s, theater t, movie m,screen c,seat st where t.theatercode(+) = s.theatercode and theatername=? and playdate=? and m.moviecode = s.moviecode and movietitle=? and screenname=? and playstarttime=? and c.screencode=s.screencode and st.seatcode=c.seatcode order by schedulecode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theatername);
			pstmt.setString(2, playdate);
			pstmt.setString(3, movietitle);
			pstmt.setString(4, screenname);
			pstmt.setString(5, playstarttime);
			
 	    	rs = pstmt.executeQuery();
 	    	rs.next();
		
			setRowCol(rs.getInt(1),rs.getInt(2));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
}
