<%-- 
    Document   : AboutUs
    Created on : 6 Dec, 2015, 2:14:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
                width: 190px;

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
                height:6%;
                position:absolute;
                bottom:0;
                left:0;
                font-family:Montserrat;
                text-align:center;
                color:white;
            }
     
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: auto;
      margin: auto;
  }


        </style>
    </head>
    <body>

        <ul>
            <img src="<%=request.getContextPath() %>/Images/logonew.png" id="logo" height="100" width="150" />
            <img src="<%=request.getContextPath() %>/Images/Title.png" id="Title" height="60" width="800" />
        </ul>
        <ul>
            

            <li><a class="active" href="index.jsp">Home</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
            <li><a href="ContactUs.jsp">Contact Us</a></li>
            

        </ul>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<%=request.getContextPath() %>/Images/exper01.jpg" alt="Chania">
    </div>

    <div class="item">
      <img src="<%=request.getContextPath() %>/Images/bioservicesbuilding.png" alt="Chania">
    </div>

  </div>
  
  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <h3> <marquee behavior=scroll direction="left" scrollamount="22"> Sudarshan Masthan Boppana Mani; 
      Pradeep Edwin Samuel;  
      Haricharan Shivram Suresh Chandra Kumar; 
       Vigneshwar Srinivasan; 
       Janani Damodharan;
       Bhavya Pilli; Anand; Shamalee; Naveen Varma; Vamsi Priya; Tejaswi; Kumar
        </marquee>    </h3>
           
    
    <div class="footer">
            <div id="footer"><p> &#169; University of Carolina, Charlotte 28262. Property of Team 2, Database Systems Copyrights Reserved </p></div>
        </div>

        

