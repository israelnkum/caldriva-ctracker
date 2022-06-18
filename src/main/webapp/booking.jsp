<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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

    <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/caldriva","root","root");
	Statement st = con.createStatement();
    String union = (String)session.getAttribute("name");
    String branch = (String)session.getAttribute("branch");
    String pass = (String)session.getAttribute("pass");
  	try{
	 

	String b=null;
	String p=null;
	String u=null;
        response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	ResultSet resultSet = st.executeQuery("select * from login where unions='"+union+"' and branch='"+branch+"' and '"+pass+"'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		u=resultSet.getString("unions");
		p=resultSet.getString("password");
	}
        if(!pass.equals(p) || !branch.equals(b) || !union.equals(u)|| pass.equals(null) || pass.equals("")){
              response.sendRedirect("index.jsp");   
        }
  	}catch(Exception e){
  		 response.sendRedirect("index.jsp"); 
  		 
  	}
   %>

  <div class="card">
         <div class="card-body" align="right">
             <div class="badges">
                
                
                <span class="badge bg-light-success"><i class="fa-solid fa-circle-user fa-xl" style="hight:50; width:50;"></i>&nbsp;<%out.println(union); %></span>
                 <div class="btn-group me-1 mb-1">
			                 <div class="dropdown">
			                     <button type="button" class="btn btn-danger dropdown-toggle"
			                         data-bs-toggle="dropdown" aria-haspopup="true"
			                         aria-expanded="false">
			                         <i class="fa-solid fa-gear"></i>
			                     </button>
			                     <div class="dropdown-menu">
			                         <a class="dropdown-item" href="#"><i class="fa-solid fa-chart-pie"></i>  Generate Report</a>
			                         <a class="dropdown-item" href="logOut" style="cursor:pointer;"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;  &nbsp; Logout</a>
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
                            <h3>Booking</h3>
                           
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Booking</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    
                </div>
                
                <div align="right">
                  
                             <button type="button" class="btn btn-outline-info"
                                data-bs-toggle="modal" data-bs-target="#xlarge">
                                Add a Booking
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
                                                            <h4 class="modal-title" id="myModalLabel16">Add a Booking</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal"
                                                                aria-label="Close">
                                                                <i data-feather="x"></i>
                                                            </button>
                                                        </div>
                                                       
                                                       <form id="bookForm">
                                                        <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                        
                                        <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Select Trip</label>
											<select name="trip" id="trip" class="choices form-select">
											<%
											    String sql="Select * from trip";
											    
												ResultSet rst = st.executeQuery(sql);
												while(rst.next()){
											%>
												<option ><%=rst.getString("trip") %></option>
											<%} %>	
											</select> 
										</div>
                                        
										<div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">ID Number</label>
											<input class="form-control" name="idNumber" id="idNumber">
										</div>
									
									   <div class="col-md-4 mb-3">
                                                <label>Passeger's Name</label>
                                                    <input class="form-control" name="passenger" id="passenger">
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Passenger's Phone</label>
                                                    <input class="form-control" name="phone" id="phone" type="number">
                                            </div>
                                            
                                     
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Emergency Phone</label>
                                                    <input class="form-control" name="ephone" id="ephone" type="tel">
                                            </div>
                                            
                                          <div class="col-md-4 mb-3">
                                                <label>Destination</label>
                                                    <input class="form-control" name="destination" id="destination">
                                            </div>
                                           
                                            <div class="col-md-4 mb-3">
                                            <label>Seat Number</label>
                                            <div class="input-group mb-3">
                                                    <input class="form-control" name="seat" id="seat" readonly>
                                                    <button class="btn btn-dark" type="button"
                                                       onclick="openSeat()" title="open this field"><i class="fa-solid fa-lock-open"></i></button>
                                                </div>
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
                                                                onclick="add()">
                                                                <i class="bx bx-check d-block d-sm-none"></i>
                                                                <span class="d-none d-sm-block">Add Booking</span>
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
                                                            <h4 class="modal-title" id="myModalLabel16">Update Booking</h4>
                                                            <button type="button" class="close" data-bs-dismiss="modal"
                                                                aria-label="Close">
                                                                <i data-feather="x"></i>
                                                            </button>
                                                        </div>
                                                       
                                                       <form action="">
                                                        <div class="form-group row  container justify-content-center">
                                   <!-- Employee Details  -->
                                        
										
									
									   <div class="col-md-4 mb-3">
                                                <label>Passeger's Name</label>
                                                    <input class="form-control" name="passenger1" id="passenger1">
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Passenger's Phone</label>
                                                    <input class="form-control" name="phone1" id="phone1" type="number">
                                            </div>
                                            
                                     
                                            
                                             <div class="col-md-4 mb-3">
                                                <label>Emergency Phone</label>
                                                    <input class="form-control" name="ephone1" id="ephone1" type="tel">
                                            </div>
                                            
                                        <div class="form-group floating-label col-md-4 mb-3">
										<label for="" class="mt-1">Trip</label>
											<input name="trip1" id="trip1" class="form-control">
											
										</div>
										
                                            
                                          <div class="col-md-4 mb-3">
                                                <label>Destination</label>
                                                    <input class="form-control" name="destination1" id="destination1">
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <label>Seat Number</label>
                                                    <input class="form-control" name="seat1" id="seat1">
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
                                                                <span class="d-none d-sm-block">Update Booking</span>
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
									                
									                $('#table2').dataTable().fnDestroy();
									                $.ajax({
									                    
									                    url: "calData.jsp",
									                    type : "GET",
									                    dataType : "JSON",
									                    data:{"option":'getBook'},
									                    
									                    success:function(data)
									                    {
									                        
									                       $('#table2').dataTable({
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
									                                        "Passenger",
									                                        "mData": "passengerName",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Passenger Phone",
									                                        "mData": "passengerPhone",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   {
									                                        "sTitle":
									                                        "Emergency Phone",
									                                        "mData": "emergencyPhone",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                 
									                                   {
									                                        "sTitle":
									                                        "Trip",
									                                        "mData": "trip",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Destination",
									                                        "mData": "destination",
									                                        "render" : function(mData,type,row,meta)
									                                        {
									                                        	var ids =row["id"];
									                                        	return '<a data-bs-toggle="modal" data-bs-target="#xlarge1" style="cursor:pointer;" onclick="update('+ids+')">'+mData+'</a>';
									                                        }
									                                   },
									                                   
									                                   {
									                                        "sTitle":
									                                        "Seat Number",
									                                        "mData": "seatNumber",
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
										        		  data:{"myid" :ids,"option":'showBook'},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			  $("#passenger1").val(obj[0].passengerName);
										        			  $("#phone1").val(obj[0].passengerPhone);
										        			  $("#ephone1").val(obj[0].emergencyPhone);
										        			  $("#trip1").val(obj[0].trip);
										        			  $("#destination1").val(obj[0].destination);
										        			  $("#seat1").val(obj[0].seatNumber);
										        			 
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												
												function logOut(){
													alert("Logging out ............");
													
													$.ajax({
										        		  
										        		  type:"POST",
										        		  url:"logOut",
										        		  data:{"myid" :ids},
										        		  
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			
										        			
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error('Error');
										        		  }
										        		  
										        		  
										        	  })
												}
												
												
												 function add(){
										        	  
												       
										        	  $.ajax({
										        		  
										        		  type:"POST",
										        		  url:"calData.jsp",
										        		  data:{"idNumber":$("#idNumber").val(),"passenger":$("#passenger").val() ,"phone":$("#phone").val(),"ephone":$("#ephone").val(),"trip":$("#trip").val(),"destination":$("#destination").val(),"seat":$("#seat").val(),"option":'addBook'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  var obj = JSON.parse(msg);
										        			  var pPhone = obj[0].phone;
										        			  alert(pPhone);
										        			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        			  getall();
										        			  $("#seat").attr('readonly','true');
										        			  $('#bookForm')[0].reset();
										        			  
										        			  message(pPhone);
										        			  
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
										        		  data:{"myid" :id,"passenger":$("#passenger1").val() ,"phone":$("#phone1").val(),"ephone":$("#ephone1").val(),"trip":$("#trip1").val(),"destination":$("#destination1").val(),"seat":$("#seat1").val(),"option":'editBook'},
										        		 
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
											        		  data:{"myid" :id,"option":'deletepass'},
											        		 
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
												
								            	 
								            	 function bring(val){
								            		 $.ajax({
										        		  type:"GET",
										        		  url:"calData.jsp",
										        		  data:{"search" :val,"option":'searchID'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        			  var obj = JSON.parse(msg);
										        			
										        			  
										        			  
										        			  
										        			  if(obj.length == 0){
										        				  
										        				  $('#passenger').val('').removeAttr('readonly');
										        				  $('#phone').val('').removeAttr('readonly');
										        				  $('#ephone').val('').removeAttr('readonly');
										        				  
										        				  
										        			  }else{
										        				   var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        				  $("#passenger").val(obj[0].passengerName).attr('readonly','true');
											        			  $("#phone").val(obj[0].passengerPhone).attr('readonly','true');
											        			  $("#ephone").val(obj[0].emergencyPhone).attr('readonly','true');
										        			  }
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
										        		  }
										        		  
										        		  
										        	  })
								            	 }
								            	 
								            	 function seat(val){
								            		 $.ajax({
										        		  type:"GET",
										        		  url:"calData.jsp",
										        		  data:{"seat" :val,"option":'seat'},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        			  var obj = JSON.parse(msg);
										        			
										        				   var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
										        				  $("#seat").val(obj[0].seatForU);
											        			 
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
										        		  }
										        		  
										        		  
										        	  })
								            	 }
								         
								         
								        //////////////////\\\\\\\\\\\\\\\\   On Select of drop down \\\\\\\\\\///////////
								            			 $("#trip").on('change', function(){
								            				 var val = $(this).val();
								            				
								            				 seat(val);
								            				 
								            				});
								            			 
								        //////////////////\\\\\\\\\\\\\\\\   On Typing \\\\\\\\\\///////////	 
								            			 
								            			 var typingTimer;                //timer identifier
								            			 var doneTypingInterval = 500;  //time in ms, 5 second for example

								            			 //on keyup, start the countdown
								            			 $('#idNumber').keyup(function(){
								            			     clearTimeout(typingTimer);
								            			     if ($('#idNumber').val) {
								            			         typingTimer = setTimeout(function(){
								            			             //do stuff here e.g ajax call etc....
								            			              var v = $("#idNumber").val();
								            			              bring(v);
								            			              //$("#out").html(v);
								            			         }, doneTypingInterval);
								            			     }
								            			 });
								            			 
								            		function openSeat(){
								            			
								            			$("#seat").removeAttr('readonly')
								            		}	 
								            			 
								               //////////////////\\\\\\\\\\\\\\\\   On Select of drop down \\\\\\\\\\///////////
								               
								                function message(number){
								            	   alert("Message Called " +number);
								            		 $.ajax({
										        		  type:"POST",
										        		  url:"hellio",
										        		  data:{"phone" :number},
										        		 
										        			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
										        		  success:function(msg){
										        			  
										        		  },
										        		  error(err){
										        			  alertify.error(' an error occured');
										        		  }
										        		  
										        		  
										        	  })
								            	 }
								               
												</script>
                
                
                <section class="section">
                    <div class="card" style="width:100%;overflow-x:scroll;">
                        <div class="card-header">
                            Simple Datatable
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="table2">
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

    <script src="assets/js/main.js"></script>
</body>

</html>