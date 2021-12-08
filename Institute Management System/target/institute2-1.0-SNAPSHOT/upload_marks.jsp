

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
                border: 1px solid #ddd;
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
         <h1 style="text-align:center">Upload Marks here!!</h1>
        <div class="divide" style="left: 26%; width: 50%; height: 100%; top: 15%; right: 20%; overflow-x: auto; overflow-y: auto">
       <br><br><br>
            <table id="customers">
             <%  
//                String total = (String)request.getParameter("total");
                String course_name;
                
//                if(total==null)
//                    total = (String)session.getAttribute("total");
//                else
//                    session.setAttribute("total",total);
                course_name = (String)request.getParameter("course_name");
                if(course_name==null)
                    course_name = (String)session.getAttribute("course_name");
                else
                    session.setAttribute("course_name", course_name);
//                out.println(course_name+"\n"+total);
             %>  <tr>
                 <th colspan="3" style="text-align: center"><%=course_name%></th>
</tr>
            <tr>
                <th>Roll Number</th>
                <th>Name</th>
                <th>Marks</th>
                <!--<th colspan="3">Classes Absent</th>-->
            </tr>
           

            <%
                if(course_name!=null)
                {
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_login","root","root");
                    String qr="select courses.roll, courses.username, fname,lname from courses,login where login.username=courses.username and course_name=?";
                    PreparedStatement ps=con.prepareStatement(qr);
                    ps.setString(1,course_name);
                    ResultSet rs1=ps.executeQuery();
                    while(rs1.next())
                    {
            %>
                        <tr>
                            <td class="s"><%=rs1.getInt("roll")%></td>
                            <td>
                                <%= rs1.getString("fname")+" "+rs1.getString("lname")%>
                            </td>
                            
                            <td class="nr">
                                <input type="text" class="c">
                            </td>
                         
                        </tr>
                        <%
                    }
                }
            %>
            </table>
            <br><br><br>
            <input type="submit" onclick="update('c','s');" value="Update">
         </div>
            
            
<!-- Script to perform validations and computations on client side -->            
<script>
//            var changedData = Array();   
            var student_id = Array();
//            var total = '<%= session.getAttribute("total") %>';

            function show()
            {
                alert("Correct the errors");
            }
    
           function update(rowClass,si){
var arr = Array();
//var sid=Array();
    var indexColumn = 0;
    var i=0;
    $('.' + rowClass).each(function () {
        
        arr[indexColumn] = $(this).val();
    indexColumn++;
    });
    
    var data=Array();
    $("table tr").each(function(i, v){
                    data[i] = Array();
                    $(this).children('td').each(function(ii, vv){
                        data[i][ii] = $(this).text();
                    }); 
                });
                var i;
                for(i = 0; i<data.length-2;i++)
                {
//                    changedData[i] = parseInt(data[i+1][3]);
                    student_id[i] = parseInt(data[i+2][0]);
                }
            
    //        console.log(sid);
        if(typeof arr != "undefined" && arr != null && arr.length != null && arr.length > 0)
                window.location.href="update_marks?var="+arr+"&student_id="+student_id;
        else
        alert("Please make updations");
//        
            
            }
//            $(document).ready(function(){
//            $(".minus").click(function() {
//            var $row = $(this).closest("tr");    // Find the row
//            var $text = $row.find(".nr").text(); // Find the text
//            var $roll= $row.find(".roll").text();
//            if(parseInt($text)-1<0)
//                alert("Already zero");
//            else
//                $($row.find(".nr").text(parseInt($text)-1));
//            update();
//            });
//            
//            $(".plus").click(function() {
//            var $row = $(this).closest("tr");    // Find the row
//            var $text = $row.find(".nr").text(); // Find the text
//            var name = '<%= session.getAttribute("total") %>';
//
//            if(parseInt($text)+1>parseInt(name))
//                alert("Total Lectures are "+parseInt(name));
//            else
//                $($row.find(".nr").text(parseInt($text)+1));
//            update();
//            });
//           });
</script>
          </div>
    </body>
</html>
