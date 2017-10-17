/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;

/**
 *
 * @author admin
 */
public class JdbcConnection {

    
    static final String DB_URL = "jdbc:mysql://localhost/coll_infosys_2";
    static final String DB_USER = "root";
    static final String DB_PWD = "tiger";
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    public Connection executeQuery () throws IOException {
    Connection con = null;
        
       
        try 
        {
         Class.forName(JDBC_DRIVER);
         con = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
        }
        
        catch (Exception e) {
            System.out.println(e);
        } 
            return con;
    }
    
    
  
}
