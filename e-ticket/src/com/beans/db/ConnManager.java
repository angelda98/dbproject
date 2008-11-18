package com.beans.db;

import java.sql.*;
import java.util.*;
import java.io.*;

public class ConnManager {
	static ConnManager inst;
	Connection conn = null;
	public static ConnManager getInstance(){
		if(inst==null){
			inst = new ConnManager();
		}
		return inst;
	}
	
	public ConnManager(){
		
	}
	
	public Connection GetConnection() throws SQLException{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		}catch(InstantiationException e){
			e.printStackTrace();
		}catch(IllegalAccessException e){
			e.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
//		String id = "cgy77777";
	//	String ps = "cgy30120";
		
		try{
			conn = DriverManager.getConnection(url,"cgy77777","cgy30120");
			return conn;
		}catch(SQLException e){
			e.printStackTrace();		
		}
		
		return null;
	}
}
