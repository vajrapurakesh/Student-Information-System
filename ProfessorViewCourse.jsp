<%@page import="Model.Student"%>
<%@page import="Model.Professor"%>
<%@page import="java.util.List"%>
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
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems, Copyrights Reserved </p></div>
        </div>

        <h2>College Information System</h2>
    <center>
        <br><br><br>
        <h2>Course and Student Details</h2>
        <br><br><br>

        <table class="tg">

            <tr>

                <th class="tg-yw4l">Course ID </th>
                <th class="tg-yw4l">Course Name</th>
                <th class="tg-yw4l">Student ID</th>
                <th class="tg-yw4l">Student First Name</th>
                <th class="tg-yw4l">Student Last Name</th>
                <th class="tg-yw4l">Student Grade</th>
            </tr>
            
            <%
            List<Student> listObjProf = (List<Student>)request.getAttribute("profviewcourse");
            
            if (listObjProf != null) {
                        int size = listObjProf.size();
                        for (int i = 0; i < size; i++) {
                            String courseId = listObjProf.get(i).getC_Id();
                            String cName =listObjProf.get(i).getC_Name();
                            int stuID = listObjProf.get(i).getS_id();
                            String stuFName = listObjProf.get(i).getS_FirstName();
                            String stuLName = listObjProf.get(i).getS_LastName();
                            String grade = listObjProf.get(i).getC_Grade();
                 
            %>
            <tr>
                <td class="tg-yw5l"><%=courseId%></td>
                <td class="tg-yw5l"><%=cName%></td>
                <td class="tg-yw5l"><%=stuID%></td>
                <td class="tg-yw5l"><%=stuFName%></td>
                <td class="tg-yw5l"><%=stuLName%></td>
                <td class="tg-yw5l"><%=grade%></td>

            </tr>
            
            <%}}%>
            </table>
        <form>
            <div id="login">
                <a href="ProfessorHome.jsp">
                    <p><input type="button" value="Home"></p>
                </a>
            </div>
        </form>
    </center>

</body>
</html>