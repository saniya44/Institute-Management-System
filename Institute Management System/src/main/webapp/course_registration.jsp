
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Portal</title>
        <link rel="stylesheet" href="styles.css">
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
                text-align: center;
            }
            #customers tr:nth-child(even){background-color: #f2f2f2;}
            #customers tr:hover {background-color: #ddd;}
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:#89CFF0;
                color: white;
            }
    </style>
        <script>
            function update_details()
            {
                alert("Contact the administrator for any updations!!");
            }
        </script>
    </head>
    <body>
       
         <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
             <h1 style="text-align:center">Register Course</h1>
             
        <div class="divide" style="left: 30%; width: 50%; height: 80%; top: 10%; right: 20%; overflow-x: hidden; overflow-y: auto">
            
           <div style="overflow-x: auto;overflow-y: auto; height: 50%; width: 70%"><br><br>
                        <table id="customers" style="width: 73%; margin-left: 90px">
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                            </tr>
                            <%
                             Class.forName("com.mysql.jdbc.Driver");
//                session.setAttribute("A", "SA");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login", "root", "root");
                String qr="select course_id,course_name from courses;";
                PreparedStatement ps=con.prepareStatement(qr);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
         %>
         <tr>
             <td>
                 <%=rs.getString("course_id")%>
             </td>
             <td>
                 <%=rs.getString("course_name")%>
             </td>
         </tr>
         <%}%>
                        </table>
                        
                        </div>
                        <div class="divide" style="right: 50%; width: 50%; left: 16%; top: 62%; height: 35%">
                            <form action="register_course"> 
                        
                         <% //
//                             if(status.equals("F"))
//        
//                            {
//                         %>
        <!--<font style="color: red;margin-left: 80px;margin-bottom: 5px">Student does not exist!!</font>-->
        <%  
//                }else{
//                        }
        %>
                            <input type="text" name="course_id" placeholder="Course ID">
                        <br>
                        <br>
                        <input type="submit" value="Register the Course">
                    </form>
                            </div>
                        
            
            
        </div>    
         </div>
    </body>
</html>
