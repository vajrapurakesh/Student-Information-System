<%-- 
    Document   : ProfessorAddCourse
    Created on : 30 Nov, 2015, 1:39:53 AM
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
            height:4%;
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
       <h2>List of Courses Available in your Department</h2>
   <b><h3>Select Courses to Add</h3></b>


<table align="center" class="tg">

<tr>

<th class="tg-yw4l">Course Id </th>
<th class="tg-yw4l">Course Name</th>
<th class="tg-yw4l">Course Description</th>
<th class="tg-yw4l">Course Credits</th>
<th class="tg-yw4l">Classroom</th>
<th class="tg-yw4l">Maximum Seats</th>
<th class="tg-yw4l">Add Course</th>
</tr>

<%
                               List<Course> profViewAddCourse = (List<Course>) request.getAttribute("profViewAddCourse");

                               if (profViewAddCourse != null) {
                                   int size = profViewAddCourse.size();
                                   for (int i = 0; i < size; i++) {
                                       String courseId = profViewAddCourse.get(i).getC_Id();
                                       String courseName = profViewAddCourse.get(i).getC_Name();
                                       String credits = profViewAddCourse.get(i).getC_Credits();
                                       String courseDescription = profViewAddCourse.get(i).getC_Desc();
                                       

                           %>
 <form id="addCourseSubmit" action="CourseController" method="get">
                               <tr>
                                   <td class="tg-yw5l"><input type="hidden" name="courseid" value=<%=courseId%>><%=courseId%></td>
                                   <td class="tg-yw5l"><%=courseName%></td>
                                   <td class="tg-yw5l"><%=credits%></td>
                                   <td class="tg-yw5l"><%=courseDescription%></td>
                                   <td class="tg-yw5l">
                                       
                                       <select name="classroom" ><option value="WDWRD 130">WDWRD 130</option>
                                           <option value="KENNEDY 236">KENNEDY 236</option>
                                           <option value="CHHS 501">CHHS 501</option>
                                           <option value="FRIDAY 101">FRIDAY 101</option>
                                           <option value="CAMERON 143">CAMERON 143</option>
                                           <option value="ONLINE">ONLINE</option>
                                       </select>
                                   </td>
                                   <td class="tg-yw5l">
                                       
                                       <select name ="maxseats"><option value="60">60</option>
                                           <option value="90">90</option>
                                           <option value="120">120</option>
                                           <option value="180">180</option>
                                           
                                       </select>
                                   </td>
                                   <td>

                                       <input type="hidden" name="action" value="profSubmitCourse">
                                       <button type="submit" class = "chcktbl" />Add </td>
                               </tr>
                           </form>
                           <%}
                   }%> </table>
                     
                           <div id="login">
                               <p>
                                   <a href="ProfessorHome.jsp">
                                    <center>   <input type="button" value="Home"></center></p>
                                   </a>
                           </div>
                    
                       </body>
                       </html>
