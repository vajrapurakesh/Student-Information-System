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
        <ul>


            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>



        </ul>
        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems, Copyrights Reserved </p></div>
        </div>


        <h2>College Information System</h2>
        <p>


        <div id="login">

            <% String username = (String) session.getAttribute("username");
                int stuid = (Integer) session.getAttribute("sessSid");
            %>
            <h2>Welcome <%=username%> </h2>
            <fieldset>
                <a href="CourseRegistration.jsp">
                    <center><p><button type="submit"> Course Registration</button>
                        </p></center>
                </a>
                <form id="form2" action="StudentController" method="get">
                    <input type="hidden" name="action" value="HousingAvailability">
                    <center> <p><button type="submit"> Housing Availability</button></p></center> </form>
                <form id="form3" action="StudentController" method="get">
                    <input type="hidden" name="action" value="FinancialAid">
                    <center><p><button type="submit"> View Financial Aid</button></p></center></form>

                <form id="form1" action="CourseController" method="get">
                    <p> <input type="hidden" name = "action" value="viewmyprofile">
                    <center><button type="sumbit">VIEW MY PROFILE</button></center>
                    </p> </form>  
                <form id="logout" action ="LoginController" method="get">
                    <center> <input type="hidden" name="action" value="logout">
                        <p><button type="submit">Logout</button></p></center>
                </form>

            </fieldset>


        </div>
    </body>
</html>