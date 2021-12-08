

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Attendance</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            function update_details(){
                       alert("Please contact the administrator to update the details!\nYou can contact on hjain1245@gmail.com");
            }
        </script>
    </head>
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
                text-align: left;
                background-color: #89CFF0;
                color: white;
            }
    </style>
    <body>
        
        <div class="divide facutly_info_right" style="background-image:url(images/bg3.jpg); height: 100%;width: 100%;background-position: center;background-repeat: repeat;background-size: cover;">
              <h1 style="text-align:center;">Upload Attendance Here!!</h1>
        <div class="divide" style="left: 26%; width: 50%; height: 60%; top: 15%; right: 20%; overflow-x: auto; overflow-y: auto"><br><br><br>
        <table id="customers">
            <tr>
                <th>Roll Number</th>
                <th>Name</th>
                <th colspan="3">Classes Attended</th>
                <th colspan="3">Classes Absent</th>
            </tr>
            <%  
                String total = (String)request.getParameter("total");
                String course_name;
                
                if(total==null)
                    total = (String)session.getAttribute("total");
                else
                    session.setAttribute("total",total);
                course_name = (String)request.getParameter("course_name");
                if(course_name==null)
                    course_name = (String)session.getAttribute("course_name");
                else
                    session.setAttribute("course_name", course_name);
//                out.println(course_name+"\n"+total);
                if(course_name!=null)
                {
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_login","root","root");
                    String qr="select courses.roll, courses.username, fname,lname,attended,total from courses,login where login.username=courses.username and course_name=?";
                    PreparedStatement ps=con.prepareStatement(qr);
                    ps.setString(1,course_name);
                    ResultSet rs1=ps.executeQuery();
                    while(rs1.next())
                    {
            %>
                        <tr>
                            <td><%=rs1.getInt("roll")%></td>
                            <td>
                                <%= rs1.getString("fname")+" "+rs1.getString("lname")%>
                            </td>
                            <td>
                                <button type="button" class="minus">
                                    <img src="images/minus.jpg" style="height: 20px; width: 20px">
                                </button>
                            </td>
                            <td class="nr">
                                <%int a =rs1.getInt("attended");%>
                                <%=rs1.getInt("attended")%>
                            </td>
                            <td>
                                <button type="button" class="plus">
                                    <img src="images/plus.jpg" style="height: 20px; width: 20px">
                                </button>
                            </td>
                            <td>
                                <%int x =rs1.getInt("total");
                                %>
                                <%=x-a%>
                            </td>
                        </tr>
                        <%
                    }
                }
            %>
            </table>
            <br><br><br>
            <input type="submit" onclick="call_servlet()" value="Update">
         </div>
          
            
<!-- Script to perform validations and computations on client side -->            
<script>
            var changedData = Array();   
            var student_id = Array();
            var total = '<%= session.getAttribute("total") %>';

            function show()
            {
                alert("Correct the errors");
            }
    function call_servlet(){
        if(typeof changedData != "undefined" && changedData != null && changedData.length != null && changedData.length > 0)
                window.location.href="update_attendance?var="+changedData+"&student_id="+student_id+"&total="+total;
        else
        alert("Please make updations");
        
            }
           function update(){
                var data = Array();      
                $("table tr").each(function(i, v){
                    data[i] = Array();
                    $(this).children('td').each(function(ii, vv){
                        data[i][ii] = $(this).text();
                    }); 
                });
                var i;
                for(i = 0; i<data.length-1;i++)
                {
                    changedData[i] = parseInt(data[i+1][3]);
                    student_id[i] = parseInt(data[i+1][0]);
                }
            }
            $(document).ready(function(){
            $(".minus").click(function() {
            var $row = $(this).closest("tr");    // Find the row
            var $text = $row.find(".nr").text(); // Find the text
//            var $roll= $row.find(".roll").text();
            if(parseInt($text)-1<0)
                alert("Already zero");
            else
                $($row.find(".nr").text(parseInt($text)-1));
            update();
            });
            
            $(".plus").click(function() {
            var $row = $(this).closest("tr");    // Find the row
            var $text = $row.find(".nr").text(); // Find the text
            var name = '<%= session.getAttribute("total") %>';

            if(parseInt($text)+1>parseInt(name))
                alert("Total Lectures are "+parseInt(name));
            else
                $($row.find(".nr").text(parseInt($text)+1));
            update();
            });
           });
</script>
        </div>
    </body>
</html>
