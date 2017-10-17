<%-- 
    Document   : StudentHome
    Created on : 29 Nov, 2015, 11:20:10 PM
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

            <div id="login">
                <h2>Welcome Professor&nbsp;<% String puser=(String)session.getAttribute("username");%><%=puser%> </h2>
                <center> 
               <% 
               String addProfOp = (String) request.getAttribute("profAddCourse");
                String dropProfOp = (String) request.getAttribute("theDropCourse");
                String gradeStufOp = (String) request.getAttribute("profgrantsgrade");                
               if(addProfOp !=null)
               {
                   %><h3><%=addProfOp%></h3><%
               }
                if (dropProfOp !=null)
               {
                   %><h3><%=dropProfOp%></h3><%
               }
                if (gradeStufOp !=null)
               {
                   %><h3><%=gradeStufOp%></h3><%
               }
               %> 
                </center>
                <fieldset>
                    <form id="professorviewcourse" action="StudentController" method="get">
                        <p> <center><input type="hidden" name="action" value="ViewCoursesandStudents">
                            <button type="submit"> view students</button></center></p>
                      
                    </form>
                    
                    <form id="professorgradestudents" action ="CourseController" method="get">
                    <center> <input type="hidden" name="action" value="professorviewgradestudents">
                         <p><button type="submit">Grade Students</button></p></center></form>
                    
                    <form id="ProfessorviewCourse" action ="CourseController" method="get">
                    <center> <input type="hidden" name="action" value="professorViewCourse">
                         <p><button type="submit">View Course</button></p></center>
                            </form>
                    
                    <form id="professorViewAddCourse" action ="CourseController" method="get">
                     <center> <input type="hidden" name="action" value="professorViewAddCourse">
                        <p><button type="submit">Add Course</button></p></center>
                            </form>
                    
                        
                    <form id="ProfessorDropCourse" action ="CourseController" method="get">
                    <center> <input type="hidden" name="action" value="professorViewDropCourse">
                         <p><button type="submit">Drop Course</button></p></center>
                            </form>
                    <form id="logout" action ="LoginController" method="get">
                    <center> <input type="hidden" name="action" value="logout">
                         <p><button type="submit">Logout</button></p></center>
                            </form>
                    
                   
                    
                            
                </fieldset>

            </div>

    </body>

</html>