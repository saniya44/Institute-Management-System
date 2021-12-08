

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Notice</title>
        <link rel="stylesheet" href="styles.css">
     
    </head>
    <body style="width:100%;margin-left:0px;">
      <div class="divide"  <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
        <div class="divide" style="left: 27%; width: 50%; height: 80%; top: 10%;background-size: cover;">
            <h1 style="text-align:center">Check Notices</h1>
            <%
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/faculty_login","root","root");
                String qr="select * from notice2";
                PreparedStatement ps=con.prepareStatement(qr);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                %>
                
                <input type="text" value="<%=rs.getString(1)%>" height="600px" width="600px" readonly>
                <hr>
            <%  
                
            }
            %>
            </div>
        </div>    
        
    </body>
</html>
