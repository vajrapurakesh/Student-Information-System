<%-- 
    Document   : Login
    Created on : 29 Nov, 2015, 8:54:27 PM
    Author     : admin
--%>

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
            width:960px; 
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

            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            <li><a class="right" href="index.jsp"> Login </a></li>


        </ul>
        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2,Database Systems, Copyrights Reserved </p></div>
        </div>

        <h1>College Information System</h1>


        <div id="login">
            <center> 
                <% String addOp = (String) request.getAttribute("RegisterSuccess");
                    String proflogout = (String) request.getAttribute("logout");
                    String loginfail = (String) request.getAttribute("failure");
                    String profloginfail = (String) request.getAttribute("failureProf");
                    if (addOp != null) {
                %><h3><%=addOp%></h3><%

                                             }
                                             if (loginfail != null) {
                %><h3><center><%=loginfail%></center></h3><%

                                              }
                                              if (proflogout != null) {
                        %><h3><%=proflogout%></h3><%

                                             }
                                             if (profloginfail != null) {
                    %><h3><%=profloginfail%></h3><%

                                             }

                    %>
            </center>
            
            <h2>Please login.</h2>
            <fieldset>
                <form id="logincheck" action="LoginController" method="get">
                    <p><font face= Montserrat> Username:</font><input type="text" required name="Username" required/></p>
<p><font face= Montserrat> Password:</font><input type="password" required name="Password" required/></p>
<center><font face= Montserrat><input type="radio" name="role" value="student" required/>Student
<input type="radio" name="role" value="faculty">Faculty </font></center>
                    <input type="hidden" name="action" value="logincheck">
                    <center><p><button type="submit"> Login</button></p> </center></form>
                <center><p><a href="Registers.jsp"><button type="submit"> New User Registration</button></a></p></center>

            </fieldset>
        </div>


    </body>

</html>

