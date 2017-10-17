<%-- 
   Document   : StudentDropCourse
   Created on : 30 Nov, 2015, 1:05:08 AM
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
       <h2>List of Registered Courses</h2>
       <b><h3>Select Courses to Drop</h3></b>

                       <br><br>
       <table align="center" class="tg">

           <tr>

               <th class="tg-yw4l">Course Id </th>
               <th class="tg-yw4l">Course Name</th>
               <th class="tg-yw4l">Credits</th>
               <th class="tg-yw4l">Course Description</th>
               <th class="tg-yw4l">Professor Id</th>
               <th class="tg-yw4l">Professor First Name</th>
               <th class="tg-yw4l">Professor Last Name</th>
               <th class="tg-yw4l"></th>
           </tr>
            <%
               List<Course> courseViewObject = (List<Course>) request.getAttribute("theViewDropCourse");
               if (courseViewObject != null) {
                                   int size = courseViewObject.size();
                                   for (int i = 0; i < size; i++) {
                                       int pId = courseViewObject.get(i).getP_Id();
                                       String courseId = courseViewObject.get(i).getC_Id();
                                       String courseName = courseViewObject.get(i).getC_Name();
                                       String credits = courseViewObject.get(i).getC_Credits();
                                       String courseDescription = courseViewObject.get(i).getC_Desc();
                                       String professorFirstName = courseViewObject.get(i).getP_FirstName();
                                       String professorLastName = courseViewObject.get(i).getP_LastName();
           
           %>
           <form id="dropCourseSubmit" action="CourseController" method="get">
                               <tr>
                                   <td class="tg-yw5l"><input type="hidden" name="courseid" value=<%=courseId%>><%=courseId%></td>
                                   <td class="tg-yw5l"><%=courseName%></td>
                                   <td class="tg-yw5l"><%=credits%></td>
                                   <td class="tg-yw5l"><%=courseDescription%></td>

                                   <td class="tg-yw5l"><input type="hidden" name="professorid" value=<%=pId%>><%=pId%></td>
                                   <td class="tg-yw5l"><%=professorFirstName%></td>
                                   <td class="tg-yw5l"><%=professorLastName%></td>

                                                                       <td>

                                       <input type="hidden" name="action" value="stuDropCourse">
                                       <button type="submit" class = "chcktbl" />Drop </td>
                               </tr>
                           </form>
                                   <%}
                   }%>
       </table>
   </center>
   <form>
       <div id="login">
           <p>
                <a href="CourseRegistration.jsp">
              <center> <input type="button" value="Home"></center></p>
           </a>
       </div>
   </form>
</body>
</html>