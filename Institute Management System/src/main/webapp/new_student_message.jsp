

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> Student Portal</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
 
        <script>
            function update_details()
            {
                alert("Contact the administrator for any updations!!");
            }
        </script>
    </head>
    <body>
        <%
        String user = (String)request.getParameter("username");
        if(user!=null)
        session.setAttribute("uname", user);
        %>
        <div class="divide" style="background-color: #43425D; left: 0">
            <div style="color:white;font-size: 20px; font-family: sans-serif;display: block;text-align: center;
                 margin-top: 20px; margin-bottom: 25px;">ABC Insitute</div>
            <hr> 
            <ul>
                 <li><a href="student_home.jsp">Home</a></li>
  <li><a href="student_attendance.jsp">Check Attendance</a></li>
  <li><a href="see_notices.jsp">Notices</a></li>
  <li><a href="student_marks.jsp">Check Marks</a></li>
  <li><a href="course_registration.jsp">Course Registration</a></li>
  <li><a href="chat_student.jsp" class="active">Chat Room</a></li>
  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
        <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
           <h1 style="text-align:center">Chat Here!!</h1>
            <%
                user = (String) session.getAttribute("uname");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_login","root","root");
                String qr="select imagepath from login where username='"+user+"'";
                PreparedStatement ps=con.prepareStatement(qr);
                ResultSet rs=ps.executeQuery();
                if(rs.next())
                {
                %>
                
                <!--<hr><hr><hr>-->
            <%  
                
            }
            %>
            <br><br>
        
            <br><br>
            <p align="center" class="facutly_info">
                 <%
        String username = (String)session.getAttribute("uname");
        
         Class.forName("com.mysql.jdbc.Driver");  
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_login","root","root");
         qr="select fname,lname,department,roll from login where username=?";
         ps=con.prepareStatement(qr);
            ps.setString(1,username);
         rs=ps.executeQuery();
            int t=0,p=0;
//           out.println(username);
            while(rs.next())
            {
                String roll = rs.getString("roll");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
//                out.println("Pass");
                String department = rs.getString("department");
                
            %>
            Roll Number :
            <%=roll%>
            <br><br>
            Name :
            <%=fname+" "+lname%>
            <br>
            <br>
            Department :
                <%=department%>
            <br><br>
                <%  }
             
                %>
       
        </p>
        </div>
        <div class="divide" style="left: 30%; width: 40%; height: 85%; top: 8%; right: 25%; overflow-x: hidden; overflow-y: auto">
            
            <%
                String faculty_name = (String) request.getParameter("faculty_name");
                if(faculty_name == null)
                    faculty_name = (String) request.getParameter("fac_name");
            %>
            
            <form action="s_to_f">
                <input type="hidden" value="<%=faculty_name%>" name="faculty_name">
                <input type="hidden" value="<%=username%>" name="student_name">
                <textarea placeholder="Enter the message" spellcheck="true" name="message" style="width: 400px; height: 300px; margin-left: 55px"></textarea>
                <br><br>    <br><br>
            <input type="submit" value="Send Message">
            </form>
                
                <br><br>
                
                
        </div>
    </body>
</html>
