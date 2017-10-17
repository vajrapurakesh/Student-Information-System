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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class CourseDb {
    int s_Id; // to be fetched from session variable
    
    
    
  public List<Course> studentViewCourse(int s_Id) throws IOException, SQLException, ClassNotFoundException
   {
       
   JdbcConnection jdbc = new JdbcConnection();
   
   String sql="SELECT B.C_ID as C_ID ,B.C_NAME AS C_NAME ,B.C_CREDITS AS C_CREDITS,B.C_DESC AS C_DESC,D.P_FIRSTNAME AS P_FIRSTNAME,D.P_LASTNAME AS P_LASTNAME FROM REGISTERS AS A INNER JOIN COURSE AS B ON A.C_ID =B.C_ID INNER JOIN TEACHES C ON B.C_ID= C.C_ID INNER JOIN PROFESSOR D ON C.P_ID = D.P_ID INNER JOIN HAS E ON E.P_ID = D.P_ID AND E.S_ID = A.S_ID and e.c_id = b.c_id WHERE A.S_ID="+s_Id;
   Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
           ResultSet q =  stmt.executeQuery(sql);
   List<Course> courseListObject = new ArrayList<Course>();
   
   try
   {
   
   
       while(q.next())
   {
       Course courseObject = new Course();
    String cId;
    cId = q.getString("C_ID");
    courseObject.setC_Id(cId);
       String cName;
    cName = q.getString("C_NAME");
    courseObject.setC_Name(cName);
    
     String cCredits;
    cCredits = q.getString("C_CREDITS");
    courseObject.setC_Credits(cCredits);
    
     String cDesc;
    cDesc = q.getString("C_DESC");
    courseObject.setC_Desc(cDesc);
    
    String pFirstName;
    pFirstName = q.getString("P_FIRSTNAME");
    courseObject.setP_FirstName(pFirstName);
    String pLastName;
    pLastName = q.getString("P_LASTNAME");
    courseObject.setP_LastName(pLastName);
    courseListObject.add(courseObject);
    
   }
       
   }
   catch(Exception e)
           {
               System.out.println(e);
           }
    con.close();
   return courseListObject;
   }
   /* public void studentAddCourse(List<Course> courseObject) throws IOException, SQLException
    {
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
              
        
         for( int i=0; i< courseObject.size();i++)
         {
             Course course =  courseObject.get(i);             
             String cId = course.getC_Id();
             String semester = course.getR_Semester();
             int pId = course.getP_Id();
              String sql1 = " INSERT INTO REGISTERS VALUES ("+s_Id+",'"+cId+"',CURDATE(),NULL,NULL,'"+semester+"')";
             String sql2 = " INSERT INTO HAS VALUES ("+s_Id+","+pId+")";
             stmt.executeQuery(sql1);
             stmt.executeQuery(sql2);
             con.close();
         }
         
    }*/
    
   public List<Course> studentViewAddCourse(int s_id) throws IOException, SQLException
   {
       JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
        List<Course> courseListObject = new ArrayList<Course>();     
       String sql = "SELECT O.C_ID AS C_ID, C.C_NAME as C_NAME, C.C_CREDITS, C.C_DESC,P.P_ID,P.P_FIRSTNAME,P.P_LASTNAME FROM STUDENT S INNER JOIN MAJORS M on M.S_ID=S.S_ID INNER JOIN offers O on O.D_ID = M.D_ID INNER JOIN COURSE C ON C.C_ID = O.C_ID INNER JOIN TEACHES T ON T.C_ID= C.C_ID INNER JOIN PROFESSOR P on P.P_ID=T.P_ID  WHERE S.S_ID="+s_id+" and C.C_ID NOT IN (SELECT C_ID FROM REGISTERS WHERE S_ID="+s_id+")  ";
       ResultSet q = stmt.executeQuery(sql);
       
       while(q.next())
               {
                   Course courseObject = new Course();
                   String cId = q.getString("C_ID");
                   String cName = q.getString("C_NAME");
                   String cDesc = q.getString("C_DESC");
                   String cCredits = q.getString("C_CREDITS");
                   int pId = q.getInt("P_ID");
                   String pFirstName = q.getString("P_FIRSTNAME");
                   String pLastName = q.getString("P_LASTNAME");
                   courseObject.setC_Credits(cCredits);
                   courseObject.setC_Desc(cDesc);
                   courseObject.setC_Id(cId);
                   courseObject.setC_Name(cName);
                   courseObject.setP_FirstName(pFirstName);
                   courseObject.setP_LastName(pLastName);
                   courseObject.setP_Id(pId);
                   courseListObject.add(courseObject);
               }
       con.close();
       return courseListObject;
        
   }
    
    
    
    
  public String studentAddCourse(int s_id,int p_id,String c_id,String semester) throws IOException, SQLException
   {
       JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
       Statement stmt = con.createStatement();
       String countSql = "SELECT COUNT(1) AS TOTAL FROM REGISTERS WHERE S_ID = "+s_id; 
       ResultSet rst = stmt.executeQuery(countSql);
       rst.next();
       int count  = rst.getInt("TOTAL");
       if(count<3)
       {
       String sql1 = " INSERT INTO REGISTERS VALUES ("+s_id+",'"+c_id+"',CURDATE(),NULL,NULL,'"+semester+"')";
       String sql2 = " INSERT INTO HAS VALUES ("+s_id+","+p_id+",'"+c_id+"')";
       stmt.execute(sql1);
        stmt.execute(sql2);
      
            con.close(); 
       return "Course Added Successfully";      
       
       }
       return "Sorry !! Maximum Number of Courses  = 3";
   }
    
    public List<Course> studentViewDropCourse(int s_Id) throws IOException, SQLException, ClassNotFoundException
   {
       
   JdbcConnection jdbc = new JdbcConnection();
   this.s_Id= s_Id;
   String sql="SELECT B.C_ID as C_ID ,B.C_NAME AS C_NAME ,B.C_CREDITS AS C_CREDITS,B.C_DESC AS C_DESC,D.P_ID as P_ID,D.P_FIRSTNAME AS P_FIRSTNAME,D.P_LASTNAME AS P_LASTNAME FROM REGISTERS AS A INNER JOIN COURSE AS B ON A.C_ID =B.C_ID INNER JOIN TEACHES C ON B.C_ID= C.C_ID INNER JOIN PROFESSOR D ON C.P_ID = D.P_ID INNER JOIN HAS E ON E.P_ID = D.P_ID AND E.S_ID = A.S_ID  and e.c_id =b.c_id WHERE A.S_ID="+s_Id;
   Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
           ResultSet q =  stmt.executeQuery(sql);
   List<Course> courseListObject = new ArrayList<Course>();
   
   try
   {
   
   
       while(q.next())
   {
       Course courseObject = new Course();
    String cId;
    cId = q.getString("C_ID");
    courseObject.setC_Id(cId);
       String cName;
    cName = q.getString("C_NAME");
    courseObject.setC_Name(cName);
    
     String cCredits;
    cCredits = q.getString("C_CREDITS");
    courseObject.setC_Credits(cCredits);
    
     String cDesc;
    cDesc = q.getString("C_DESC");
    courseObject.setC_Desc(cDesc);
    
    int pId;
    pId = q.getInt("P_ID");
    courseObject.setP_Id(pId);
    
    String pFirstName;
    pFirstName = q.getString("P_FIRSTNAME");
    courseObject.setP_FirstName(pFirstName);
    String pLastName;
    pLastName = q.getString("P_LASTNAME");
    courseObject.setP_LastName(pLastName);
    courseListObject.add(courseObject);
    
   }
       
   }
   catch(Exception e)
           {
               System.out.println(e);
           }
    con.close();
   return courseListObject;
   }
    
    
   public String studentDropCourse (int s_id,String courseId, int pId) throws IOException, SQLException
   {
       JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
        
         
            String sql1 = " DELETE FROM REGISTERS WHERE S_ID ="+s_id+" AND C_ID='"+courseId+"'";
            String sql2= "DELETE H.* FROM HAS H,PROFESSOR P,TEACHES T,COURSE C WHERE H.S_ID ="+s_id+" AND H.P_ID = P.P_ID AND P.P_ID =T.P_ID AND  T.C_ID = C.C_ID AND H.C_ID=C.C_ID AND C.C_ID='"+courseId+"'";
            stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            con.close();
            return "Course Dropped Successfully";
        
   }
    
    public List<Book> viewBookDetails() throws IOException, SQLException
    {
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
             
        List<Book> bookListObject = new ArrayList<Book>();
        String sql = "SELECT C_NAME, B.B_ISBN  AS B_ISBN,B_BookName ,B_Author,B_Desc,B_Edition,B_Publisher FROM COURSE C INNER JOIN USES U ON C.C_ID = U.C_ID INNER JOIN BOOK B ON B.B_ISBN=U.B_ISBN";
        try
        {
        ResultSet q = stmt.executeQuery(sql);
        
        while (q.next())
        {
           Book bookObject = new Book();
           String cName = q.getString("C_NAME");
           String bIsbn = q.getString("B_ISBN");
           String bBookName = q.getString("B_BookName");
           String bAuthor = q.getString("B_Author");
           String bDesc = q.getString("B_Desc");
           String bEdition = q.getString("B_Edition");
           String bPublisher = q.getString("B_Publisher");
           bookObject.setB_Isbn(bIsbn);
           bookObject.setB_Desc(bDesc);
           bookObject.setB_BookName(bBookName);
           bookObject.setB_Author(bAuthor);
           bookObject.setB_Edition(bEdition);
           bookObject.setB_Publisher(bPublisher);
           bookObject.setB_cName(cName);
           bookListObject.add(bookObject);
           
        }

        }
        
        catch (Exception e)
        {
            System.out.println(e);
        }
        con.close();
    return bookListObject;
    }
    
   public List<Professor> professorDetails(int s_Id) throws IOException, SQLException
  {

      JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
// s_id to be fetched from session variable
      
       List<Professor> professorDetail = new ArrayList<Professor>();
       String sql = "SELECT  D.C_NAME as C_NAME,P_FIRSTNAME as P_FIRSTNAME,P_LASTNAME as P_LASTNAME,P_DESIGNATION as P_DESIGNATION,P_PHONENUMBER as P_PHONENUMBER,P_EMAIL as P_EMAIL FROM PROFESSOR A INNER JOIN HAS B ON A.P_ID =B.P_ID INNER JOIN TEACHES C ON A.P_ID = C.P_ID INNER JOIN COURSE D ON C.C_ID =D.C_ID  and d.c_id = b.c_id WHERE B.S_ID ="+s_Id;
       ResultSet q = stmt.executeQuery(sql);
       
       try
       {
           
       
       while(q.next())
       {
           Professor professorObject = new Professor();
           
           String cName= q.getString("C_NAME");
           String pFirstName = q.getString("P_FIRSTNAME");
           String pLastName = q.getString("P_LASTNAME");
           String pDesignation =q.getString("P_DESIGNATION");
           long pPhoneNumber = q.getLong("P_PHONENUMBER");
           String pEmail= q.getString("P_EMAIL");
          
           professorObject.setC_cName(cName);
           professorObject.setP_FirstName(pFirstName);
           professorObject.setP_LastName(pLastName);
           professorObject.setP_Designation(pDesignation);
           professorObject.setP_PhoneNumber(pPhoneNumber);
           professorObject.setP_Email(pEmail);   
           professorDetail.add(professorObject);
       }
       }
       catch(Exception e)
   {
       System.out.println(e);
  }
       con.close();
       return professorDetail;
  }
}
