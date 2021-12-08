

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Portal</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="js/jQuery-plugin-progressbar.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="js/jQuery-plugin-progressbar.js"></script>
        <style>#customers 
            {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            #customers td, #customers th {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}
            #customers tr:hover {background-color: #ddd;}
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #89CFF0;
                color: black;
            }
    </style>
    </head>
   
    <body style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
        <%
        String user = (String)request.getParameter("username");
        if(user!=null)
        session.setAttribute("uname", user);
        else
            user = (String)session.getAttribute("uname");
        %>
        <div class="divide" style="background-color:#99ccff; left:0;">
            <div style="color:white;font-size: 20px; font-family: sans-serif;display: block;text-align: center;
                 margin-top: 20px; margin-bottom: 25px;">Karale Computer Typing Institute</div>
            <hr> 
            <ul>
                 <li><a href="admin_home.jsp" class="active">Home</a></li>
  <li><a href="enroll_student.jsp">Enroll Student</a></li>
  <li><a href="enroll_faculty.jsp">Enroll Faculty</a></li>
  <li><a href="notices.jsp">Notices</a></li>
  <li><a href="student_details.jsp">Student Details</a></li>
  <li><a href="faculty_details.jsp">Faculty Details</a></li>
  
  <li><a href="course_register.jsp">Course Registration</a></li>
  <li><a href="course_details.jsp">Course Details</a></li>
  <li><a href="index.jsp">Sign Out</a>
</ul> 
        </div>
        <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
            <%
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
                String qr="select image_path from admin where username='"+user+"'";
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
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
         int f =0,c=0;
         qr="select fname,lname,age from admin where username=?";
         ps=con.prepareStatement(qr);
         ps.setString(1,username);
         rs=ps.executeQuery();
//           out.println(username);
            while(rs.next())
            {
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
//                out.println("Pass");
//                String department = rs.getString("department");
                int age = rs.getInt("age");
            %>
            
           
                <br><br>
                <%  }
             

                %>
        
            </p>
        </div>
                    <div class="divide" style="left: 25%; width: 60%; height: 85%; top: 8%; right: 25%; overflow-x: hidden; overflow-y: auto;">
                        
<!--                        <marquee><p style="font-size: 20px;color: dodgerblue"><strong>Student to Faculty Ratio</strong></p></marquee>
                <div class="progress-bar position" data-percent="<% //(c/f)%>" data-color="#ccc,dodgerblue" style="left: 30%"></div>
    
                    </div>
            <script>
		$(".progress-bar").loading();
		$('input').on('click', function () {
			 $(".progress-bar").loading();
		});
	</script>
--><div style="width: 70%; position: absolute">
                <table id="customers" style="width: 50%">
                        <th colspan="2" style="text-align: center">Student Details</th>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                
                <%
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_login", "root", "root");
                    qr="select * from login";
                    ps=con.prepareStatement(qr);
                    rs=ps.executeQuery();
                    while(rs.next())
                    {
                %>
                   
                        </tr>
                        <tr>
                            <td><%=rs.getString("username")%></td>
                            <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
                        </tr>
                <%  
                        }
                %>
                
                 </table>
                </div>
                <div style="margin-left:330px">
                    <table id="customers" style="width: 65%">
                        <th colspan="2" style="text-align: center">Faculty Details</th>
                        <tr>
                            <th>Username</th>
                            <th>Name</th>
                
                <%
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login", "root", "root");
                    qr="select * from login";
                    ps=con.prepareStatement(qr);
                    rs=ps.executeQuery();
                    while(rs.next())
                    {
                %>
                   
                        </tr>
                        <tr>
                            <td><%=rs.getString("username")%></td>
                            <td><%=rs.getString("fname")+" "+rs.getString("lname")%></td>
                        </tr>
                <%  
                        }
                %>
                
                 </table>
                
                </div>
                
                
                    </div>
                
                
                
                
                
                
                
                
                
                    </body>
</html>
