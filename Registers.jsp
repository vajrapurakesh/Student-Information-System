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
            a{
                color:white;
                font-family: "Montserrat";
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
                width:100%; 
            }
            li a.right{
                text-align: right;
                color: white;
                width:950px; 
            }


            a:hover {
                text-decoration: underline;
                color: Black;
            }

            a:active {
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
    </head>
    <body>

        <ul>
            <img src="<%=request.getContextPath()%>/Images/logonew.png" id="logo" height="100" width="150" />
            <img src="<%=request.getContextPath()%>/Images/Title.png" id="Title" height="60" width="800" />
        </ul>
        <ul>

            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            <li><a class="right"> Logout </a></li>

        </ul>
        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2,Database Systems Copyrights Reserved </p></div>
        </div>

        <h1>College Information System</h1>
        <div id="login">
            <h2>Student Registration</h2>

            <% String addOp = (String) request.getAttribute("RegisterFailure");
                if (addOp != null) {
            %><h3><%=addOp%></h3><%

                }%>
            <fieldset>
                <form id="studentRegister" action="StudentController" method="get">
                    <p><input type="text" required name="Username" value="Username" onBlur="if (this.value == '')
                                this.value = 'Username'" onFocus="if (this.value == 'Username')
                                            this.value = ''"></p>
                    <p><input type="password" required name="Password" value="Password" onBlur="if (this.value == '')
                                this.value = 'Password'" onFocus="if (this.value == 'Password')
                                            this.value = ''"></p>
                    <p><input type="text" required name="Student_ID" value="Student_ID" pattern="[0-9]{9}" onBlur="if (this.value == '')
                                this.value = 'Student_ID'" onFocus="if (this.value == 'Student_ID')
                                            this.value = ''"></p>
                    <p><input type="text" required name="First Name" value="First Name" onBlur="if (this.value == '')
                                this.value = 'First Name'" onFocus="if (this.value == 'First Name')
                                            this.value = ''"></p>
                    <p><input type="text" required name="Last Name" value="Last Name" onBlur="if (this.value == '')
                                this.value = 'Last Name'" onFocus="if (this.value == 'Last Name')
                                            this.value = ''"></p>

                    <p><font face= Montserrat> UG Gpa: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select name ="UG GPA"> <option name="3.0" value ="3.0">3.0</option>
                            <option name="3.1" value ="3.1">3.1</option>
                            <option name="3.2" value ="3.2">3.2</option>
                            <option name="3.3" value ="3.3">3.3</option>
                            <option name="3.4" value ="3.4">3.4</option>
                            <option name="3.5" value ="3.5">3.5</option>
                            <option name="3.6" value ="3.6">3.6</option>
                            <option name="3.7" value ="3.7">3.7</option>
                            <option name="3.8" value ="3.8">3.8</option>
                            <option name="3.9" value ="3.9">3.9</option>
                            <option name="4.0" value ="4.0">4.0</option></select></p>
                    <p><input type="text" required name="E-Mail Address" value="E-Mail Address" onBlur="if (this.value == '')
                                this.value = 'E-Mail Address'" onFocus="if (this.value == 'E-Mail Address')
                                            this.value = ''"></p>
                    <font face= Montserrat> Date of Birth:</font>&nbsp;&nbsp;&nbsp;<input type="date" required name="DateOfBirth" value="DateOfBirth" onBlur="if (this.value == '')
                                this.value = 'DateOfBirth'" onFocus="if (this.value == 'DateOfBirth')
                                            this.value = ''">
                    <p><input type="text" required name="Contact Address" value="Contact Address" onBlur="if (this.value == '')
                                this.value = 'Contact Address'" onFocus="if (this.value == 'Contact Address')
                                            this.value = ''"></p>
                    <p><input type="text" required name="Phone Number" value="Phone Number" pattern="[0-9]{10}" onBlur="if (this.value == '')
                                this.value = 'Phone Number'" onFocus="if (this.value == 'Phone Number')
                                            this.value = ''"></p>
                    <font face= Montserrat> Department: </font>  <select name ="DeptName"> <option name="Bio Technology" value ="Bio Technology">Bio Technology</option>
                        <option name="Computer Science" value ="Computer Science">Computer Science</option>
                        <option name="Mechanical Engineering" value ="Mechanical Engineering">Mechanical Engineering</option>
                        <option name="Electrical Engineering" value ="Electrical Engineering">Electrical Engineering</option>
                        <option name="Business Management" value ="Business Management">Business Management</option></select>
                    <input type="hidden" name="action" value="stuSubmit">
                    <center><p><button type="submit"> Register</button></p></center>
                </form>

                <center><a href="index.jsp"><p><input type="button" value="Back To Login"></p></a></center>

            </fieldset>
        </div>
    </form>

</body>

</html>

