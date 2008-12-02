package com.beans.movie;

import java.sql.*;

import com.beans.db.*;
import com.beans.etc.Utility;

public class Movie {
	//포스터,줄거리,제목,개봉일,상영시간,등급,영화사,영화상태
	ConnManager mgr = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	Utility util = new Utility();
	
	String sql="";
	String movieposter="";
	String movietitle="";
	String grade="";
	String openingdate="";
	String runtime="";
	String story="";
	String moviestate="";
	String moviecompany="";
	String director="";
	String actor="";
	String genre="";
	String playdate="";
	String theatername="";
		
	public void setMovietitle(String movietitle){
		this.movietitle = util.getHan(movietitle);
	}
	
	public String getDirector(){
		return director;
	}
	
	public String getActor(){
		return actor;
	}
	
	public String getMovieposter(){
		return movieposter;
	}
	
	public String getMovietitle(){
		return movietitle;
	}
	
	public String getGrade(){
		return grade;
	}
	
	public String getOpeningdate(){
		return openingdate;
	}
	
	public String getStory(){
		return story;
	}
	
	public String getMoviestate(){
		return moviestate;
	}
	
	public String getRuntime(){
		return runtime;
	}
	
	public String getGenre(){
		return genre;
	}
	
	public String getPlaydate(){
		return playdate;
	}
	
	public String getTheatername(){
		return theatername;
	}
	
	public String getMoviecompany(){
		if(moviecompany == null){
			return "";
		}
		return moviecompany;
	}
	
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	public ResultSet Moviecount(){
		try{
			String sql="select count(moviecode) from movie"; 
		
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet Movielist(){
		try{
			String sql="select movieposter,movietitle from movie order by moviecode desc";
		
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void MovieDirector() throws SQLException{
		try{
			int count = 0;
			String result;
			sql ="select name from movie_director d, movie m, person p where m.movietitle=? and d.moviecode = m.moviecode and d.personcode = p.personcode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movietitle);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(count!=0){
					director += ",";
				}
				result = rs.getString("name");
				director = director + result;
				count++;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	
	}
	
	public ResultSet Movietitle(String theatername, String playdate) throws SQLException{
		try{
			sql = "select distinct(movietitle), m.moviecode from movieschedule s, theater t, movie m where t.theatercode = s.theatercode(+) and m.moviecode = s.moviecode and theatername=? and playdate=? order by m.moviecode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, theatername);
			pstmt.setString(2, playdate);
			rs = pstmt.executeQuery();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	public void MovieActor() throws SQLException{
		try{
			int count = 0;
			String result;
			sql ="select name from movie m, appearance a, appearanceform f, person p where m.movietitle =? and a.moviecode = m.moviecode and a.personcode = p.personcode and f.appearanceform = '주연'";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movietitle);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(count!=0){
					actor += ",";
				}
				result = rs.getString("name");
				actor = actor+"  "+result;
				count++;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	
	}
	
	public void MovieGenre() throws SQLException{
		try{
			int count = 0;
			String result;
			sql="select genre from genre_movie gm, movie m, genre g where m.movietitle = ? and m.moviecode = gm.moviecode and gm.genrecode = g.genrecode";
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movietitle);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(count!=0){
					genre += ",";
				}
				result = rs.getString("genre");
				genre = genre+"  "+result;
				count++;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	}
	
	public void MovieInfo() throws SQLException{
		try{
			sql="select m.*, s.state, c.moviecompanyname from movie m, moviestate s, moviecompany c where movietitle = ? and m.moviestatecode = s.moviestatecode and m.moviecompanycode = c.moviecompanycode";
;
			
			mgr = ConnManager.getInstance();
			conn = mgr.GetConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movietitle);
			rs = pstmt.executeQuery();
			rs.next();
			
			movieposter = rs.getString("movieposter");
			movietitle = rs.getString("movietitle");
			story = rs.getString("story");
			grade = rs.getString("grade");
			openingdate = rs.getString("openingdate");
			runtime = rs.getString("runtime");
			moviestate = rs.getString("state");
			moviecompany = rs.getString("moviecompanyname");
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	}
}
