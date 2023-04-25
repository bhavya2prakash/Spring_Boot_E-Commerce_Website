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
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">
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
				var error_email=false;
				var error_phone=false;
				
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
				function validateEmail(){
					var name  = new RegExp(/^([a-zA-Z0-9_\-.]+)@([a-zA-Z0-9_\-.]+)\.([a-zA-Z]{2,5})$/);
					if(name.test($(".emailfield").val())){
						$(".emailerror").hide();
				
					}
					else{
							$(".emailerror").html("Enter Valid email id");
							$(".emailerror").show();
							error_email = true;
					}
				}
				function validatePhone(){
					var name  = new RegExp(/^\d{3}-\d{3}-\d{4}$/);
					if(name.test($(".phonefield").val())){
						$(".phoneerror").hide();
				
					}
					else{
							$(".phoneerror").html("Enter Valid Phone Number");
							$(".phoneerror").show();
							error_phone = true;
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
				error_state = false;
				error_email=false;
				error_phone=false;
				
					validateName();
					validateEmail();
					validatePhone();
					validateAddress1();
					validateAddress2();
					validateCity();
					validateState();
					validateZip();
					
					if(error_name == false && error_phone==false && error_email==false && error_zip == false && error_state == false && error_city == false
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
	 <nav class="navbar navbar-expand-lg" style="background-color: #B2D2A4;">
	  <div class="container-fluid">
		 <span class="navbar-brand mb-0 h1">Behance Organica    Hi, ${user.firstName}</span>
		<form class="form-inline" action="logout" method="POST">
		<button class="btn btn-outline-success" type="submit">Logout</button>
		
       </form>
	  </div>
	</nav>
<br>
		<div class="jumbotron">
			<div class="container">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3>Fill In Your Delivery Details</h3><br>
						</div>
						<div class="panel-body">
							<form action="payment" method="POST" class="deliveryForm">

								
							<div class="form-group">
							<label for="fullname">Name:</label>
							<input type="text" class="form-control namefield" name="fullname" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" required="required"><br>
							<span class = "error_form name_error" style="color:red;"></span><br>
							<label for="email">Email ID:</label>
							<input type="email" class="form-control emailfield" name = "email" value="${sessionScope.user.emailId}" required="required"><br>
							<span class = "error_form emailerror"style="color:red;"></span><br>
							<label for="contact">Contact Number :</label>
							<input type="text" class="form-control phonefield" name = "contact" value="${sessionScope.user.phoneNumber}"><br>
							<span class = "error_form phoneerror" id = "title_error" style="color:red;"></span>
							<br>
							<label for="usr">Shipping Address :</label>
							<input type="text" class="form-control add1" name = "address1" placeholder = "Address Line 1" required="required"><br>
							<span class = "error_form add1error" style="color:red;"></span>
							<input type="text" class="form-control add2" name = "address2" placeholder = "Address Line 2" required="required"><br>
							<span class = "error_form add2error" style="color:red;"></span><br>
							<input type="text" class="form-control city" name = "city" placeholder = "City" required="required"><br>
							<span class = "error_form cityerror" style="color:red;"></span><br>
							<input type="text" class="form-control zip" name = "zip" placeholder = "Zip" required="required"><br>
							<span class = "error_form ziperror" id = "title_error" style="color:red;"></span><br>
							<input type="text" class="form-control state" name = "state" placeholder = "State" required="required"><br>
							<span class = "error_form stateerror" id = "title_error" style="color:red;"></span><br>
							</div>
							<br>
							    <input type='hidden' value='${totalOrderWorth}' name='amount' />	
								<input type="submit" value=" Proceed To Payment" class="btn btn-primary btn-block">
							</form>

						</div>
				</div>
			
			</div>
		</div>

<br>
<br>
	  <!-- Footer -->
    <footer class="text-center text-lg-start bg-dark text-muted">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
            style="background-color: #B2D2A4; color: white; border: none;">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social platforms</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5" style="color: white;" >
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <img height="37px" src="images/D.png" alt="">
                    </div>
                    <!-- Grid column -->

                    

                   

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                        <p><i class="fas fa-home me-3"></i> Boston, MA</p>
                        <p>

                            <a href="mailto: behance.organica@gmail.com" class="text-reset"> <i
                                    class="fas fa-envelope me-3"></i>
                                behance.organica@gmail.com </a>
                        </p>
                        <p> <a href="tel: +1123456788" class="text-reset"> <i class="fas fa-phone me-3"></i> + 01 234
                                567 88 </a></p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
            <p style="margin-bottom: 0;">
                &copy; 2023 Made by Bhavya Prakash
            </p>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->

	
	
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>