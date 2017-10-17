
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

        <link type="text/css" rel="stylesheet" href="Main/UpdateCss.css"/>

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

        <h1>College Information System</h1>
        <p>
        <h2>My Profile</h2>

        <br><br><br>

        <table align="center" class="tg" width="500">

            <tr>

                <th class="tg-yw4l">My First Name </th>
                <th class="tg-yw4l">My Last Name</th>

                <th class="tg-yw4l">My Email </th>
                <th class="tg-yw4l">My Phone </th>
                <th class="tg-yw4l">My Address </th>

                <th class="tg-yw4l">My User Name</th>
                <th class="tg-yw4l">My Password</th>
            </tr>
            <%
                Student studentObject = (Student) request.getAttribute("stuupviewprofile");

                long sId = studentObject.getS_id();
                String address = studentObject.getS_Address();
                String dob = studentObject.getS_BirthDate();
                String eMail = studentObject.getS_Email();
                String firstName = studentObject.getS_FirstName();
                float sGpa = studentObject.getS_Gpa();
                String lastName = studentObject.getS_LastName();
                String password = studentObject.getS_Password();
                long phNum = studentObject.getS_PhoneNumber();
                String userName = studentObject.getS_UserName();

            %>
            <form id="updateprof" action="CourseController" method="get">
                <tr>
                    <td class="tg-yw5l"><input type = "text" name = "firstName" value=<%=firstName%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "lastName" value=<%=lastName%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "eMail" value=<%=eMail%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "phNum" value=<%=phNum%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "address" value=<%=address%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "userName" value=<%=userName%>></td>
                    <td class="tg-yw5l"><input type = "text" name = "password" value=<%=password%>></td>
                </tr>

        </table>

        <div id="login">
            <a href="StudentHomePage.jsp">
                <p><input type="button" value="Home">
                    <input type="hidden" name = "action" value="Saveprofile" ><button type ="submit">Save</button></p>
            </a>
        </div>
    </form>

</body>
</html>