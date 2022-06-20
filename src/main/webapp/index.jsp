<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"  errorPage="error.jsp"%>

<%@page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>

<%@page import="java.sql.*"%>
<%@page import= "java.util.Date"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
      <title>Caldriva</title>

  <!-- Favicons -->
  <link href="assets/images/profile.jpg" rel="icon">
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   
    <!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
   <style type="text/css">
   
                 html,body { 
	height: 100%; 
}

.global-container{
	height:100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

form{
	padding-top: 10px;
	font-size: 14px;
	margin-top: 30px;
}

.card-title{ font-weight:300; }

.btn{
	font-size: 14px;
	margin-top:20px;
}


.login-form{ 
	width:330px;
	margin:20px;
}

.sign-up{
	text-align:center;
	padding:20px 0 0;
}

.alert{
	margin-bottom:-30px;
	font-size: 13px;
	margin-top:20px;
}
   
   
$button-width: 150px;
$spinner-width: $button-width/6;
$blue: #0076d3;
$btn-bg: #8BC34A;
$text-light: #fefefe;

@import url(https://fonts.googleapis.com/css?family=Space+Mono);

*{ box-sizing: border-box;}
body{
  padding: 10px;
  font-size: 16px;
  font-family: 'Space Mono', sans-serif;
  text-align: center;
  background-color: #eaf0ff;
  color: #002868;
}

h1{
  font-size: 1.5em;
}

small{
  color: #888;
}

@media (min-width: 780px){
  .wrapper {
    width: 600px;
    display: grid;
    grid-template-columns: repeat(2, [col] calc(100%/2) );
    grid-auto-rows: 120px;
    margin: 30px auto 40px;
  }
}
.button{
  display: inline-block;
  min-width: $button-width;
  margin: 20px auto;
  background: $btn-bg;
  color: $text-light;
  font-size: 1.2em;
  padding: 1em;
  border-radius: 4px;
  text-align: center;
  position: relative;
  cursor: pointer;
  appearance: none;
  -webkit-appearance: none;
  border: 0;
  transition: border-radius linear 0.05s, width linear 0.05s;

  
  &:focus{
    outline: 0;
  }
  
  &.animate{
    width: $button-width/2.2;
    height: $button-width/2.2;
    min-width: 0;
    border-radius: 50%;
    color: transparent;
    
    &:after{
      position: absolute;
      content: '';
      width: $spinner-width;
      height: $spinner-width;
      border: 4px solid $text-light;
      border-radius: 50%;
      border-left-color: transparent;
      left: 50%;
      top: 50%;
      -webkit-transform: translate(-50%, -50%);
      transform: translate(-50%, -50%);
      animation: spin ease-in 2.5s forwards;
      animation-name: spin;
      -webkit-animation-name: spin; 
      transition-timing-function:ease-in-out;
      -webkit-transition-timing-function: ease-in-out;
      animation-duration: 2.5s;
      -webkit-animation-duration: 2.5s;
      animation-fill-mode: forwards;
      -webkit-animation-fill-mode: forwards;
    }

    &.success:before{
      position: absolute;
      content: '';
      width: $spinner-width;
      height: $spinner-width/2;
      border: 4px solid $text-light;
      border-right: 0;
      border-top: 0;
      left: 50%;
      top: 50%;
      -webkit-transform: translate(-50%, -50%) rotate(0deg) scale(0);
      transform: translate(-50%, -50%) rotate(0deg) scale(0);
      -webkit-animation: success ease-in 0.15s forwards;
      animation: success ease-in 0.15s forwards;
      animation-delay: 2.5s;
    }
    
    &.error{
      position: relative;
      -webkit-animation: vibrate ease-in 0.5s forwards;
      animation: vibrate ease-in 0.5s forwards;
      -webkit-animation-delay: 2.5s;
      animation-delay: 2.5s;
     
      &:before{
        color: #fff;
        position: absolute;
        content: '!';
        font-size: 1.8rem;
        font-weight: bold;
        text-align: center;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%) scale(0);
        transform: translate(-50%, -50%) scale(0);
        -webkit-animation: error ease-in 0.5s forwards;
        animation: error ease-in 0.5s forwards;
        animation-delay: 2.5s;
      }
    }
  }
}

    
@keyframes spin {
    0% { transform: translate(-50%, -50%) rotate(0deg) scale(1);}
    90% { transform: translate(-50%, -50%) rotate(1080deg) scale(1); }
    100% { transform: scale(0); }
    }

@-webkit-keyframes spin {
  0% {-webkit-transform: translate(-50%,-50%) rotate(0deg) scale(1);}

  98% {-webkit-transform: translate(-50%,-50%) rotate(1080deg) scale(1);}

  100% {-webkit-transform: translate(-50%,-50%) rotate(1080deg) scale(0);}
}
    
@keyframes success{
    from {
       transform: translate(-50%, -50%) rotate(0) scale(0);
       }
    to {
      transform: translate(-50%, -50%) rotate(-45deg) scale(1);
    }
}

@-webkit-keyframes success{
    from {
       -webkit-transform: translate(-50%, -50%) rotate(0) scale(0);
       }
    to {
      -webkit-transform: translate(-50%, -50%) rotate(-45deg) scale(1);
    }
}

@keyframes error {
    from { 
    transform: translate(-50%, -50%) scale(0);
    }
    to { 
    transform: translate(-50%, -50%) scale(1);
    background-color: #f44336;
    }
}

@-webkit-keyframes error {
    from { 
    -webkit-transform: translate(-50%, -50%) scale(0);
    }
    to { 
    -webkit-transform: translate(-50%, -50%) scale(1);
    background-color: #f44336;
    }
}


@keyframes vibrate {
    0%, 30%, 60%, 85%, 100% { 
      left: 0;
      background-color: #f44336;
    }
    10%, 40%, 90%, 70% { 
      left: -2px;
      background-color: #f44336;
    }
    20%, 50%, 80%, 95% { 
      left: 2px;
      background-color: #f44336;
    }
}
   
   
   </style> 
   
   <!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
   
   
   <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    
</head>

<script type="text/javascript">

var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },6000);
	};

	var classname = document.getElementsByClassName("button");

	for (var i = 0; i < classname.length; i++) {
	  classname[i].addEventListener('click', animateButton, false);
	}

</script>

<div class="global-container">
	<div class="card login-form">
	<div class="card-body">
	<h3>C A L D R I V A </h3>
		<div class="card-text">
	            <br>
	            <div align="center">
				 <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" viewBox="0 0 16 16">
			      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			      <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			      </svg>
	            
	            </div>
			
			<form action="logIn" method="post" id="myform">
				
				<div class="form-group">
					<label >Union</label>
					<input type="text" class="form-control " name="union"required>
				</div>
				<div class="form-group">
					<label>Branch</label>
					
					<input type="text" class="form-control" name="branch" required>
				</div>
				
				<div class="form-group">
					<label>Password</label>
					
					<input type="password" class="form-control" name="pass" required>
				</div>

<div class="wrapper">
<div class="block"><br><button class="btn btn-success" type="submit" onclick="testClear()">Log in <i class="fa-solid fa-right-to-bracket"></i></button></div>



</div>

<script type="text/javascript">
function testClear(){
	var f=document.getElementById("myform");
	
	
	function delay(delayInms) {
		  return new Promise(resolve => {
		    setTimeout(() => {
		      resolve(2);
		    }, delayInms);
		  });
		}

		async function sample() {
			f.submit();
		  let delayres = await delay(3000);
		  f.reset();
		}
		sample();
}
</script>

<progress></progress>
 
				
				
			</form>
		</div>
	</div>
</div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>






