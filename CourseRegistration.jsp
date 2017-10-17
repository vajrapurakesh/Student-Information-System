<%-- 
   Document   : CourseRegistration
   Created on : 29 Nov, 2015, 11:27:57 PM
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
            width: 230px;

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
        <form id="logout" action ="LoginController" method="get">
        <ul>

            
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            


        </ul> 
            </form>
        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems, Copyrights Reserved </p></div>
        </div>

       <h2>College Information System</h2>
       <p>
           <div id="login">
                <% String username = (String) session.getAttribute("username");
                    %>
               <h2>Register for Courses Here <%=username%> </h2>
               <fieldset>
                   <center> 
                       <% String addOp = (String) request.getAttribute("theAddCourse");
                       if(addOp!=null)
                           {
                              %><h3><%=addOp%></h3><%
                           
                           }
                       String dropOp = (String) request.getAttribute("theDropCourse");
                       if(dropOp!=null)
                           {
                              %><h3><%=dropOp%></h3><%
                           
                           }
                       
                       %>
                       <form id ="sAddCrsForm" action="CourseController" method="get">
                           
                           <input type="hidden" name="action" value="addcourses">
                           <p><button type="submit"> Add Courses</button></p>
                           
                       </form>
                       
                   <form id="form2" action="CourseController" method="get">
                   <input type="hidden" name="action" value="viewcourses">
                   <p><button type="submit">View Courses</button></p></form>
                   
                       <form id="form3" action="CourseController" method="get">
                           <input type="hidden" name="action" value="dropcourses">
                           <p><button type="submit">Drop Courses</button></p></form>
                
                   
                   <form id="form4" action="CourseController" method="get">
                           <input type="hidden" name="action" value="viewprofessor">
                           <p><button type="submit">View Your Professor Details</button></p></form>
                       
                        <form id="form5" action="CourseController" method="get">
                           <input type="hidden" name="action" value="viewbooks">
                           <p><button type="submit">View Book Details</button></p></form>
                
                   <a href="StudentHomePage.jsp">
                       <p><input type="button" value="Home"></p>
                   </a>
                       </center>
               </fieldset>
           </div>
                        <p><center><b>Students Should Register Before taking up the Courses! </b></center></p>
   </body>

</html>