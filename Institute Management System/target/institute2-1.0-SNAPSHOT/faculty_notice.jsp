

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Notices</title>
        <link rel="stylesheet" href="styles.css">
        <script>
            function update_details()
            {
                 alert("Please contact the administrator to update the details!\nYou can contact on fellows@gmail.com");

            }
        </script>
    </head>
    <body>
     <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
        
          <h1 style="text-align:center">Upload notice here!!</h1>
        <div class="divide" style="left: 20%; width: 60%; height: 80%; top: 15%; right: 20%; overflow-x: auto; overflow-y: auto">
            <form action="upload_notice"  method="post" style="margin-top: 50px; margin-left: 50px">
                <b>Please Include your Name and Class with notice</b>
                <input type="text" name="n1">
                    <br><br>
                <input type="submit" value="Upload Notice">
                
            </form>
            
            <form action="see_student_notice.jsp" style="margin-top: 50px; margin-left: 50px">
                <input type="submit" value="See Notices">
            </form>
            
        </div>    
      
     </div>
    </body>
</html>
