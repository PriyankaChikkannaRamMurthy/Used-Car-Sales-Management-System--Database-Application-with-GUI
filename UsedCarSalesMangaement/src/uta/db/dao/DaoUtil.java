package uta.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DaoUtil implements StringConstants{
private static DaoUtil util;
	
private DaoUtil(){
		
}

public static DaoUtil getObject() {
	 if(util==null)
		 util=new DaoUtil();
		 return util;
}

public Connection getConnection(){
	System.out.println("Hi");
	Connection con=null;
	try{
		Class.forName(DRIVER);
		con=DriverManager.getConnection(URL, USER, PASSWORD);
	}catch(Exception e){
		e.printStackTrace();
	}
	return con;
}

public void close(Connection con,Statement stmt){
	try{
		if(stmt!=null)
			stmt.close();
		if(con!=null)
			con.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
}
public void close(Connection con,PreparedStatement pstmt){
	try{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
}
public void close(Connection con,Statement stmt,ResultSet rs ){
	try{
		if(stmt!=null)
			stmt.close();
		if(rs!= null)
			rs.close();
		if(con!=null)
			con.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
}
public void close(Connection con,PreparedStatement pstmt,ResultSet rs){
	try{
		if(pstmt!=null)
			pstmt.close();
		if(rs!=null)
			rs.close();
		if(con!=null)
			con.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
}
public static void main(String[] args) {
	System.out.println(new DaoUtil().getConnection());
}

}
