<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.DBConnection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Caldriva</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/preloader.css">
    <link rel="shortcut icon" href="assets/images/profile.jpg" type="image/x-icon">
    
    <link rel="stylesheet" href="assets/vendors/choices.js/choices.min.css" />
    
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
       
           <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
        
         <!-- Alertify CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
  <!-- Alertify js -->  
 <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    
    <style>
    
body{margin-top:20px;}
.preloader {
  position: fixed;
  left: 0;
  width: 0;
  height: 100%;
  width: 100%;
  text-align: center;
  z-index: 9999999;
  -webkit-transition: .9s;
  transition: .9s;
}

.preloader .loader {
  position: absolute;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  display: inline-block;
  left: 0;
  right: 0;
  margin: 0 auto;
  top: 45%;
  -webkit-transform: translateY(-45%);
          transform: translateY(-45%);
  -webkit-transition: 0.5s;
  transition: 0.5s;
}

.preloader .loader .loader-outter {
  position: absolute;
  border: 4px solid #ffffff;
  border-left-color: transparent;
  border-bottom: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  -webkit-animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
          animation: loader-outter 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
}

.preloader .loader .loader-inner {
  position: absolute;
  border: 4px solid #ffffff;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  left: calc(40% - 21px);
  top: calc(40% - 21px);
  border-right: 0;
  border-top-color: transparent;
  -webkit-animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
          animation: loader-inner 1s cubic-bezier(0.42, 0.61, 0.58, 0.41) infinite;
}

.preloader .loader .indicator {
  position: absolute;
  right: 0;
  left: 0;
  top: 50%;
  -webkit-transform: translateY(-50%) scale(1.5);
          transform: translateY(-50%) scale(1.5);
}

.preloader .loader .indicator svg polyline {
  fill: none;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.preloader .loader .indicator svg polyline#back {
  stroke: #ffffff;
}

.preloader .loader .indicator svg polyline#front {
  stroke: #1A76D1;
  stroke-dasharray: 12, 36;
  stroke-dashoffset: 48;
  -webkit-animation: dash 1s linear infinite;
          animation: dash 1s linear infinite;
}

.preloader::before, .preloader::after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 60%;
  z-index: -1;
  background: #1A76D1;
  -webkit-transition: .9s;
  transition: .9s;
}

.preloader::after {
  left: auto;
  right: 0;
}

.preloader.preloader-deactivate {
  visibility: hidden;
}

.preloader.preloader-deactivate::after, .preloader.preloader-deactivate::before {
  width: 0;
}

.preloader.preloader-deactivate .loader {
  opacity: 0;
  visibility: hidden;
}

@-webkit-keyframes loader-outter {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@keyframes loader-outter {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

@-webkit-keyframes loader-inner {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(-360deg);
            transform: rotate(-360deg);
  }
}

@keyframes loader-inner {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(-360deg);
            transform: rotate(-360deg);
  }
}

@-webkit-keyframes dash {
  62.5% {
    opacity: 0;
  }
  to {
    stroke-dashoffset: 0;
  }
}

@keyframes dash {
  62.5% {
    opacity: 0;
  }
  to {
    stroke-dashoffset: 0;
  }
}
    </style>
</head>

<body>


 <div class="card">
        <div class="card-body" align="right">
            <div class="badges">
                
                
                <span class="badge bg-light-success"><i class="fa-solid fa-circle-user fa-xl" style="hight:50; width:50;"></i>Welcome Admin</span>
                 <div class="btn-group me-1 mb-1">
			                 <div class="dropdown">
			                     <button type="button" class="btn btn-danger dropdown-toggle"
			                         data-bs-toggle="dropdown" aria-haspopup="true"
			                         aria-expanded="false">
			                         <i class="fa-solid fa-gear"></i>
			                     </button>
			                     <div class="dropdown-menu">
			                         <a class="dropdown-item" href="#"><i class="fa-solid fa-chart-pie"></i>  Generate Report</a>
			                         <a class="dropdown-item" href="#"><i class="fa-solid fa-right-from-bracket"></i>  Logout</a>
			                     </div>
			                 </div>
			             </div>
            </div>
        </div>
    </div>

<div class="preloader">
    <div class="loader">
        <div class="loader-outter"></div>
        <div class="loader-inner"></div>

        <div class="indicator"> 
            <svg width="16px" height="12px">
                <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
            </svg>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
        <script src="component/jquery/jquery.js" type="text/javascript"></script>
        <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="component/jquery.validate.min.js" type="text/javascript"></script>
        <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(window).on('load', function() {
    //for use in production please remove this setTimeOut
    setTimeout(function(){ 
        $('.preloader').addClass('preloader-deactivate');
    }, 30);
    //uncomment this line for use this snippet in production
    //	$('.preloader').addClass('preloader-deactivate');
});
</script>

    <%
	Connection con=DBConnection.getConnection();
	Statement st = con.createStatement();
    String union = (String)session.getAttribute("name");
    String branch = (String)session.getAttribute("branch");
    String pass = (String)session.getAttribute("pass");
  	try{
	 

	String b=null;
	String p=null;
	String u=null;
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	ResultSet resultSet = st.executeQuery("select * from login where branch='admin' or branch='Union'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		u=resultSet.getString("unions");
		p=resultSet.getString("password");
	}
        if(!branch.equals("Union") && !branch.equals("admin")){
              response.sendRedirect("index.jsp"); 
              System.out.println("going to index.." + branch);
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  		 
  	}
   %>

    <div id="app">
    
    <!-- start side bar -->
    
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.html"><img src="assets/images/profile.jpg" alt="Logo" srcset="" style="width:150px; height:120px;" ></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item  ">
                            <a href="adminDashboard.jsp" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                      <li class="sidebar-item  ">
                            <a href="station.jsp" class='sidebar-link'>
                                <i class="bi bi-globe2"></i>
                                
                                <span>Branches</span>
                            </a>
                        </li>

                         <li class="sidebar-item  ">
                            <a href="vehicles.jsp" class='sidebar-link'>
                                <i class="bi bi-truck"></i>
                                <span>Vehicles</span>
                            </a>
                        </li>

                         <li class="sidebar-item  ">
                            <a href="drivers.jsp" class='sidebar-link'>
                                <i class="bi bi-person"></i>
                                <span>Drivers</span>
                            </a>
                        </li>


                        <li class="sidebar-item  ">
                            <a href="trips.jsp" class='sidebar-link'>
                                <i class="bi bi-map"></i>
                                <span>Trips</span>
                            </a>
                        </li>

                    

                        <li class="sidebar-item  ">
                            <a href="passengers.jsp" class='sidebar-link'>
                                <i class="bi bi-person-check-fill"></i>
                                <span>Passengers</span>
                            </a>
                        </li>

                  
                        <li class="sidebar-item  ">
                            <a href="booking.jsp" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Bookings</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item  ">
                            <a href="union.jsp" class='sidebar-link'>
                                <i class="bi bi-people"></i>
                                <span>Union</span>
                            </a>
                        </li>


                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        
        <!-- end side bar -->
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Vehicles</h3>
                           
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Vehicles</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    
                </div>
                
                <div align="right">
                  
                             <button type="button" class="btn btn-outline-info"
                                data-bs-toggle="modal" data-bs-target="#xlarge">
                                Add Vehicle
                            </button>
                  
                </div>
                <br>
                
                 <!--Modal Xl size -->
                                        <div class="me-1 mb-1 d-inline-block">
                                            

                                            <!--Extra Large Modal -->
                                            <div class="modal fade text-left w-100" id="xlarge" tabindex="-1"
                                                role="dialog" aria-labelledby="myModalLabel16" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-scrollable modal-xl"
                                                    role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="myModalLabel16">Add a Vehicle</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal"
                                                                aria-label="Close">
                                                                <i data-feather="x"></i>
                                                            </button>
                                                        </div>
                                                       
                                                       <form action="">
                                                        <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                   
                                     <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Select Driver</label>
											<select name="driver" id="driver" class="choices form-select">
											<%
											    String sql="Select * from driver";
												ResultSet rst = st.executeQuery(sql);
												while(rst.next()){
											%>
													<option ><%=rst.getString("name")%></option>
											<%} %>
												
											</select> 
										</div>
                                   
                                        <div class="col-md-4 mb-3">
											<label> Type</label> <input type="text" class="form-control"
												placeholder="" name="type" id="type" required>
										</div>

										<div class="col-md-4 mb-3">
                                                <label>Model</label>
                                                
                                                
                                                    <input class="form-control" name="model" id="model">
                                                        
                                                
                                            </div>
                                            
                                    
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Registration Number</label>
                                                    <input class="form-control" name="number" id="number">
                                            </div>
                                            
                                         <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Select Seat Range</label>
											<select name="seat" id="seat" class="choices form-select">
												<option value=""></option>
												<option >1 - 05</option>
												<option >5 - 10</option>
												<option >10 - 15</option>
												<option >15 - 26</option>
												<option >26 - 42</option>
												<option >42 - 64</option>
											</select> 
										</div>
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Fees</label>
                                                    <input class="form-control" name="fees" id="fees" readonly placeholder='0.00'>
                                            </div>
                                            </div>
                                                       
                                                       
                                                       </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light-secondary"
                                                                data-bs-dismiss="modal">
                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">Close</span>
                                                            </button>
                                                            <button type="button" class="btn btn-primary ml-1"
                                                                data-bs-dismiss="modal" onclick="addV()">
                                                                <i class="bx bx-check d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">Add Vehicle</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Modal full size -->
                                        
                                       
                                        <!--Modal Xl size -->
                                        <div class="me-1 mb-1 d-inline-block">
                                            

                                            <!--Extra Large Modal -->
                                            <div class="modal fade text-left w-100" id="xlarge1" tabindex="-1"
                                                role="dialog" aria-labelledby="myModalLabel16" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-scrollable modal-xl"
                                                    role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="myModalLabel16">Update Vehicle</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal"
                                                                aria-label="Close">
                                                                <i data-feather="x"></i>
                                                            </button>
                                                        </div>
                                                       
                                                       <form action="">
                                                        <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                   
                                     <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Driver</label>
											<input class="form-control" name="driver1" id="driver1">
										</div>
                                   
                                        <div class="col-md-4 mb-3">
											<label> Type</label> <input type="text" class="form-control"
												placeholder="" name="type1" id="type1" required>
										</div>

										<div class="col-md-4 mb-3">
                                                <label>Model</label>
                                                
                                                
                                                    <input class="form-control" name="model1" id="model1">
                                                        
                                                
                                            </div>
                                            
                                    
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Registration Number</label>
                                                    <input class="form-control" name="number1" id="number1">
                                            </div>
                                            
                                         <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Seat Range</label>
											<input class="form-control" name="seat1" id="seat1"> 
										</div>
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Fees</label>
                                                    <input class="form-control" name="fees1" id="fees1" readonly value="0.00">
                                            </div>
                                            </div>
                                                       
                                                       
                                                       </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light-secondary"
                                                                data-bs-dismiss="modal">
                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">Close</span>
                                                            </button>
                                                            <button type="button" class="btn btn-primary ml-1"
                                                                data-bs-dismiss="modal" onclick="edit()">
                                                                <i class="bx bx-check d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">update Vehicle</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Modal full size -->
                                       
                                        
                                        <script type="text/javascript">
												getall();
												
												function getall()
									            {
									                
									                $('#tbl-student').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "calData.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'getVehi'},
									                    
									                    success:function(data)
									                    {
									                        
									                       $('#tbl-student').dataTable({
									                           "aaData":data,
									                           "scrollX": false,
									                           
									                           
									                           "aoColumns":
									                                   [
									                              
									                                	   {"sTitle": "#","mData": "number"},
									                                    
									                                    {
									                                        "sTitle":
									                                        "Date",
									                                        "mData": "date",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                            
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Driver",
									                                        "mData": "driver",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Vehicle Type",
									                                        "mData": "vehileType",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Model",
									                                        "mData": "model",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Car Number",
									                                        "mData": "carNumber",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Seat Range",
									                                        "mData": "seatRange",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Fees",
									                                        "mData": "fees",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                  
									                                   
									                                   {
									                                        "sTitle":
									                                        "Action",
									                                        "mData": "letter",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a style="cursor:pointer; color:red" onclick="del('+ids+')"><i class="fa-regular fa-trash-can"></i></a>';
									                                        }
									                                   }, 
									                                  
									                                   ]
									                       });
									                      
									                    }  
									                  
									                });
									                
									            }
												
												function update(ids){
													sessionStorage.setItem("id",ids);
													$.ajax({
										        		  
										        		  type:"POST",
										        		  url:"calData.jsp",
										        		  data:{"myid" :ids,"option":'showV'},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			  $("#driver1").val(obj[0].driver);
										        			  $("#type1").val(obj[0].vehileType);
										        			  $("#model1").val(obj[0].model);
										        			  $("#number1").val(obj[0].carNumber);
										        			  $("#seat1").val(obj[0].seatRange);
										        			  $("#fees1").val(obj[0].fees);
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												
												 function addV(){
										        	  
												       alert("add called...."); 
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"calData.jsp",
										        		  data:{"driver":$("#driver").val() ,"type":$("#type").val(),"model":$("#model").val(),"number":$("#number").val(),"seat":$("#seat").val(),"fees":$("#fees").val(),"option":'addVehicle'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												 
												 function edit(){
										        	  
												      var id = sessionStorage.getItem("id");
												      
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"calData.jsp",
										        		  data:{"myid" :id,"Name":$("#driver1").val() ,"type":$("#type1").val(),"model":$("#model1").val(),"number":$("#number1").val(),"seat":$("#seat1").val(),
										        			  "fees":$("#fees1").val(),"option":'editV'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
										        	  
										          }
												 
												 
												 function del(id){
													 var doit = confirm("Do you want to delete data");
								            	      if(doit){
								            	    
								            	    	  gone(id);  
								            	    	  
								            	      }else
								            	    	  alertify.error(' Canceled ');
												 }
												 
								            	 function gone(id){   	
												 
														alert(id);
													
											        	  $.ajax({
											        		  type:"GET",
											        		  url:"calData.jsp",
											        		  data:{"myid" :id,"option":'deleteVehi'},
											        		 
											        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
											        		  success:function(msg){
											        			  
											        			  //var obj = JSON.parse(msg);
											        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
											        			  getall();
											        		  },
											        		  error(err){
											        			  alertify.error(' file not seen ');
											        		  }
											        		  
											        		  
											        	  })
											        	  
											          }
								            	 
											        //////////////////\\\\\\\\\\\\\\\\   On Select of drop down \\\\\\\\\\///////////
							            			 $("#seat").on('change', function(){
							            				 var val1 = $(this).val();
							            				 
							            				 if(val1 == '1 - 05'){
							            					 $('#fees').val('4.00');
							            				 }else if(val1 == '5 - 10'){
							            					 $('#fees').val('8.00');
							            				 }else if(val1 == '10 - 15'){
							            					 $('#fees').val('12.00');
							            				 }else if(val1 == '15 - 26'){
							            					 $('#fees').val('16.00');
							            				 }else if(val1 == '26 - 42'){
							            					 $('#fees').val('20.00');
							            				 }else if(val1 == '42 - 64'){
							            					 $('#fees').val('25.00');
							            				 }
							            				 
							            				 else{
							            					 $('#fees').val('0.00');
							            				 }
							            				 
							            				 
							            				 
							            				});
												
												</script>
                
                <section class="section">
                    <div class="card" style="width:100%;overflow-x:scroll;">
                        <div class="card-header">
                            Simple Datatable
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="tbl-student">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                   
                </div>
            </footer>
        </div>
    </div>
   <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

 

    <script src="assets/vendors/choices.js/choices.min.js"></script>
    <script src="assets/js/pages/form-element-select.js"></script>

    <script src="assets/js/main.js"></script></body>

</html>