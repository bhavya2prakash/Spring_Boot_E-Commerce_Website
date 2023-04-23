<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/static/images/favicon.ico">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Behance Organica</title>

	<script type = "text/javascript" src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<script type = "text/javascript" language = "javascript">
	  
			$(document).ready(function(){
					
				$(".error_form").hide();	
					
				var error_name = false;
				var error_add1 = false;
				var error_add2 = false;
				var error_zip = false;
				var error_city = false;
				var error_state = false;
				
				
				///////////////////////////////////////////////////////EVENT HANDLERS////////////////////////////////////////
				
		
				//////////////////////////////////////////////VALIDATION METHODS////////////////////////////////////////////////	
				function validateName(){
					var name  = new RegExp(/^[a-zA-Z ]*$/);
					if(name.test($(".namefield").val())){
						$(".name_error").hide();
				
					}
					else{
							$(".name_error").html("Enter Valid name between 3-25 characters. No special characters and digits allowed");
							$(".name_error").show();
							error_name = true;
					}
				}
				
				
				function validateAddress1(){
					var name  = new RegExp(/^[a-zA-Z0-9\-\s]+$/);
					if(name.test($(".add1").val())){
						$(".add1error").hide();
				
					}
					else{
							$(".add1error").html("Invalid Address. Only Alphanumeric Entries Allowed");
							$(".add1error").show();
							error_add1 = true;
					}
				}
				
				function validateAddress2(){
					var name  = new RegExp(/^[a-zA-Z0-9\-\s]+$/);
					if(name.test($(".add2").val())){
						$(".add2error").hide();
				
					}
					else{
							$(".add2error").html("Invalid Address. Only Alphanumeric Entries Allowed");
							$(".add2error").show();
							error_add2 = true;
					}
				}
				
				function validateCity(){
					var name  = new RegExp(/^[a-zA-Z]{2,25}$/);
					if(name.test($(".city").val())){
						$(".cityerror").hide();
				
					}
					else{
							$(".cityerror").html("Invalid City Name");
							$(".cityerror").show();
							error_city = true;
					}
				}
				
				function validateState(){
					var name  = new RegExp(/^[a-zA-Z]{3,25}$/);
					if(name.test($(".state").val())){
						$(".stateerror").hide();
				
					}
					else{
							$(".stateerror").html("Invalid State Name. Enter Full Name");
							$(".stateerror").show();
							error_state = true;
					}
				}
				
				function validateZip(){
					var name  = new RegExp(/^[0-9]{4,5}$/);
					if(name.test($(".zip").val())){
						$(".ziperror").hide();
				
					}
					else{
							$(".ziperror").html("Invalid Zip Code");
							$(".ziperror").show();
							error_zip = true;
					}
				}
				
				
				
				
				///////////////////////////////////////////////////////SUBMIT BUTTON VALIDATION///////////////////////////////////
				$(".deliveryForm").submit(function(){
					
					
					error_name = false;
					error_add1 = false;
					error_add2 = false;
					error_zip = false;
					error_city = false;
					var error_state = false;
				
					validateName();
					validateAddress1();
					validateAddress2();
					validateCity();
					validateState();
					validateZip();
					
					if(error_name == false && error_zip == false && error_state == false && error_city == false
							&& error_add1 == false && error_add2 == false){
						return true;
					}
					else{
						return false;
					}
					
				});
				
			});
	  
			
	  
	</script>




</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
		<div class="navbar-header">
		  <h3>Behance Organica</h3>
		</div>

	  </div>
	</nav>

		<div class="jumbotron">
			<div class="container">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3>Fill In Your Delivery Details</h3>
						</div>
						<div class="panel-body">
							<form action="payment" method="POST" class="deliveryForm">

								
							<div class="form-group">
							<label for="fullname">Name:</label>
							<input type="text" class="form-control namefield" name="fullname" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" required="required"><br>
							<span class = "error_form name_error"></span><br>
							<label for="email">Email ID:</label>
							<input type="email" class="form-control emailfield" name = "email" value="${sessionScope.user.emailId}" required="required"><br>
							<span class = "error_form emailerror"></span><br>
							<label for="contact">Contact Number :</label>
							<input type="text" class="form-control" name = "contact" value="${sessionScope.user.phoneNumber}" readonly = "true"><br>
							<span class = "error_form" id = "title_error"></span>
							<label for="usr">Shipping Address :</label>
							<input type="text" class="form-control add1" name = "address1" placeholder = "Address Line 1" required="required"><br>
							<span class = "error_form add1error"></span>
							<input type="text" class="form-control add2" name = "address2" placeholder = "Address Line 2" required="required"><br>
							<span class = "error_form add2error"></span><br>
							<input type="text" class="form-control city" name = "city" placeholder = "City" required="required"><br>
							<span class = "error_form cityerror"></span><br>
							<input type="text" class="form-control zip" name = "zip" placeholder = "Zip" required="required"><br>
							<span class = "error_form ziperror" id = "title_error"></span><br>
							<input type="text" class="form-control state" name = "state" placeholder = "State" required="required"><br>
							<span class = "error_form stateerror" id = "title_error"></span><br>
							</div>
							    <input type='hidden' value='${totalOrderWorth}' name='amount' />	
								<input type="submit" value=" Proceed To Payment" class="btn btn-primary btn-block">
							</form>

						</div>
				</div>
			
			</div>
		</div>




	
	
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>