

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
    <link rel="stylesheet" href="js/jQuery-plugin-progressbar.css">
    <style>
            #customers 
            {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            #customers td, #customers th {
                border: 1px solid black;
                padding: 8px;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}
            #customers tr:hover {background-color: #ddd;}
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color:#89CFF0;
                color: white;
            }
    </style>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="js/jQuery-plugin-progressbar.js"></script>
        <script>
            function update_details()
            {
                alert("Contact the administrator for any updations!!");
            }
        </script>
        <script>
            function facultySelection()
            {
                var x = document.getElementById("faculty_select");
                var course_name = x.options[x.selectedIndex].text;
                console.log(course_name);
                window.location.replace("new_student_message.jsp?faculty_name="+course_name);
//                document.getElementById("customers").style.display="block";
            }
            function update_details(){
                       alert("Please contact the administrator to update the details!\nYou can contact on Fellows@gmail.com");
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
                 margin-top: 20px; margin-bottom: 25px;">Karale Computer Typing Institute</div>
            <hr> 
           <ul>
                 <li><a href="student_home.jsp" class="active">Home</a></li>
  <li><a href="student_attendance.jsp">Check Attendance</a></li>
 <li><a href="see_student_notice.jsp">Notices</a></li>
  <li><a href="student_marks.jsp">Check Marks</a></li>
  <li><a href="course_registration.jsp">Course Registration</a></li>
  <li><a href="chat_student.jsp">Chat Room</a></li>
  <li><a href="index.jsp">Sign Out</a>
</ul>
        </div>
         <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
             
             <h1 style="text-align:center">Chat Section</h1>
             
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
            
            <p align="center" class="facutly_info">
                 <%
                     String fname="",lname="";
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
                 fname = rs.getString("fname");
                 lname = rs.getString("lname");
//                out.println("Pass");
                String department = rs.getString("department");
                
            %>
         
            <br><br>
                <%  }
             
                %>
         
        </p>
        </div>
            <%
             qr="select attended,course_name,course_id,total from courses where username=?";
            ps=con.prepareStatement(qr);
            ps.setString(1,username);
            rs=ps.executeQuery();
//           out.println(username);
            while(rs.next())
            {
                int attended = rs.getInt("attended");
                String course_name = rs.getString("course_name");
                String course_id = rs.getString("course_id");
//                out.println("Pass");
                int total = rs.getInt("total");
                p = p + attended;
                t = t + total;
                
            
            }
            
            %>
        <div class="divide" style="left: 25%; width: 50%; height: 85%; top: 8%; right: 25%; overflow-x: auto; overflow-y: auto">
            
            <div style="height: 50px; position: absolute;"><br>
            <select id="faculty_select" style="margin-left: 265px">
            <%
//            String username = (String) session.getAttribute("uname");
            Class.forName("com.mysql.jdbc.Driver");  
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
             qr="select fname,lname from login";
             ps=con.prepareStatement(qr);
//            ps.setString(1,username);
             rs=ps.executeQuery();
            while(rs.next())
            {
            %>
            <option><%=rs.getString("fname")+" "+rs.getString("lname")%></option>
            <%  
            }
            %>    
            </select>
            <br><br>    <br><br>
            <input type="submit" value="Send Message" onclick="facultySelection()" style="margin-left:230px">
            <br><br>
            <br>
            </div>
            <div style="margin-top:90px; width: 50%; position: absolute">
                <br><br>    <br><br>
            <table id="customers" style="width:250px">
                <th colspan="2">Message Box</th>
                    <tr>
                        <th>Faculty Name</th>
                        <th>Message Sent</th>
                        <!--<th>Reply</th>-->
                    </tr>
                     <%
//        String username = (String)session.getAttribute("uname");
        
//         Class.forName("com.mysql.jdbc.Driver");  
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
         qr="select fid from messages where sid=? group by fid";
         ps=con.prepareStatement(qr);
            ps.setString(1,username);
         rs=ps.executeQuery();
//            int t=0,p=0;
//           out.println(username);
            while(rs.next())
            {
                String name = rs.getString("fid");
                String qr1 = "select msg from messages where fid=? and sid=?";
                PreparedStatement ps1 = con.prepareStatement(qr1);
                ps1.setString(1,name);
                ps1.setString(2, username);
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next())
                {
              String message = rs1.getString("msg");
                
                
                
            %>
            
            <tr>
                <td>
                        
                    <%=name%>
                </td>
                <td>
                    <%=message%><br>
                    <!--<p style="text-align: right"></p>-->
                </td>
                
            </tr>
            <%
            }
            }
            %>
            </table>
            </div>
            <div style="margin-left:300px; margin-top: 90px; width: 50%">
                <br><br>    <br><br>
            <table id="customers" style="width: 250px">
                <th colspan="3">Message Box</th>
                    <tr>
                        <th>Faculty Name</th>
                        <th>Message Received</th>
                        <th>Reply</th>
                    </tr>
                     <%
//        String username = (String)session.getAttribute("uname");
        
//         Class.forName("com.mysql.jdbc.Driver");  
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
         qr="select fid from messagef where sid=? group by fid";
         ps=con.prepareStatement(qr);
            ps.setString(1,fname+" "+lname);
//            out.println(username);
         rs=ps.executeQuery();
//            int t=0,p=0;
//           out.println(username);
            while(rs.next())
            {
                String name = rs.getString("fid");
//                out.println(name);
                String qr1 = "select msg from messagef where fid=? and sid=?";
                PreparedStatement ps1 = con.prepareStatement(qr1);
                ps1.setString(1,name);
                ps1.setString(2, fname+" "+lname);
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next())
                {
              String message = rs1.getString("msg");
                
                String s="";    
//              String message = rs1.getString("msg");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
                String qr2 = "select fname, lname from login where username=?";
                 PreparedStatement ps2 = c.prepareStatement(qr2);
                ps2.setString(1,name);
                ResultSet r = ps2.executeQuery();
                while(r.next())
                {
                    s = r.getString("fname") + " " + r.getString("lname");
                }
                
            %>
            
            <tr>
                <td>
                        
                    <%=s%>
                </td>
                <td>
                    <%=message%><br>
                    <!--<p style="text-align: right"></p>-->
                </td>
                <td>
                    <form action="new_student_message.jsp">
                    <input type="hidden" value="<%=s%>" name="fac_name">
                    <input type="submit" value="Reply">
                    </form>
                </td>
            </tr>
            <%
            }
            }
            %>
                </table>
        </div>
                </div>
    </body>
</html>
