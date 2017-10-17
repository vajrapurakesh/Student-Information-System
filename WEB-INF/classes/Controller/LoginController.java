/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.LoginDb;
import Model.Professor;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Pradeep
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
            LoginDb login = new LoginDb();
            
            if ("logincheck".equals(action)){
                
                try
                {

                    String role1 = request.getParameter("role");
                    switch (role1) {
                        case "student":
                            {
                                String userName = request.getParameter("Username");
                                String password = request.getParameter("Password");
                                String output1 = login.loginStudent(userName, password);
                               
                                if ("failure".equals(output1) )
                                {
                                    String failOp = "Invalid Credentials";
                                    request.setAttribute("failure",failOp);
                                    getServletContext().getRequestDispatcher("/index.jsp").forward(
                        request, response);  
                                }
                                      else 
                                        { 
                                            //HttpSession session1 = request.getSession();
                                            session.setAttribute("username", userName);
                                            int stuid = Integer.parseInt(output1);
                                            session.setAttribute("sessSid", stuid);
                                          getServletContext().getRequestDispatcher("/StudentHomePage.jsp").forward(
                        request, response);
                                          break;
           }
                                   
                                       
                                
                            }
                        case "faculty":
                            {
                                String userName = request.getParameter("Username");
                                String password = request.getParameter("Password");
                                String output1 =login.loginProfessor(userName, password);
                      if ("failure".equals(output1) )
                                {
                                    String failOp = "Invalid Credentials";
                                    request.setAttribute("failureProf",failOp);
                                    getServletContext().getRequestDispatcher("/index.jsp").forward(
                        request, response);  
                                }
                                else
                                {
                                     session.setAttribute("username", userName);
                                            int pid = Integer.parseInt(output1);
                                            session.setAttribute("sesspid", pid);
                                     getServletContext().getRequestDispatcher("/ProfessorHome.jsp").forward(
                        request, response);
                                     
                                     break;
                                }
                                
                                    
                                                             
                            }
                        
                    }
                    }
                catch (Exception e)
                    {
                System.out.println(e);
            }
                    
                
            }
              if ("logout".equals(action)){
                
                try
                {
                 session.invalidate();
                 request.setAttribute("logout", "Logout Successful!");
                 getServletContext().getRequestDispatcher("/index.jsp").forward(
                        request, response);
                }
                catch(Exception e)
                {
                    
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
