<%-- 
   Document   : ViewCourses
   Created on : 29 Nov, 2015, 11:46:05 PM
   Author     : admin
--%>

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
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2,Database Systems, Copyrights Reserved </p></div>
        </div>

       <h1>College Information System</h1>
       <p>
           <h2>Student Registered Courses</h2>
   <center>
       <br><br><br>

       <table align="center" class="tg">

           <tr>

               <th class="tg-yw4l">Course ID </th>
               <th class="tg-yw4l">Course Name</th>
               <th class="tg-yw4l">Credits</th>
               <th class="tg-yw4l">Course Description</th>
               <th class="tg-yw4l">Professor First Name</th>
               <th class="tg-yw4l">Professor Last Name</th>
           </tr>
 <%
       List<Course> studentViewCourse = (List<Course>) request.getAttribute("theViewCourse");
       
               
       if (studentViewCourse != null) {
                       int size = studentViewCourse.size();
                       for (int i = 0; i < size; i++) {
                           String courseId = studentViewCourse.get(i).getC_Id();
                           String courseName = studentViewCourse.get(i).getC_Name();
                           String credits = studentViewCourse.get(i).getC_Credits();
                           String courseDescription = studentViewCourse.get(i).getC_Desc();
                           String professorFirstName = studentViewCourse.get(i).getP_FirstName();
                           String professorLastName = studentViewCourse.get(i).getP_LastName();

               %>
           <tr>
               <td class="tg-yw5l"><%=courseId%></td>
               <td class="tg-yw5l"><%=courseName%></td>
               <td class="tg-yw5l"><%=credits%></td>
               <td class="tg-yw5l"><%=courseDescription%></td>
               <td class="tg-yw5l"><%=professorFirstName%></td>
               <td class="tg-yw5l"><%=professorLastName%></td>
           </tr>
           <%} }%>
       </table>
       
           <div id="login">
               <a href="CourseRegistration.jsp">
               <center>    <p><input type="button" value="Home"></p></center>
               </a>
           </div>
      
   </center>

</body>
</html>