/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Jant
 */
public class StudentDb {

    public int s_id;
   // PreparedStatement pstmt;
    
    
    ArrayList<Student> studentlist = new ArrayList<>();
    /* public void insert(int s_id,String s_firstname,String s_lastname,String s_Email,s_Birthdate,s_Address, CustomerID,String ConnectionNumber,String category,String priority, String shortsummary,String DetailedDescription,String TicketStatus,String StatusOfProof)
     */

    public String insert(Student student, Department department) throws IOException, SQLException {

        JdbcConnection jdbc = new JdbcConnection();
            Connection con = jdbc.executeQuery();
            Statement stmt = con.createStatement();
            int studId = 0;
            
            
            int sId = student.getS_id();
            
            String s0 = "SELECT s_id FROM student where s_id = '" +sId + "'";
            ResultSet q0 = stmt.executeQuery(s0);
            
             if(q0.next())
             {
                    
            //studId = q0.getInt("s_id");
              return "Student Already Exists";
            }

               String firstName = student.getS_FirstName();
            String lastName = student.getS_LastName();
            String eMail = student.getS_Email();
            String dOb = student.getS_BirthDate();
            String address = student.getS_Address();
            long phNum = student.getS_PhoneNumber();
            float gpa = student.getS_Gpa();
            String userName = student.getS_UserName();
            String password = student.getS_Password();
            String deptName = department.getD_Name();
            String s7 = "insert into student values("+sId+",'"+firstName+"','"+lastName+"','"+eMail+"','"+dOb+"','"+address+"',"+phNum+","+gpa+",'"+userName+"','"+password+"')";
            stmt.executeUpdate(s7);
     
            String s3 = "select d_ID from department where d_Name ='" + deptName + "'";
            ResultSet q1 = stmt.executeQuery(s3);
            q1.next();
            int depatmentId = q1.getInt("d_ID"); /* function call to get department id from department name*/
            
            String s2 = "insert into majors values("+sId+","+depatmentId+")";
            stmt.executeUpdate(s2);

            String sql_finance ="SELECT F_ID FROM financialaid WHERE F_REQUIREMENTS = "+gpa;
             
              ResultSet q2 = stmt.executeQuery(sql_finance);
              q2.first();
             long  f_id = q2.getLong("F_ID");
            
            //int financeId = fetchFinanceId(financialaid.getF_Id()); /* function call to get financial id from Finance Aid*/

            String s5 = "insert into checks values ("+sId+","+f_id+")";
           stmt.executeUpdate(s5);
           con.close();
            return "Student Registered Successfully";
          }
       
       
    
    /*
     public void update(Student student) {

        try
        {
            String s1 = "update student values set S_ID=?,S_FirstName='',S_LastName='',S_Email='',S_BirthDate=to_date('dd/mm/yyyy'),S_Address='',S_PhoneNumber=?,S_Gpa=?,S_UserName='',S_Password='' where S_ID=''";
            pstmt = con.prepareStatement(s1);
            pstmt.setInt(1, student.getS_id());
            pstmt.setString(2, student.getS_FirstName());
            pstmt.setString(3, student.getS_LastName());
            pstmt.setString(4, student.getS_Email());
            pstmt.setString(5, student.getS_BirthDate());
            pstmt.setString(6, student.getS_Address());
            pstmt.setInt(7, student.getS_PhoneNumber());
            pstmt.setFloat(8, student.getS_Gpa());
            pstmt.setString(9, student.getS_UserName());
            pstmt.setString(10, student.getS_Password());
            studentlist.add(student);
        }
        catch (SQLException sqlex)
        {
            System.out.println("SQL Exception !! " + sqlex);
        }
        catch (Exception ex)
        {
            System.out.println("Exception has occured " + ex);
        }
    }
      */ 

    /*public int fetchDepatmentId(String departmentName) {
        int r = 0;
        int d_ID;
        try {
            JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
    PreparedStatement pstmt ;
            
            pstmt = con.prepareStatement(s3);
            ResultSet q;
            q = stmt.executeQuery(s3);
            d_ID = q.getInt("d_ID");
            r = d_ID;
        } catch (SQLException | IOException ex) {
            System.out.println("Exception has occured " + ex);
        }
        return r;

    }*/

 /*   public int fetchFinanceId(int financeId) {
        int r1 = 0;
        int f_ID;
        try {
            JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
            String s6 = "select f_ID from FinancialAid where f_Requirements ='" + financeId + "'";
            pstmt = con.prepareStatement(s6);
            ResultSet q1;
            q1 = stmt.executeQuery(s6);
            f_ID = q1.getInt("f_ID");
            r1 = f_ID;
        } catch (SQLException | IOException ex) {
            System.out.println("Exception has occured " + ex);
        }
        return r1;
    }*/
    
  
            
public Student viewStudentProfile(int studentId) throws IOException, SQLException{


 Student studentObject = new Student(); 
String sql = "SELECT S_ID,S_FIRSTNAME,S_LASTNAME,S_EMAIL,S_BIRTHDATE,S_ADDRESS,S_PHONENUMBER,S_GPA,S_USERNAME,S_PASSWORD FROM STUDENT WHERE S_ID = "+studentId;
JdbcConnection jdbc = new JdbcConnection();
Connection conxn=jdbc.executeQuery();
   Statement stmt = conxn.createStatement();
           ResultSet q ;
           q =  stmt.executeQuery(sql);
      
          if (q.next())
          {
              
           int sId = q.getInt("S_ID");
           String sFirstName = q.getString("S_FIRSTNAME");
           String sLastName = q.getString("S_LASTNAME");
           String sEmail = q.getString("S_EMAIL");
           String sAddress = q.getString("S_ADDRESS");
           String bDate = q.getString("S_BIRTHDATE");
           long phNum = q.getLong("S_PHONENUMBER");
           float sGpa = q.getFloat("S_GPA");
           String userName = q.getString("S_USERNAME");
           String password = q.getString("S_PASSWORD");
           
           studentObject.setS_id(studentId);
           studentObject.setS_Address(sAddress);
           studentObject.setS_BirthDate(bDate);
           studentObject.setS_Email(sEmail);
           studentObject.setS_FirstName(sFirstName);
           studentObject.setS_Gpa(sGpa);
           studentObject.setS_LastName(sLastName);
           studentObject.setS_Password(password);
           studentObject.setS_PhoneNumber(phNum);
           studentObject.setS_UserName(userName);
           
          }   
//String s1 = "update student values set S_ID=?,S_FirstName='',S_LastName='',S_Email='',S_BirthDate=to_date('dd/mm/yyyy'),S_Address='',S_PhoneNumber=?,S_Gpa=?,S_UserName='',S_Password='' where S_ID=''";
          
       
       conxn.close();
       return studentObject;
   }

public String updateStudentProfile(Student objStudent) throws IOException, SQLException{
    int studentId = objStudent.getS_id();
               String newFirstName =  objStudent.getS_FirstName() ;
               String newLastName = objStudent.getS_LastName() ;
               String newEmail = objStudent.getS_Email() ;
               long newPhnum = objStudent.getS_PhoneNumber() ;
               
               String newAddress = objStudent.getS_Address() ;
               String newUsername = objStudent.getS_UserName() ;
               String newPassword = objStudent.getS_Password() ;
    String sql =  " UPDATE STUDENT SET S_FIRSTNAME = '"+newFirstName+"',S_LASTNAME = '"+newLastName+"',S_EMAIL = '"+newEmail+"',S_ADDRESS = '"+newAddress+"',S_PHONENUMBER = "+newPhnum+",S_USERNAME = '"+newUsername+"', S_PASSWORD = '"+newPassword+"' WHERE S_ID = "+studentId;
  JdbcConnection jdbc = new JdbcConnection();
Connection conxn=jdbc.executeQuery();
   Statement stmt = conxn.createStatement();
           int q =  stmt.executeUpdate(sql);
      
          if (q ==1)
          {
              
           return "Profile Updated Successfully !! ";
          }   
       conxn.close();
       return "Profile Update Unsuccessful";
   }
    /* public List<Student> getUsers() {
        JdbcConnection jdbc = new JdbcConnection();
        String qString = "SELECT p FROM Student p ";
        List<Student> studentsListObject = new ArrayList<Student>();
        try {
            ResultSet q = jdbc.executeQuery(qString);
            while (q.next()) {
                String stuName = q.getString("StudentName");
                Student studentObject = new Student();
                studentObject.setS_FirstName(stuName);
                studentsListObject.add(studentObject);
            }
            if (studentsListObject == null || studentsListObject.isEmpty()) {
                studentsListObject = null;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return studentsListObject;
    }
*/
    public float checkFinancialAid(int s_id) throws SQLException, IOException {
        float amount = 0;
        int s_id1 = s_id;
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
        String sql = "SELECT F_AMOUNTELIGIBLE FROM FINANCIALAID F \n"
                + "INNER JOIN CHECKS C ON F.F_ID = C.F_ID \n"
                + "INNER JOIN STUDENT S ON C.S_ID = S.S_ID \n"
                + "WHERE S.S_ID = " + s_id1;
        try{

            ResultSet q = stmt.executeQuery(sql);
            while (q.next()) {
                amount = q.getFloat("F_AMOUNTELIGIBLE");
            }
        }
        catch(Exception e)
                {
                    System.out.println(e);    
                }
        return amount;

    }

    public List<OnCampusHousing> housingEnquiry() throws IOException, SQLException {
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
        String sql = "SELECT H_NAME, H_TYPE, H_DESC, H_COST, H_RESIDENTIALADVISOR FROM ONCAMPUS_HOUSING WHERE H_STATUS = 'Available'";

        List<OnCampusHousing> onCampusHouse = new ArrayList<OnCampusHousing>();

        try {
            ResultSet q = stmt.executeQuery(sql);
            while (q.next()) {
                OnCampusHousing onCampusHouseObject = new OnCampusHousing();
                String hName;
                hName = q.getString("H_NAME");
                onCampusHouseObject.setH_Name(hName);
                String hType;
                hType = q.getString("H_TYPE");
                onCampusHouseObject.setH_Type(hType);
                String hDesc;
                hDesc = q.getString("H_DESC");
                onCampusHouseObject.setH_Desc(hDesc);
                float hCost;
                hCost = q.getFloat("H_COST");
                onCampusHouseObject.setH_Cost(hCost);
                String hAdvisor;
                hAdvisor = q.getString("H_RESIDENTIALADVISOR");
                onCampusHouseObject.setH_ResidentialAdvisor(hAdvisor);
                onCampusHouse.add(onCampusHouseObject);
            }
            if (onCampusHouse == null || onCampusHouse.isEmpty()) {
                onCampusHouse = null;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return onCampusHouse;
    }
}
