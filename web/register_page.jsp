
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--CSS-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 79% 0, 100% 0, 100% 81%, 86% 95%, 43% 98%, 16% 89%, 0 94%, 0 0, 19% 0);
                
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class=" primary-background banner-background" style="padding-bottom: 80px" >
            <div class="container">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                Register Here
                            </div>
                            <%
                                Message m = (Message)session.getAttribute("msg");
                                if(m!=null){
                                %>
                                <div class="alert <%= m.getCssClass()%>" role="alert">
                                    <%=m.getContent()%>
                            </div>
                                <%
                                    session.removeAttribute("msg");
                                }
                                %>
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">
                                    
                                    <div class="form-group">
                                      <label for="user_name">User Name</label>
                                      <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name" required>
                                      </div><!-- comment -->
                                    
                                    
                                    <div class="form-group">
                                      <label for="exampleInputEmail1" >Email address</label>
                                      <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                      
                                      
                                    <div class="form-group">
                                      <label for="exampleInputPassword1" required>Password</label>
                                      <input type="user_password" name="password" class="form-control" id="exampleInputPassword1" required placeholder="Password">
                                    </div>
                                      
                                      <div class="form-group"  required >
                                      <label for="gender" required>Select Gender</label>
                                      <br><!-- < -->
                                      <input type="radio" id="gender" name="gender" value="Male">Male
                                      <input type="radio" id="gender" name="gender" value="Female">Female
                                      
                                    </div>
                                      
                                      <div class="form-group">
                                          <textarea name="about" class="form-control" id="" cols="30" rows="10" placeholder="Enter something about yourself"></textarea>
                                      </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="check" class="form-check-input"  id="exampleCheck1" required>
                                      <label class="form-check-label" for="exampleCheck1">Agree to terms and condition</label>
                                    </div>
                                      <br>
                                      <span class="fa fa-referesh fa-spin fa-4x"></span>
                                      <br>
                                    <button type="submit" class="btn btn-primary" >Submit</button>
                                </form> 
                            </div>
                        </div>
                    </div>
            </div>
        </main>
        
         <!--JAVA SCRIPTS-->
        <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        
    </body>
</html>
