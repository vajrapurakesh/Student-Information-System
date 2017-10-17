<%-- 
    Document   : ContactUs
    Created on : 6 Dec, 2015, 2:32:24 PM
    Author     : admin
--%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
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
                width:2500px; 
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
                height:auto;
                position:absolute;
                bottom:0;
                left:0;
                font-family:Montserrat;
                text-align:center;
                color:white;
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
            <li><a>Contact Us</a></li>
            
        </ul>

        <iframe width="100%" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                src="https://maps.google.com/maps?hl=en&q=University of North Carolina at Charlotte&ie=UTF8&t=roadmap&z=6&iwloc=B&output=embed">
        </iframe>
       
        <h3><u><strong>Address </strong></u></h3>
        <h3>University of Carolina<br>
            9721 University Highway <br>
            <strong>Email:</strong> contact@uoc.in <br>
           <strong> Phone:</strong> +1 9600 611 632 / 9677 169 304 <br>
<br><br>
            <font color="red">*Note: For direct enquiries, we will be available only on Sat & Sun. Please call us before you come directly.
            For phone enquiries we will be available 24 x 7.</font>
        </h3>

        <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems, Copyrights Reserved </p></div>
        </div>
    </body>

</html>