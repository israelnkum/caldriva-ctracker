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
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/profile.jpg" type="image/x-icon">
    
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
	ResultSet resultSet = st.executeQuery("select * from login where branch='admin'");
	
	while(resultSet.next()){
		b=resultSet.getString("branch");
		u=resultSet.getString("unions");
		p=resultSet.getString("password");
	}
        if(!branch.equals("Union")&& !branch.equals("admin")){
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
			                         <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#reset" style="cursor:pointer"><i class="fa-solid fa-wrench"></i> &nbsp; Account Reset</a>
			                         <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#branch" style="cursor:pointer"><i class="fa-solid fa-user-group"></i>  &nbsp;  &nbsp;Add Branch Manager</a>
			                         <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#field" style="cursor:pointer"><i class="fa-solid fa-chalkboard-user"></i> &nbsp;  &nbsp;Add field staff </a>
			                         <a class="dropdown-item" href="logOut" style="cursor:pointer;"><i class="fa-solid fa-right-from-bracket"></i> &nbsp;  &nbsp; Logout</a>
			                     </div>
			                 </div>
			             </div>
                           </div>
                                </div>
                            </div>
                         <!--Danger theme Modal -->
                            <div class="modal fade text-left" id="reset" tabindex="-1"
                                role="dialog" aria-labelledby="myModalLabel120"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                    role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-danger">
                                            <h5 class="modal-title white" id="myModalLabel120">
                                                Reset Your Account
                                            </h5>
                                            <button type="button" class="close"
                                                data-bs-dismiss="modal" aria-label="Close">
                                                <i data-feather="x"></i>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                          <div class="row">
                                            <div class="col-sm-4">
					                         <label>Union</label>
					                         <input class="form-control form-control-sm" type="text"
					                             >
					                     </div>
					                     
					                     <div class="col-sm-4">
					                         <label>Branch</label>
					                         <input class="form-control form-control-sm" type="text"
					                             >
					                     </div>
					                     
					                     <div class="col-sm-4">
					                         <label>Password</label>
					                         <input class="form-control form-control-sm" type="text"
					                             >
					                     </div>
					                     </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button"
                                                class="btn btn-light-secondary"
                                                data-bs-dismiss="modal">
                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                <span class="d-none d-sm-block">Close</span>
                                            </button>
                                            <button type="button" class="btn btn-danger ml-1"
                                                data-bs-dismiss="modal">
                                                <i class="bx bx-check d-block d-sm-none"></i>
                                                <span class="d-none d-sm-block">Reset</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            
                            
                            <div class="modal fade text-left" id="field" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Add a Field Staff
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                      <div class="form-group floating-label col-md-6 mb-3">
																			<label for="" class="mt-1">Select Union</label>
																				<select name="driver" id="fUnion" class="choices form-select">
																				<%
																				    String sql="Select * from union1";
																				   
																					ResultSet rst = st.executeQuery(sql);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("unionName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                        
							                                        <div class="form-group floating-label col-md-6 mb-3">
																			<label for="" class="mt-1">Select Branch</label>
																				<select name="driver" id="fbranch" class="choices form-select">
																				<%
																				    String sql6="Select * from branch";
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql6);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("branchName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                     <div class="col-sm-6">
							                                            <label>Staff's Name</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                id="staff">
							                                        </div>
							                                        
							                                        <div class="col-sm-6">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                                id="staffPass">
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-bs-dismiss="modal">
                                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                                        <span class="d-none d-sm-block">Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger ml-1"
                                                                        data-bs-dismiss="modal" onclick="addFieldStaff()">
                                                                        <i class="bx bx-check d-block d-sm-none"></i>
                                                                        <span class="d-none d-sm-block">add Staff</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                     <div class="modal fade text-left" id="branch" tabindex="-1"
                                                        role="dialog" aria-labelledby="myModalLabel120"
                                                        aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                            role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header bg-danger">
                                                                    <h5 class="modal-title white" id="myModalLabel120">
                                                                        Add Branch Manager
                                                                    </h5>
                                                                    <button type="button" class="close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                  <div class="row">
                                                                   
							                                        
							                                        <div class="form-group floating-label col-md-6 mb-3">
																			<label for="" class="mt-1">Select Union</label>
																				<select name="driver" id="bUnion" class="choices form-select">
																				<%
																				    String sql4="Select * from union1";
																				    
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql4);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("unionName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
							                                        
							                                        
							                                        <div class="form-group floating-label col-md-6 mb-3">
																			<label for="" class="mt-1">Select Branch</label>
																				<select name="driver" id="branch" class="choices form-select">
																				<%
																				    String sql1="Select * from branch";
																				    
																					 st = con.createStatement();
																					 rst = st.executeQuery(sql1);
																					while(rst.next()){
																				%>
																						<option ><%=rst.getString("branchName")%></option>
																				<%} %>
																					
																				</select> 
																			</div>
																			
																  <div class="col-sm-6">
							                                            <label>Manager's Name</label>
							                                            <input class="form-control form-control" type="text"
							                                                id="bName" required>
							                                        </div>
							                                        
							                                        <div class="col-sm-6">
							                                            <label>Password</label>
							                                            <input class="form-control form-control-sm" type="text"
							                                            id="bpass" required>
							                                        </div>
							                                        </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button"
                                                                        class="btn btn-light-secondary"
                                                                        data-bs-dismiss="modal">
                                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                                        <span class="d-none d-sm-block">Close</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-danger ml-1"
                                                                        data-bs-dismiss="modal" onclick="addBranch()">
                                                                        <i class="bx bx-check d-block d-sm-none"></i>
                                                                        <span class="d-none d-sm-block">Authenticate Branch Manager</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>      


                          <%
     String dash = branch;
     String dashPage="";
     String admin = "adminDashboard.jsp";
     String union1 = "unionDashboard.jsp";
     String branch1 = "BranchDashboard.jsp";
     
       if(dash.equals("admin")){
       	dashPage = admin;
       }else if(dash.equals("union")){
       	dashPage = union1;
       	
       }else{
       	dashPage = branch1;
       }
     
     %>

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
<script src="jquery-3.6.0.js" type="text/javascript"></script>
<script src="component/jquery/jquery.min.js" type="text/javascript"></script>
<script src="component/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">

$(window).on('load', function() {
    //for use in production please remove this setTimeOut
    setTimeout(function(){ 
        $('.preloader').addClass('preloader-deactivate');
    }, 30);
    //uncomment this line for use this snippet in production
    //	$('.preloader').addClass('preloader-deactivate');
});
trip();
tBranch();
tVehicles();
tTrips();
tDrivers();
profit();
tUncompleted();
function addBranch(){
	  
    alert("add called...."); 
    $.ajax({
 		  
 		  type:"POST",
 		  url:"calData.jsp",
 		  data:{"branch":$("#branch").val(),"name":$("#bName").val(),"union":$("#bUnion").val(),"pass":$("#bPass").val(),"option":'addbranchM'},
 		 
 			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
 		  success:function(msg){
 			  var obj = JSON.parse(msg);
 			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
 			  
 		  },
 		  error(err){
 			  alertify.error('Error');
 		  }
 		  
 		  
 	  })
	  
}

function addFieldStaff(){
	  
    alert("add called...."); 
    $.ajax({
 		  
 		  type:"POST",
 		  url:"calData.jsp",
 		  data:{"union":$("#fUnion").val(),"branch":$("#fbranch").val(),"name":$("#staff").val(),"pass":$("#staffPass").val(),"option":'addstaff'},
 		 
 			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
 		  success:function(msg){
 			  var obj = JSON.parse(msg);
 			  var notification = alertify.notify('Success', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
 			  
 		  },
 		  error(err){
 			  alertify.error('Error');
 		  }
 		  
 		  
 	  })
	  
}


function trip(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'unionDash'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  var obj = JSON.parse(msg);
			  var datapoints = obj[0].dataPoints;
			  
			  alert(datapoints);
			  var options = {
					  chart: {
					      height: 350,
					      type: 'bar',
					  },
					 
					  series: [],
					  colors: '#435ebe',
					  noData: {
					    text: 'Loading...'
					  }
					}

					var chart = new ApexCharts(
					  document.querySelector("#chart"),
					  options
					);

					chart.render();
					
					var url = 'un.jsp';

					$.getJSON(url, function(response) {
					  chart.updateSeries([{
					    name: 'Sales',
					    data: response
					  }])
					});

		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}

function profit(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'unionDash1'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  var obj = JSON.parse(msg);
			  var datapoints = obj[0].dataPoints;
			  
			  alert(datapoints);
			  var options = {
					  chart: {
					      height: 350,
					      type: 'bar',
					  },
					 
					  series: [],
					  colors: '#435ebe',
					  noData: {
					    text: 'Loading...'
					  }
					}

					var chart = new ApexCharts(
					  document.querySelector("#chart1"),
					  options
					);

					chart.render();
					
					var url = 'un1.jsp';

					$.getJSON(url, function(response) {
					  chart.updateSeries([{
					    name: 'Sales',
					    data: response
					  }])
					});

		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}




function tBranch(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'tBranch'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  
			  var obj = JSON.parse(msg);
			
				  // var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			  $("#tBranch").html(obj[0].totalB);
			  $("#tstation").html(obj[0].totalB);
   			 
			  
		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}

function tVehicles(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'tVehicles'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  
			  var obj = JSON.parse(msg);
			
				 //   var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			  $("#tVehicles").html(obj[0].totalV);
   			 
			  
		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}


function tTrips(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'tTrips'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  
			  var obj = JSON.parse(msg);
			
				 //   var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			  $("#trips").html(obj[0].totalTr);
  			 
			  
		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}

function tDrivers(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'tDrivers'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  
			  var obj = JSON.parse(msg);
			  alert(obj[0].totalDri);
				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			  $("#dri1").html(obj[0].totalDri);
   			 
			  
		  },
		  error(err){
			  alertify.error(' an error occured');
		  }
		  
		  
	  })
}

function tUncompleted(){
	 $.ajax({
		  type:"GET",
		  url:"unionDash.jsp",
		  data:{"option":'tUncompleted'},
		 
			  /*------------------------------------   Ajax call area  ------------------------------------------------*/
		  success:function(msg){
			  
			  var obj = JSON.parse(msg);
			
				 //  var notification = alertify.notify('ID Exists', 'success', 5, function(){  console.log('dismissed'); }); alertify.set('notifier','position', 'top-right');
			  $("#uncomp").html(obj[0].totalUnc);
   			 
			  
		  },
		  error(err){
			  alertify.error(' an error occured');
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
                        
                            <a href="<% out.println(dashPage);%>" class='sidebar-link'>
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
                <h3>U N I O N - D A S H B O A R D</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12 col-lg-9">
                        <div class="row">
                           
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon blue">
                                                    <i class="iconly-boldProfile"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total Branches</h6>
                                                <h4><div id="tBranch"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon green">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total number of vehicles</h6>
                                                <h4><div id="tVehicles"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon red">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Trips</h6>
                                                <h4><div id="trips"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon orange">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total number of Stations</h6>
                                                <h4><div id="tstation"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                          
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon yellow">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total Under Speeding</h6>
                                                <h4><div id="underSpeed"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon green">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total Number Of Over Speeding</h6>
                                                <h4><div id="overSpeed"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <div class="card-body px-3 py-4-5">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="stats-icon blue">
                                                    <i class="iconly-boldBookmark"></i>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <h6 class="text-muted font-semibold">Total Uncompleted Trips</h6>
                                                <h4><div id="uncomp"></div></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Union Monthly Income</h4>
                                    </div>
                                    <div class="card-body">
                                        <div id="chart1"></div>
                                        <script src="assets/vendors/apexcharts/apexcharts.js"></script>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                         <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Total Monthly Trip Count</h4>
                                    </div>
                                    <div class="card-body">
                                    <div id="chart"></div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-12 col-lg-3">
                        <div class="card">
                            <div class="card-body py-4 px-5">
                                <div class="d-flex align-items-center">
                                    <div class="avatar avatar-xl">
                                        <img src="assets/images/faces/1.jpg" alt="Face 1">
                                    </div>
                                    <div class="ms-3 name">
                                        <h5 class="font-bold">Total number of drivers</h5>
                                        <h4><div id="dri1"></div></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                 
                        <div class="card">
                            <div class="card-header">
                                <h4>Completed Vs Uncompleted Trips</h4>
                            </div>
                            <div class="card-body">
                                <div id="chart-visitors-profile1"></div>
                                
                                <script type="text/javascript">
                                
                                let optionsVisitorsProfile1  = {
                                		series: [70, 30],
                                		labels: ['Complete Trips', 'Uncompleted Trips'],
                                		colors: ['#435ebe','#55c6e8'],
                                		chart: {
                                			type: 'donut',
                                			width: '100%',
                                			height:'350px'
                                		},
                                		legend: {
                                			position: 'bottom'
                                		},
                                		plotOptions: {
                                			pie: {
                                				donut: {
                                					size: '30%'
                                				}
                                			}
                                		}
                                	}
                                
                                var chartVisitorsProfile1 = new ApexCharts(document.getElementById('chart-visitors-profile1'), optionsVisitorsProfile1);
                                chartVisitorsProfile1.render();
                                
                                </script>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <footer>
                
            </footer>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    
    <script src="assets/js/pages/dashboard.js"></script>

    <script src="assets/js/main.js"></script>
</body>

</html>