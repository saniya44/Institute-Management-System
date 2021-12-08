<!DOCTYPE html>

<html lang="en">

<head>
    <title>Login</title>
    <!-- Required meta tags -->

     <script>
     function alert_message(){
         alert("Contact the administrator department!!")
     }
 </script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style>
        /* Make the image fully responsive */
        * {
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }

     #button1
{
background-color: #ffffb3;
color:black;
text-shadow: 1px 1px 1px  crimson;
border:none;
margin-top:5px;
margin-left:5px;
border:3px solid black;
}


#hcolor
        {

            
        font-size: 20px;
           
            text-shadow: 5px 5px 5px  white;
            font-weight: normal;
            color: black;

    
        }

     #a1
        {

          margin-left: 320px;
            padding-left:100px;
         

        }


#a2
        {

          margin-left: 130px;
            padding-left:100px;
         

        }



        #deco
        {
            background-color:rgb(204, 204, 204)

        }

        

        #slogan1
        {
           text-align: center;
background-color: rgb(32, 31, 31);
            color: rgb(236, 227, 195);
            font-size: 20px;
        
        }
        
         #slogan
        {
           text-align: center;
background-color: rgb(32, 31, 31);
            color: rgb(236, 227, 195);
            font-size: 10px;
        
        }

        #ab{
color: white;


        }



           #img1 {
            /* The image used */
            background-image: url("images/n2.jpg");

            /* Full height */
            height: 100%;
            width: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: repeat;
            background-size: cover;
            
        }

 #hcolor
        {

            
        font-size: 25px;
           
            text-shadow: grey;
            font-weight: normal;
            color: lightblack;

    
        }
    

         #pcolor
        {
            font-family: 'Oranienbaum', serif;
            color: black;
            font-size: 50px;
            text-shadow: 7px 7px 7px  white;
            font-weight: normal;
            padding-top:70px;
        }

.log
{
    font-family: 'Oranienbaum', serif;
            color:black;
            font-size: 25px;
            text-shadow: 7px 7px 7px  white;
            font-weight: normal;
             margin-left:0px;
    
}

#log2
{
    
    margin-left:300px;
}
 .scheduler-border{
  border-color: black !important;
  border-style: solid !important;
  
}

    </style>
</head>
<br>
<body  id="img1">
 
  


    
<div >
    <h1 id="slogan1"> "Online Coaching Management System"</h1>
</div>

    <div class="container-fluid" >

    	 <%
          String status = (String)request.getParameter("status");
          if(status==null)
            status="T";
      %>
    <header id="header" class="">
   
      
       
</header>
       

            
<br><br>



<i id="pcolor"><h1 class="text-center">"Welcome to Karale Computer Typing Institute!!"</h1></i>
<br>

 <form method=post action="login" id="log2">
<fieldset class="scheduler-border" style="border-color: black; border-style: solid; border-width:1px;padding-left:20px;margin-right:200px;padding-bottom:20px;"> 
       <legend style="font-size:small;width:auto;"><h4><u>Login Here</u></h4></legend>
         

        <input type="radio" name="type_of_login" value="1" ><label class="log">Faculty Login</label> &emsp;
        <input type="radio" name="type_of_login" value="0" ><label class="log">Student Login</label> &emsp;
        <input type="radio" name="type_of_login" value="2" ><label class="log">Admin Login</label><br>
          <label id="hcolor">  Username </label> <input type=text  name="username" height="0"><br><br>
        
        <label id="hcolor">Password </label><input type="password" name="password"><br><br>
        
         
         
        <button type="submit" class="btn btn-primary mt-3 ml-10 content-align:center">Login</button>
        
         &nbsp; &nbsp;<button type="button" onclick="alert_message()" class="btn btn-primary mt-3 ml-10 content-align:center">Forgot Password</button>  
         
        
       <label>
           <input type="checkbox" checked="checked" name="remember" id="button1"> Remember me
        </label> &emsp;&emsp;&emsp;&emsp;
        <br>
        <%if(status.equals("F"))
        { %>
        <font style="color: red">Username and Password do not match!!</font>
        <%}
            else if(status.equals("L"))
        {
        %>
        <font style="color: red">Select login account type!!</font>
        <%}
        else{}
        %>
        </fieldset>  
    </form>


<br>
</div>
<div id="ab">
    <br><br><br>
&copy; All Rights are Resereved </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"></script>
        
</body>

    
   
</html>