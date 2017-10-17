<%-- 
    Document   : Login
    Created on : 29 Nov, 2015, 8:54:27 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    <link type="text/css" rel="stylesheet" href="Main/Style.css"/>
    
    </head>
<body>

<h2>College Information System</h2>
<div id="login">
<h2>Student Registration</h2>
<h2>Student with the same UserId exists. Please register with a different UserId</h2>
<fieldset>
  <form id="studentRegister" action="StudentController" method="get">
<p><input type="text" required name="Username" value="Username" onBlur="if(this.value=='')this.value='Username'" onFocus="if(this.value=='Username')this.value='' "></p>
<p><input type="password" required name="Password" value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "></p>
<p><input type="text" required name="Student_ID" value="Student_ID" onBlur="if(this.value=='')this.value='Student_ID'" onFocus="if(this.value=='Student_ID')this.value='' "></p>
<p><input type="text" required name="First Name" value="First Name" onBlur="if(this.value=='')this.value='First Name'" onFocus="if(this.value=='First Name')this.value='' "></p>
<p><input type="text" required name="Last Name" value="Last Name" onBlur="if(this.value=='')this.value='Last Name'" onFocus="if(this.value=='Last Name')this.value='' "></p>

<p> UG Gpa :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select name ="UG GPA"> <option name="3.0" value ="3.0">3.0</option>
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
<p><input type="text" required name="E-Mail Address" value="E-Mail Address" onBlur="if(this.value=='')this.value='E-Mail Address'" onFocus="if(this.value=='E-Mail Address')this.value='' "></p>
Date of Birth :&nbsp;&nbsp;&nbsp;<input type="date" required name="DateOfBirth" value="DateOfBirth" onBlur="if(this.value=='')this.value='DateOfBirth'" onFocus="if(this.value=='DateOfBirth')this.value='' ">
<p><input type="text" required name="Contact Address" value="Contact Address" onBlur="if(this.value=='')this.value='Contact Address'" onFocus="if(this.value=='Contact Address')this.value='' "></p>
<p><input type="text" required name="Phone Number" value="Phone Number" onBlur="if(this.value=='')this.value='Phone Number'" onFocus="if(this.value=='Phone Number')this.value='' "></p>
Department :&nbsp;&nbsp;&nbsp;  <select name ="DeptName"> <option name="Bio Technology" value ="Bio Technology">Bio Technology</option>
        <option name="Computer Science" value ="Computer Science">Computer Science</option>
        <option name="Mechanical Engineering" value ="Mechanical Engineering">Mechanical Engineering</option>
        <option name="Electrical Engineering" value ="Electrical Engineering">Electrical Engineering</option>
        <option name="Business Management" value ="Business Management">Business Management</option></select>
 <input type="hidden" name="action" value="stuSubmit">
                         <center><p><button type="submit"> Register</button></p></center>
    </form>

    <center><p><input type="button" value="Back To Login"></p></center>
</a>
</fieldset>

</div>
</form>

</body>

</html>

