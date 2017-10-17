/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Jant
 */
public class LoginDb {



    public String loginStudent(String userName,String passWord ) throws SQLException, SQLException, IOException {
  JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
         String output = "0";
        try {
            
            String s1 = "select s_id, s_UserName, s_Password from student where S_UserName='"+ userName +"' and S_Password='"+passWord+"'";
            ResultSet q = stmt.executeQuery(s1);
            if (!q.next())
                output ="failure";
                
                else{
            String usr = q.getString("s_UserName");
            String pwd = q.getString("s_Password");
            int sid = q.getInt("s_id");
           
            if (userName.equals(usr) && passWord.equals(pwd))
            { 
                 output = Integer.toString(sid) ;
            }
            
            
            }
            
            }
         
        catch (SQLException sqlex) 
        {
            System.out.println("SQL Exception !! " + sqlex);
        } catch (Exception ex) {
            System.out.println("Exception has occured " + ex);
        }
        return output;
    }
    public String loginProfessor(String userName1,String passWord1 )throws SQLException, SQLException {
         String output1 = "0";
         try {
            JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
    
     String s2 = "select p_id,p_UserName,p_Password from Professor where p_UserName='"+ userName1 +"' and p_Password='"+passWord1+"'";
            ResultSet q1 = stmt.executeQuery(s2);
             if (!q1.next())
             {
                output1 ="failure";
             }
                else
             {
            String usrp = q1.getString("p_UserName");
            String pwdp = q1.getString("p_Password");
            int pid = q1.getInt("p_id");
           
            if (userName1.equals(usrp) && passWord1.equals(pwdp))
            { 
                  output1 = Integer.toString(pid);
            }
            
 
            
            }
            
}
         catch (SQLException sqlex) 
        {
            System.out.println("SQL Exception !! " + sqlex);
        } catch (Exception ex) {
            System.out.println("Exception has occured " + ex);
        }
        return output1;
}
}