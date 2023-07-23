package com.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class UserManager 
{
	String url = "jdbc:mysql://localhost:3306/epproject";
	String dbuser = "root";
	String dbpassword = "MANIkanta123!@#"; //MySQL DB Password
	String mysqldriver = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	PreparedStatement stmt = null;	
	public String saveRegistrationData(User U) throws Exception
	{
		Class.forName(mysqldriver);
		con = DriverManager.getConnection(url, dbuser, dbpassword);
		stmt = con.prepareStatement("insert into Users values(?,?,?,?)");	
		stmt.setInt(1,U.getId());
		stmt.setString(2,U.getName());
		stmt.setString(3,U.getEmail() );
		stmt.setString(4,U.getPassword());
		stmt.execute();
		con.close();
		return "Registration successfully";
	}

}
