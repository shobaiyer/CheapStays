package com.igate.action;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.sql.DriverManager;
import org.hibernate.annotations.Index;

public class CSAction extends ActionSupport {

	/* private static final long serialVersionUID = 1L; */

	private String userId;
	private String password;
	Connection conn;
	public String execute() {
		
			 try{  
				   
				  // String driver="oracle.jdbc.driver.OracleDriver";
				  // Class.forName(driver).newInstance();
				    conn=DriverManager.getConnection("jdbc:oracle:thin:@172.21.17.5:1521:oraten","lab02trg4","lab02oracle");
			 }  catch (SQLException e) {
			      e.printStackTrace();
			   }
				   CallableStatement cstmt = null;
				   try {
				      String SQL = "{call change (?,?)}";
				      cstmt = conn.prepareCall (SQL);
				      cstmt.setString(1,getPassword());
				      cstmt.setString(2,getUserId());
				      //cstmt.registerOutParameter(2,java.sql.Types.INTEGER);
				     cstmt.executeUpdate();
				     
				    /* String bcode=cstmt.getString(2);
				     out.print(bcode);*/
				     
				   }
				   catch (SQLException e) {
				     // e.printStackTrace();
				      
				   }
				   
				   finally {
				      try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				   }
				    
				                 
		return SUCCESS;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "CSAction [userId=" + userId + ", password=" + password + "]";
	}

}