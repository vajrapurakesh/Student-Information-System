/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Department;
import Model.OnCampusHousing;
import Model.ProfessorDb;
import Model.Student;
import Model.StudentDb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Pradeep
 */
public class StudentController extends HttpServlet {

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
            out.println("<title>Servlet StudentController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudentController at " + request.getContextPath() + "</h1>");
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
        
    if("FinancialAid".equals(action))
    {
        try{
            StudentDb objStudentDb = new StudentDb();
           // int studentId = theStudent.getS_id();
          int student=(Integer)session.getAttribute("sessSid");
            
            float amount = objStudentDb.checkFinancialAid(student);
            request.setAttribute("amount", amount);
            getServletContext().getRequestDispatcher("/StudentFinancialAid.jsp").forward(request,response); 
        }
        catch (SQLException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    if("stuSubmit".equals(action))
    {
        try{
        Department objDept = new Department();
        StudentDb studentdb = new StudentDb();
        String userName=request.getParameter("Username");
        String password =request.getParameter("Password");
        String studentId=request.getParameter("Student_ID");
        String firstName=request.getParameter("First Name");
        String lastName=request.getParameter("Last Name");
        String ugGpa=request.getParameter("UG GPA");
        String eMail=request.getParameter("E-Mail Address");
        String dob = request.getParameter("DateOfBirth");
        String contactAddress=request.getParameter("Contact Address");
         float uggpa = Float.parseFloat(ugGpa);
          int studentid = Integer.parseInt(studentId);
        String phoneNumber=request.getParameter("Phone Number");
        String deptName=request.getParameter("DeptName");
        long  phone = Long.parseLong(phoneNumber);
        Student objStudent = new Student();
        objStudent.setS_UserName(userName);
        objStudent.setS_Gpa(uggpa);
        objStudent.setS_Address(contactAddress);
        objStudent.setS_FirstName(firstName);
        objStudent.setS_LastName(lastName);
        objStudent.setS_Password(password);
       objStudent.setS_PhoneNumber(phone);
        objStudent.setS_id(studentid);
        objStudent.setS_Email(eMail);
        objStudent.setS_BirthDate(dob);
        objDept.setD_Name(deptName);
        StudentDb objStudentDb = new StudentDb();
        //String registersuccess = objStudentDb.insert(objStudent, objDept);
        String output1 = studentdb.insert(objStudent, objDept);
        if("Student Already Exists".equals(output1))
                                {
                                    request.setAttribute("RegisterFailure",output1);
                                     getServletContext().getRequestDispatcher("/Registers.jsp").forward(
                        request, response);
                                }
                                 else 
                                {
                                    request.setAttribute("RegisterSuccess",output1);
                                    getServletContext().getRequestDispatcher("/index.jsp").forward(
                        request, response); 
       // request.setAttribute("RegisterSuccess", registersuccess);
    //     getServletContext().getRequestDispatcher("/index.jsp").forward(
      //                  request, response);
        
    }}
        catch (Exception ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    if("ViewCoursesandStudents".equals(action))
        {
            try{
                 ProfessorDb objProfDb = new ProfessorDb();
                int pid= (Integer)session.getAttribute("sesspid") ;
                //int studentId = theStudent.getS_id();
                //int professorId = 10001;
                List<Student> listObjProf = objProfDb.professorViewCourse(pid);
                
                request.setAttribute("profviewcourse", listObjProf);
                getServletContext().getRequestDispatcher("/ProfessorViewCourse.jsp").forward(
                        request, response);   
            }
            catch (Exception ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
    if("HousingAvailability".equals(action))
        {
            try{
                OnCampusHousing objOnCampusHousing = new OnCampusHousing();
                 StudentDb objStudentDb = new StudentDb();
                 List<OnCampusHousing> ListOnCampusHousing =objStudentDb.housingEnquiry();
                 request.setAttribute("ListHousing", ListOnCampusHousing);
              //  housingEnquiry objhousingEnquiry = new housingEnquiry();
                 
                 getServletContext().getRequestDispatcher("/StudentOnCampusHousing.jsp").forward(
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
