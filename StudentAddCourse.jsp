<%-- 
   Document   : StudentAddCourse
   Created on : 30 Nov, 2015, 1:26:38 AM
   Author     : admin
--%>

<%@page import="Model.Course"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            width: 250px;
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
            height:5%;
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
        </div>       <h2>College Information System</h2>
       <p>
       <h3>List of Courses Available in your Department</h3>
   <b><h3>Select Courses to Add</h3></b>

                       <table align="center" class="tg">

                           <tr>

                               <th class="tg-yw4l">Course Id </th>
                               <th class="tg-yw4l">Course Name</th>
                               <th class="tg-yw4l">Credits</th>
                               <th class="tg-yw4l">Course Description</th>
                               <th class="tg-yw4l">Professor Id</th>
                               <th class="tg-yw4l">Professor First Name</th>
                               <th class="tg-yw4l">Professor Last Name</th>
                               <th class="tg-yw4l">Term(Fall15/Spring16)</th>
                               <th class="tg-yw4l"></th>
                           </tr>
<%
                               List<Course> studentViewAddCourse = (List<Course>) request.getAttribute("theViewAddCourse");

                               if (studentViewAddCourse != null) {
                                   int size = studentViewAddCourse.size();
                                   for (int i = 0; i < size; i++) {
                                       int pId = studentViewAddCourse.get(i).getP_Id();
                                       String courseId = studentViewAddCourse.get(i).getC_Id();
                                       String courseName = studentViewAddCourse.get(i).getC_Name();
                                       String credits = studentViewAddCourse.get(i).getC_Credits();
                                       String courseDescription = studentViewAddCourse.get(i).getC_Desc();
                                       String professorFirstName = studentViewAddCourse.get(i).getP_FirstName();
                                       String professorLastName = studentViewAddCourse.get(i).getP_LastName();

                           %>
                           <form id="addCourseSubmit" action="CourseController" method="get">
                               <tr>
                                   <td class="tg-yw5l"><input type="hidden" name="courseid" value=<%=courseId%>><%=courseId%></td>
                                   <td class="tg-yw5l"><%=courseName%></td>
                                   <td class="tg-yw5l"><%=credits%></td>
                                   <td class="tg-yw5l"><%=courseDescription%></td>

                                   <td class="tg-yw5l"><input type="hidden" name="professorid" value=<%=pId%>><%=pId%></td>
                                   <td class="tg-yw5l"><%=professorFirstName%></td>
                                   <td class="tg-yw5l"><%=professorLastName%></td>

                                   <td class="tg-yw5l">
                                       <select name="semester" >
                                           <option value="Fall15">Fall 2015</option>
                                           <option value="Spring16">Spring 2016</option>
                                       </select>
                                       
                                   </td>
                                   <td>

                                       <input type="hidden" name="action" value="stuSubmitCourse">
                                       <button type="submit" class = "chcktbl" />Add </td>
                               </tr>
                           </form>
                           <%}
                   }%> </table>
                     
                           <div id="login">
                               <p>
                                   <a href="CourseRegistration.jsp">
                                     <center>  <input type="button" value="Home"></center></p>
                                   </a>
                           </div>
                    
                       </body>
                       </html>