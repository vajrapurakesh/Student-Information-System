/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ProfessorDb {

    int p_id;

   public List<Student> professorViewCourse(int p_id) throws IOException, SQLException {
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
        String sql = "SELECT C.C_ID as C_ID,C.C_NAME as C_NAME, S.S_ID as S_ID ,S.S_FIRSTNAME as S_FIRSTNAME, S.S_LASTNAME as S_LASTNAME, r.R_GRADE as R_GRADE FROM \n"
                + "TEACHES T INNER JOIN COURSE C \n"
                + "ON C.C_ID=T.C_ID \n"
                + "INNER JOIN REGISTERS R \n"
                + "ON C.C_ID=R.C_ID \n"
                + "INNER JOIN STUDENT S \n"
                + "ON S.S_ID=R.S_ID inner join HAS H ON H.C_ID=C.C_ID AND S.S_ID =H.S_ID AND T.P_ID =H.P_ID WHERE T.P_ID=" + p_id;
        ResultSet q = stmt.executeQuery(sql);
        List<Student> studentListObject = new ArrayList<Student>();

        try {
           
            while (q.next()) {
                 Student stuObject = new Student();
                String cId;
                cId = q.getString("C_ID");
                stuObject.setC_Id(cId);
                int sId;
                sId = q.getInt("S_ID");
                stuObject.setS_id(sId);
                String cName;
                cName = q.getString("C_NAME");
                stuObject.setC_Name(cName);
                String sFirstName;
                sFirstName = q.getString("S_FIRSTNAME");
                stuObject.setS_FirstName(sFirstName);
                String sLastName;
                sLastName = q.getString("S_LASTNAME");
                
                stuObject.setS_LastName(sLastName);
                String sGrade;
                sGrade = q.getString("R_GRADE");
                stuObject.setC_Grade(sGrade);
                
                studentListObject.add(stuObject);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return studentListObject;
   }
    public void professorGradesStudentUpdate(List<GradeStudents> gradeStudentsObject) throws IOException, SQLException {
        // pid fetched from session
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();

        for (int i = 0; i < gradeStudentsObject.size(); i++) {
            GradeStudents gradeStudent = gradeStudentsObject.get(i);
            int studentId = gradeStudent.getS_Id();
            String courseId = gradeStudent.getC_Id();
            String grade = gradeStudent.getR_Grade();
            String sql = "UPDATE REGISTERS R SET R.R_Grade='" + grade + "' WHERE R.C_ID='" + courseId + "' AND R.S_ID=" + studentId;
            stmt.executeQuery(sql);
        }

    }
      /*SELECT  C.C_ID AS C_ID, C.C_NAME as C_NAME, C.C_CREDITS, C.C_DESC FROM OFFERS O 
                 INNER JOIN COURSE C ON O.C_ID=C.C_ID
                 INNER JOIN WORKSIN W ON W.D_ID=O.D_ID
                  INNER JOIN PROFESSOR P ON P.P_ID = W.P_ID
                 WHERE P.P_ID = 10005 AND C.C_ID NOT IN (SELECT C_ID FROM TEACHES WHERE P_ID = 10005)
    */
    
    public List<Course> professorViewAddCourse(int p_id) throws IOException, SQLException
   {
       JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
        List<Course> courseListObject = new ArrayList<Course>();     
       String sql = "SELECT  C.C_ID AS C_ID, C.C_NAME as C_NAME, C.C_CREDITS, C.C_DESC FROM OFFERS O \n" +
"                 INNER JOIN COURSE C ON O.C_ID=C.C_ID\n" +
"                 INNER JOIN WORKSIN W ON W.D_ID=O.D_ID\n" +
"                  INNER JOIN PROFESSOR P ON P.P_ID = W.P_ID\n" +
"                 WHERE P.P_ID =" +p_id +" AND C.C_ID NOT IN (SELECT C_ID FROM TEACHES WHERE P_ID =" +p_id+")";
       ResultSet q = stmt.executeQuery(sql);
       
       while(q.next())
               {
                   Course courseObject = new Course();
                   String cId = q.getString("C_ID");
                   String cName = q.getString("C_NAME");
                   String cDesc = q.getString("C_DESC");
                   String cCredits = q.getString("C_CREDITS");
                   courseObject.setC_Credits(cCredits);
                   courseObject.setC_Desc(cDesc);
                   courseObject.setC_Id(cId);
                   courseObject.setC_Name(cName);
                   courseListObject.add(courseObject);
               }
       con.close();
       return courseListObject;
        
   }
    public String profAddCourse(int professorid,String courseId,String classroom,String maxseats) throws IOException, SQLException {
        // pid fetched from session
JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();
         
            String sql = "INSERT INTO TEACHES VALUES (" +professorid+",'"+courseId+"','"+classroom+"','"+maxseats+"')";
            stmt.executeUpdate(sql);
        
return "Course Added Successfully";
    }
    
    public List<Course> professorViewDropCourse(int p_id) throws IOException, SQLException
   {
       JdbcConnection jdbc = new JdbcConnection();
       Connection con=jdbc.executeQuery();
   Statement stmt = con.createStatement();
        List<Course> courseListObject = new ArrayList<Course>();     
       String sql = "select C.C_ID,C.C_NAME from teaches T INNER JOIN COURSE C ON T.C_ID = C.C_ID where P_ID =" +p_id;
       ResultSet q = stmt.executeQuery(sql);
       
       while(q.next())
               {
                   Course courseObject = new Course();
                   String cId = q.getString("C_ID");
                   String cName = q.getString("C_NAME");
                   courseObject.setC_Id(cId);
                   courseObject.setC_Name(cName);
                   courseListObject.add(courseObject);
               }
       con.close();
       return courseListObject;
        
   }
    

    public String professorDropCourse(String courseID, String CourseName, int pId) throws IOException, SQLException {
        // pid fetched from session
        JdbcConnection jdbc = new JdbcConnection();
        Connection con=jdbc.executeQuery();
    Statement stmt = con.createStatement();


            String sql = "DELETE T.* FROM TEACHES T,PROFESSOR P, COURSE C WHERE T.P_ID = " + pId + " AND T.P_ID = P.P_ID AND C.C_ID = T.C_ID AND C.C_ID ='" + courseID + "'";
            stmt.executeUpdate(sql);
            String sql2= "DELETE FROM HAS WHERE P_ID =" + pId + " AND C_ID ='" + courseID + "'";
            stmt.executeUpdate(sql2);
            String sql3 ="DELETE FROM REGISTERS WHERE C_ID ='" + courseID + "'";
            stmt.executeUpdate(sql3);
             con.close();
        return "Course Dropped Successfully";
    }
    
    
    public String profGrantsGrade (String courseid, int stuid,String grade) throws IOException, SQLException
    {
        JdbcConnection jdbc = new JdbcConnection();
        Connection con = jdbc.executeQuery();
        Statement stmt = con.createStatement();
        
        String updateSql= "UPDATE REGISTERS SET R_GRADE = '"+grade+"' WHERE S_ID="+stuid+" AND C_ID = '"+courseid+"'";
        stmt.executeUpdate(updateSql);
       con.close();
       return "Graded Successfully";
    }
}
