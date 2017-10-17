
<%-- 
   Document   : ViewCourses
   Created on : 29 Nov, 2015, 11:46:05 PM
   Author     : admin
--%>

<%@page import="Model.Student"%>
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
           <h2>My Profile</h2>
   <center>
       <br><br><br>

       <table class="tg">

           <tr>

               <th class="tg-yw4l">My First Name </th>
               <th class="tg-yw4l">My Last Name</th>
               <th class="tg-yw4l">My DOB</th>
               <th class="tg-yw4l">My Email </th>
               <th class="tg-yw4l">My Phone </th>
               <th class="tg-yw4l">My Address </th>
               <th class="tg-yw4l">My GPA</th>
               <th class="tg-yw4l">My User Name</th>
               <th class="tg-yw4l">My Password</th>
           </tr>
             <%
       Student studentObject = (Student) request.getAttribute("stuviewprofile");
        String displayProfileUpdate = (String) request.getAttribute("stuupsaveprof");
        if (displayProfileUpdate != null)
        {
            %><h3><%=displayProfileUpdate%></h3> <%
        }
                       long sId = studentObject.getS_id();
                         String address=  studentObject.getS_Address();
           String dob= studentObject.getS_BirthDate();
           String eMail = studentObject.getS_Email();
           String firstName = studentObject.getS_FirstName();
           float sGpa = studentObject.getS_Gpa();
           String lastName = studentObject.getS_LastName();
           String password = studentObject.getS_Password();
           long phNum = studentObject.getS_PhoneNumber();
           String userName = studentObject.getS_UserName();

               %>
           <tr>
               <td class="tg-yw5l"><%=firstName%></td>
               <td class="tg-yw5l"><%=lastName%></td>
               <td class="tg-yw5l"><%=dob%></td>
               <td class="tg-yw5l"><%=eMail%></td>
               <td class="tg-yw5l"><%=phNum%></td>
               <td class="tg-yw5l"><%=address%></td>
               <td class="tg-yw5l"><%=sGpa%></td>
               <td class="tg-yw5l"><%=userName%></td>
               <td class="tg-yw5l"><%=password%></td>
           </tr>
        
       </table>
       <form id="updateprof" action="CourseController" method="get">
           <div id="login">
               <a href="StudentHomePage.jsp">
                   <p><input type="button" value="Home">
                   <input type="hidden" name = "action" value="updateprofile" ><button type ="submit">Update Profile</button></p>
               </a>
           </div>
       </form>
   </center>

</body>
</html>