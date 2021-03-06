<%@page import="Model.Student"%>
<%@page import="Model.Professor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            width:1350px; 
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
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2,Database Systems, Copyrights Reserved </p></div>
        </div>

<br>
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
                <th class="tg-yw4l"> Select Grade</th>
                <th class="tg-yw4l"> Grant Grade</th>
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
                 
            %>
            <form id="addCourseSubmit" action="CourseController" method="get">
            <tr>
                <td class="tg-yw5l"><input type="hidden" name="courseid" value=<%=courseId%>><%=courseId%></td>
                <td class="tg-yw5l"><%=cName%></td>
                <td class="tg-yw5l"><input type="hidden" name= "stuid" value=<%=stuID%>><%=stuID%></td>
                <td class="tg-yw5l"><%=stuFName%></td>
                <td class="tg-yw5l"><%=stuLName%></td>
                <td class="tg-yw5l">
                    <select name="grade"> 
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="F">F</option>
                    </select>
                </td>
                <td>

                                       <input type="hidden" name="action" value="profgrantsgrade">
                                       <button type="submit" class = "chcktbl" /> Grade </td>
            </tr>
            </form>
            
            <%}}%>
            </table>
      
            <div id="login">
                <a href="ProfessorHome.jsp">
                    <p><input type="button" value="Home"></p>
                </a>
            </div>
       
    </center>

</body>
</html>