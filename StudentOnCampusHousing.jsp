<%-- 
    Document   : StudentOnCampusHousing
    Created on : Dec 4, 2015, 1:33:54 AM
    Author     : Pradeep
--%>

<%@page import="Model.OnCampusHousing"%>

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
        <h1>College Information System </h1>
        <h2>On-Campus Housing</h2>
        
         <h2>Showing the list of available houses</h2>
    <center>
        <br><br>

        <table class="tg">

            <tr>


                <th class="tg-yw4l">Housing Name</th>
                <th class="tg-yw4l">Housing Type</th>
                <th class="tg-yw4l">Housing Description</th>
                <th class="tg-yw4l">Cost</th>
                <th class="tg-yw4l">Residential Advisor</th>

            </tr>


            <%
                List<OnCampusHousing> ListOnCampus = (List<OnCampusHousing>) request.getAttribute("ListHousing");

                if (ListOnCampus != null) {
                    int size = ListOnCampus.size();
                    for (int i = 0; i < size; i++) {

                        String hName = ListOnCampus.get(i).getH_Name();
                        String hType = ListOnCampus.get(i).getH_Type();
                        String hDesc = ListOnCampus.get(i).getH_Desc();
                        float hCost = ListOnCampus.get(i).getH_Cost();
                        String hAdvisor = ListOnCampus.get(i).getH_ResidentialAdvisor();
            %>



            <tr>


               
                <td class="tg-yw5l"><%=hName%></td>
                <td class="tg-yw5l"><%=hType%></td>
                <td class="tg-yw5l"><%=hDesc%></td>
                <td class="tg-yw5l"><%=hCost%></td>
             
                <td class="tg-yw5l"><%=hAdvisor%></td>

                <%
                          }
                      }%>


            </tr>




        </table>
    </center>
    
     <form>
       <div id="login">
           <p>
                <a href="StudentHomePage.jsp">
             <center>  <input type="button" value="Home"> </center></p>
           </a>
       </div>
   </form>

</body>
</html>
