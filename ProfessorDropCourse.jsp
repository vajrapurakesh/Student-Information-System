<%-- 
    Document   : ProfessorDropCourse
    Created on : 30 Nov, 2015, 1:35:04 AM
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
            height:6%;
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
               <th class="tg-yw4l">Drop Course</th>
        
           </tr>

    <%
    List<Course> ProfessorViewDrop =(List<Course>) request.getAttribute("profViewDropCourse");
      if (ProfessorViewDrop != null) {
                                   int size = ProfessorViewDrop.size();
                                   for (int i = 0; i < size; i++) {

                                       String courseId = ProfessorViewDrop.get(i).getC_Id();
                                       String courseName = ProfessorViewDrop.get(i).getC_Name();
    %>
   <form id="ProfdropCourseSubmit" action="CourseController" method="get">
                               <tr>
                                   <td class="tg-yw5l"><input type="hidden" name="courseid" value=<%=courseId%>><%=courseId%></td>
                                   <td class="tg-yw5l"><input type="hidden" name="coursename" value=<%=courseName%>><%=courseName%></td>
                                         <td> <input type="hidden" name="action" value="profDropCourse">
                                             <button type="submit" class = "chcktbl" />Drop </button></td>
                               </tr>
                           </form>

<%}}%>
</table>


  </center>
   <form>
       <div id="login">
           <p>
                <a href="ProfessorHome.jsp">
              <center> <input type="button" value="Home"/></center> </a></p>
          
       </div>
   </form>
</body>
</html>