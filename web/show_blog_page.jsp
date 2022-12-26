<%-- 
    Document   : show_blog_page
    Created on : 25-Dec-2022, 3:33:49 pm
    Author     : ujwal
--%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<% 

    User user=(User)session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("login_page.jsp");
    }
%>

<%
  int postId = Integer.parseInt(request.getParameter("post_id"));
  PostDao d = new PostDao(ConnectionProvider.getConnection());
  Post p = d.getPostByPostId(postId);
  
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || IES College</title>
         <!--CSS-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: url(img/bg.png);
                background-size: cover;
                background-attachment: fixed;
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
                /*font-weight: 200px;*/
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v15.0" nonce="PBandetd"></script>
    </head>
    <body>
        <!--navbar start-->
            <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp">IES TECH BLOG</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="https://iesbpl.ac.in/IES.php">IES NEWS <span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Programming Language</a>
                  <a class="dropdown-item" href="#">Project Implementation</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Data Structure</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="" data-toggle="modal" data-target="#add-post-modal">Do Post</a>
              </li>
              
            </ul>
              <ul class="navbar-nav mr-right">
                  <li class="nav-item">
                  <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
              </li>
                  <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
              </li>
              </ul>

          </div>
        </nav>
        <!--navbar end-->
        
        <!--Main content of the body-->
        
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle() %></h4>
                        </div>
                        
                        <div class="card-body">
                             <img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
                             
                             <div class="row my-3 row-user">
                                 <div class="col-md-8">
                                     <% UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                      
                                     %>
                                     <p class="post-user-info"> <a href="#"> <%= ud.getUserByUserId(p.getUserId()).getName()  %></a> has Posted : </p>
                                 </div>
                                 <div class="col-md-4">
                                     <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p.getpDate()) %>
                                 </div>
                             </div>
                             
                             <p class="post-content"><%= p.getpContent() %></p>
                            
                            <br><br> 
                            <div class="post-code">
                            <pre><%= p.getpCode() %> </pre>
                            </div>
                        </div>
                        <div class="card-footer primary-background">
                            <%
                                LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
                            %>
                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ldao.countLikeOnPost(p.getPid()) %></span></a>
                            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>
                
                        </div>
                            
<!--                            <div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:2023/TechBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="100px" data-numposts="5"></div>
                            </div>-->
                    </div>
                </div>
            </div>
        </div>
        
        
        <!--End of main content of the body-->
                <!--profile modal start-->

                    <!-- Button trigger modal -->

            <!-- Modal -->
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white text-center ">
                    <h5 class="modal-title" id="exampleModalLabel">IES TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 160px; ">
                          <br>
                          <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                         
                          <!--Details-->
                          <div id="profile-details">
                          <table class="table">
                           
                            <tbody>
                              <tr>
                                <th scope="row">ID:</th>
                                <td><%= user.getId() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Email: </th>
                                <td><%= user.getEmail() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Gender:</th>
                                <td><%= user.getGender() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Status: </th>
                                <td><%= user.getAbout() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Registered On: </th>
                                <td><%= user.getDateTime().toString() %></td>
                              </tr>
                            </tbody>
                          </table>
                          </div>
                              <!--profile detail end-->
                              <!--Profile edit-->
                              <div id="profile-edit" style="display:none;">
                                  <h2 class="mt-2">Please Edit Carefully</h2>
                                  <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                      <table class="table">
                                          <tr>
                                              <td>ID:</td>
                                              <td><%= user.getId()%></td>
                                          </tr>
                                          <tr>
                                              <td>Email:</td>
                                              <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                              <!--<td><%= user.getEmail()%></td>-->
                                          </tr>
                                          <tr>
                                              <td>Name:</td>
                                              <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                          </tr>
                                          <tr>
                                              <td>Password:</td>
                                              <td><input type="Password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                          </tr>
                                          <tr>
                                              <td>Gender:</td>
                                              <td><%= user.getGender().toUpperCase()%></td>
                                          </tr>
                                          <tr>
                                              <td>About: </td>
                                              <td>
                                                  <textarea row="3" class="form-control" name="user_about">
                                                      <%= user.getAbout()%>
                                                  </textarea>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>New Profile: </td>
                                              <td>
                                                  <input type="file" name="image" class="form-control">
                                              </td>
                                          </tr>
                                      </table>
                                                  <div class="container"><!-- comment -->
                                                      <button type="submit" class="btn btn-outline-primary">Save</button>
                                                  </div>
                                  </form>
                              </div>
                              <!--Profile edit end-->
                      </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                  </div>
                </div>
              </div>
            </div>
        <!--end of profile modal-->
        
        <!--add post modal-->
        
               
            <!-- Modal -->
            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form id="add-post-form" action="AddPostServlet" method="POST">
                          <div class="form-group">
                              <select class="form-control" name="cid">
                                  <option selected disabled="">---Select Category---</option>
                                  <%
                                      PostDao postd= new PostDao(ConnectionProvider.getConnection());
                                      ArrayList<Category> list = postd.getAllCategories();
                                      for(Category c:list){
                                      %>
                                      <option value="<%= c.getCid()%>"><%=c.getName() %></option>
                                      <%
                                      }
                                      %>
                             </select>
                          </div>
                          <div class="form-group">
                              <input type="text" name="pTitle" placeholder="Enter the post Title" class="form-control"/>
                              
                          </div>
                          <div class="form-group">
                              <textarea name="pContent" class="form-control"style="height:200px;" placeholder="Enter your content"></textarea>
                          </div>
                          <div class="form-group">
                              <textarea name="pCode" class="form-control"style="height:200px;" placeholder="Enter your Program(if any)"></textarea>
                          </div>
                          <div class="form-group">
                              <label>Select your pic</label><br>
                              <input name="pic" type="file" >
                          </div>
                             
                             <div class="container text-center">
                                 <button type="submit" class="btn btn-outline-primary">Post</button>
                             </div>
                      </form>
                  </div>
                  
                </div>
              </div>
            </div>
        
        <!--add post modal end-->
        
        <!--JAVA SCRIPTS-->
        <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            function doLike(pid,uid){
                const d = {
                    uid:uid,
                    pid:pid,
                    operation:'like'
                }

                $.ajax({
                    url:"LikeServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if(data.trim()=='true'){
                            let c = $(".like-counter").html();
                            c++;
                            $('.like-counter').html(c);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data); 
                    }
                })
            }       
        </script>
    </body>
</html>
