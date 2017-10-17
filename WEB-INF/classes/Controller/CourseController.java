/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class CourseController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        //Student theStudent = (Student) session.getAttribute("theStudent");
  
      if ("viewcourses".equals(action)) {

           try {
               CourseDb objCourseDB = new CourseDb();
               
               //int studentId = theStudent.getS_id();
               //int studentId = 800903704;
               int studentId = (Integer) session.getAttribute("sessSid"); 
               List<Course> studentViewCourse = objCourseDB.studentViewCourse(studentId);
               
               request.setAttribute("theViewCourse", studentViewCourse);
               getServletContext().getRequestDispatcher("/ViewCourses.jsp").forward(
                       request, response);
           } catch (SQLException | ClassNotFoundException ex) {
               Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
        
       if ("addcourses".equals(action))
       {
           try
           {
               CourseDb objCourseDB = new CourseDb();
               //int studentId = 800903704;
               int studentId = (Integer) session.getAttribute("sessSid"); 
               List<Course> studentViewAddCourseObj = objCourseDB.studentViewAddCourse(studentId);
               request.setAttribute("theViewAddCourse",studentViewAddCourseObj);
               getServletContext().getRequestDispatcher("/StudentAddCourse.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
        
        if ("stuSubmitCourse".equals(action))
       {
           try
           {
               String courseId = request.getParameter("courseid");
               String professorId = request.getParameter("professorid");
               String semester = request.getParameter("semester");
               CourseDb objCourseDB = new CourseDb();
               int professorid = Integer.parseInt(professorId);
               int studentId = (Integer) session.getAttribute("sessSid"); 
               String studentAddCourse = objCourseDB.studentAddCourse(studentId, professorid, courseId, semester);
               
               
             request.setAttribute("theAddCourse",studentAddCourse);
               
               getServletContext().getRequestDispatcher("/CourseRegistration.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
        
         if ("dropcourses".equals(action))
       {
           try
           {
               CourseDb objCourseDB = new CourseDb();
               //int studentId = 800903704;
                   int studentId = (Integer) session.getAttribute("sessSid"); 
               List<Course> studentViewCourseObj = objCourseDB.studentViewDropCourse(studentId);
               request.setAttribute("theViewDropCourse",studentViewCourseObj);
               getServletContext().getRequestDispatcher("/StudentDropCourse.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
          if ("stuDropCourse".equals(action))
       {
           try
           {
               CourseDb objCourseDB = new CourseDb();
               //int studentId = 800903704;
                   int studentId = (Integer) session.getAttribute("sessSid"); 
               String courseId = request.getParameter("courseid");
               String pId = request.getParameter("professorid");
               int professorid = Integer.parseInt(pId);
               
               String stuDropCourseReturn = objCourseDB.studentDropCourse(studentId,courseId,professorid);
               request.setAttribute("theDropCourse",stuDropCourseReturn);
               
               getServletContext().getRequestDispatcher("/CourseRegistration.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
          
          if ("viewprofessor".equals(action))
       {
           try
           {
               CourseDb objCourseDB = new CourseDb();
               //int studentId = 800903704;
                   int studentId = (Integer) session.getAttribute("sessSid"); 
               List<Professor> professorListObject = objCourseDB.professorDetails(studentId);
               request.setAttribute("theviewprofessor",professorListObject);
               
               getServletContext().getRequestDispatcher("/ProfessorDetails.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
          
          if ("viewmyprofile".equals(action))
       {
           try
           {
               StudentDb objStudentDb = new StudentDb();
                int studentId = (Integer) session.getAttribute("sessSid"); 
               Student studentObject = objStudentDb.viewStudentProfile(studentId);
               request.setAttribute("stuviewprofile",studentObject);
               
               getServletContext().getRequestDispatcher("/StudentViewsProfile.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
          
          
              if ("updateprofile".equals(action))
       {
           try
           {
               StudentDb objStudentDb = new StudentDb();
               //int studentId = 800903704;
                   int studentId = (Integer) session.getAttribute("sessSid"); 
               Student studentObject = objStudentDb.viewStudentProfile(studentId);
               request.setAttribute("stuupviewprofile",studentObject);
               
               getServletContext().getRequestDispatcher("/StudentUpdatesProfile.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
              
               if ("Saveprofile".equals(action))
       {
           try
           {
               Student objStudent = new Student();
               //int studentId = 800903704;
                   int studentId = (Integer) session.getAttribute("sessSid"); 
               String newFirstName = request.getParameter("firstName");
               String newLastName = request.getParameter("lastName");
               String newEmail = request.getParameter("eMail");
               String newPhnum = request.getParameter("phNum");
               long newPhone = Long.parseLong(newPhnum);
              String newAddress = request.getParameter("address");
               String newUsername = request.getParameter("userName");
               String newPassword = request.getParameter("password");
               objStudent.setS_FirstName(newFirstName);
               objStudent.setS_LastName(newLastName);
               objStudent.setS_Email(newEmail);
               objStudent.setS_PhoneNumber(newPhone);
               objStudent.setS_Address(newAddress);
               objStudent.setS_UserName(newUsername);
               objStudent.setS_Password(newPassword);
               objStudent.setS_id(studentId);
               
               StudentDb objStudentDb = new StudentDb();
               String studentOp = objStudentDb.updateStudentProfile(objStudent);
               request.setAttribute("stuupsaveprof",studentOp);
               
                Student studentObject = objStudentDb.viewStudentProfile(studentId);
               request.setAttribute("stuviewprofile",studentObject);
                getServletContext().getRequestDispatcher("/StudentViewsProfile.jsp").forward(request, response);
                   
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
                if ("professorViewCourse".equals(action))
       {
           try
           {
               ProfessorDb profDb = new ProfessorDb();
               int pid= (Integer)session.getAttribute("sesspid") ;
               //int professorId = 10001;
               List<Course> ProfessorViewDrop = profDb.professorViewDropCourse(pid);
               request.setAttribute("profViewDropCourse",ProfessorViewDrop);
               
               getServletContext().getRequestDispatcher("/ProfessorViewCoursesOnly.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
                if ("professorViewAddCourse".equals(action))
       {
           try
           {
               ProfessorDb profDb = new ProfessorDb();
               int pid= (Integer)session.getAttribute("sesspid") ;
               //int professorId = 10001;
               List<Course> profViewAddCourseObj = profDb.professorViewAddCourse(pid);
               request.setAttribute("profViewAddCourse",profViewAddCourseObj);
               
               getServletContext().getRequestDispatcher("/ProfessorAddCourse.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
                
                
                
                 if ("profSubmitCourse".equals(action))
       {
           try
           {
               ProfessorDb profDb = new ProfessorDb();
               //int professorId = 10001;
                int pid= (Integer)session.getAttribute("sesspid") ;
              String courseId = request.getParameter("courseid");
              String classroom = request.getParameter("classroom");
              String maxseats = request.getParameter("maxseats");
              
               String profAddCourseOp = profDb.profAddCourse(pid,courseId,classroom,maxseats);
               request.setAttribute("profAddCourse",profAddCourseOp);
               getServletContext().getRequestDispatcher("/ProfessorHome.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
                
           if ("professorViewDropCourse".equals(action)) {

           try {
               ProfessorDb objProfDB = new ProfessorDb();
                int pid= (Integer)session.getAttribute("sesspid") ;
               //int studentId = theStudent.getS_id();
               //int p_Id = 10001;
               List<Course> ProfessorViewDrop = objProfDB.professorViewDropCourse(pid);
               
               request.setAttribute("profViewDropCourse", ProfessorViewDrop);
               getServletContext().getRequestDispatcher("/ProfessorDropCourse.jsp").forward(
                       request, response);
           } catch (SQLException ex) {
               Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
            if ("profDropCourse".equals(action))
       {
           try
           {
               ProfessorDb objprofDB = new ProfessorDb();
                 int pid= (Integer)session.getAttribute("sesspid") ;
              // int pid = 10001;
               String courseId = request.getParameter("courseid");
               String CourseName = request.getParameter("coursename");
               
               String profDropCourseReturn = objprofDB.professorDropCourse(courseId,CourseName,pid);
               request.setAttribute("theDropCourse",profDropCourseReturn);
               
               getServletContext().getRequestDispatcher("/ProfessorHome.jsp").forward(request, response);
           }
           catch (Exception e)
           {
               System.out.println(e);
           }
       }
          
            
            if("professorviewgradestudents".equals(action))
        {
            try{
                 ProfessorDb objProfDb = new ProfessorDb();
                  int pid= (Integer)session.getAttribute("sesspid") ;
                //int studentId = theStudent.getS_id();
                //int professorId = 10001;
                List<Student> listObjProf = objProfDb.professorViewCourse(pid);
                
                request.setAttribute("profviewcourse", listObjProf);
                getServletContext().getRequestDispatcher("/ProfessorViewGradeStudents.jsp").forward(
                        request, response);   
            }
            catch (Exception ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
            
            
            
            if("profgrantsgrade".equals(action))
        {
            try{
                 ProfessorDb objProfDb = new ProfessorDb();
                String courseid = request.getParameter("courseid");
                String stuid = request.getParameter("stuid");
                int stu_id = Integer.parseInt(stuid);
                String grade = request.getParameter("grade");
                 //int pid= (Integer)session.getAttribute("sesspid") ;
                //int studentId = theStudent.getS_id();
                //int professorId = 10001;
                String profGrantsGrade = objProfDb.profGrantsGrade(courseid,stu_id,grade);
                
                request.setAttribute("profgrantsgrade", profGrantsGrade);
                getServletContext().getRequestDispatcher("/ProfessorHome.jsp").forward(
                        request, response);   
            }
            catch (Exception ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
              if("viewbooks".equals(action))
        {
            try{
                 CourseDb objCourseDb = new CourseDb();
                
                List<Book> bookObject = objCourseDb.viewBookDetails();
                
                request.setAttribute("viewbooks", bookObject);
                getServletContext().getRequestDispatcher("/StudentViewBooks.jsp").forward(
                        request, response);   
            }
            catch (Exception ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
            
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
