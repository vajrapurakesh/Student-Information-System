<%-- 
   Document   : ViewCourses
   Created on : 29 Nov, 2015, 11:46:05 PM
   Author     : admin
--%>

<%@page import="Model.Professor"%>
<%@page import="java.util.List"%>
<%@page import="Model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css' class="font">		

        <link type="text/css" rel="stylesheet" href="Main/NewCss.css"/>

    </head>
    <style> 
        html {
            position: relative;
            min-height: 100%;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;

        }

        li {
            font-family: "Montserrat";
            float: left;
            width: 160px;

        }
        li a{
            display: block;
            padding: 20px 30px;
            text-decoration: none;
            text-align: left;
            background-color: #951B1E;
            width:2500px;
        }
        li a.right{
            text-align: right;
            color: white;
        }


        li a:hover:not(.active) {
            text-decoration: underline;	
            background-color:none;
        }

        li a.active {
            color: white;
        }

        body{
            background-color: #ffffe5;
        }

        #footer {
            background:#951B1E;
            width:100%;
            height:7%;
            position:absolute;
            bottom:0;
            left:0;
            font-family:Montserrat;
            text-align:center;
            color:white;
        }
        a{
            color:white;
            font-family: "Montserrat";
        }


    </style>
    <body>
        <ul>
            <img src="<%=request.getContextPath()%>/Images/logonew.png" id="logo" height="100" width="150" />
            <img src="<%=request.getContextPath()%>/Images/Title.png" id="Title" height="60" width="800" />
        </ul>
        <ul>

            
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            


        </ul>
        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems, Copyrights Reserved </p></div>
        </div>

       <h2>College Information System</h2>
       <p>
           <h2>Student Registered Professor Details</h2>
   <center>
       <br><br><br>

       <table align="center" class="tg">

           <tr>

               <th class="tg-yw4l">Course Name</th>
               <th class="tg-yw4l">Professor First Name</th>
               <th class="tg-yw4l">Professor Last Name</th>
               <th class="tg-yw4l">Professor Designation</th>
               <th class="tg-yw4l">Professor Phone Number</th>
               <th class="tg-yw4l">Professor E-MAIL</th>
           </tr>
             <%
       List<Professor> studentViewProf = (List<Professor>) request.getAttribute("theviewprofessor");
       
               
       if (studentViewProf != null) {
                       int size = studentViewProf.size();
                       for (int i = 0; i < size; i++) {
                           
                           String courseName = studentViewProf.get(i).getC_cName();
                           String professorFirstName = studentViewProf.get(i).getP_FirstName();
                           String professorLastName = studentViewProf.get(i).getP_LastName();
                           String professorDesignation = studentViewProf.get(i).getP_Designation();
                           long  professorPhNum = studentViewProf.get(i).getP_PhoneNumber();
                           String professorEmail = studentViewProf.get(i).getP_Email();
                       
       

               %>
           <tr>
               <td class="tg-yw5l"><%=courseName%></td>
               <td class="tg-yw5l"><%=professorFirstName%></td>
               <td class="tg-yw5l"><%=professorLastName%></td>
               <td class="tg-yw5l"><%=professorDesignation%></td>
               <td class="tg-yw5l"><%=professorPhNum%></td>
               <td class="tg-yw5l"><%=professorEmail%></td>
           </tr>
           <%} }%>
       </table>
       <form>
           <div id="login">
               <a href="CourseRegistration.jsp">
                   <p><input type="button" value="Home"></p>
               </a>
           </div>
       </form>
   </center>

</body>
</html>