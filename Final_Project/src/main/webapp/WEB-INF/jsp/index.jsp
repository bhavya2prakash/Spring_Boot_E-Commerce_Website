<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script type = "text/javascript" language = "javascript">

	</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg" style="background-color: #B2D2A4;">
	  <div class="container-fluid">
		 <span class="navbar-brand mb-0 h1">Behance Organica</span>
		
	  </div>
	</nav>
	<br>
	<br>
	<br>
	<section>
    <div class="container">
        <div class="row align-middle">
		<div class="col-sm-8 ">
		<div class="card">
			<div class="card-body">
		  <h2>Sign Up</h2>
		
			<form:form id="form1" action="register" modelAttribute="user" method="post">
				
				<!-- action="register" -->
				<table>
					<tr>
						<td>First Name:</td>
						<td><form:input path="firstName" class="form-control" id="firstName" size="30"/>
						</td>
					</tr>

					<tr>
						<td>Last Name:</td> 
						<td><form:input path="lastName" size="30" class="form-control" id="lastName" required="required"/>
						</td>
					</tr>
					
					<tr>
						<td>Email Id:</td>
						<td><form:input path="emailId" size="30" type="email" class="form-control" id="emailId" required="required"/></td>
					</tr>
					
					<tr>
						<td>Password:</td>
						<td><form:password path="password" size="30" class="form-control" id="password" required="required"/> </td>
					</tr>
					
					<tr>
						<td>Phone Number:</td>
						<td><form:input path="phoneNumber" size="30" class="form-control" id="phoneNumber"  required="required"/> </td>
					</tr>
								

					<tr>
						<td colspan="2"><input type="submit" value="Register User" id="submitButton"class="btn btn-primary"/></td>
					</tr>
				</table>

			</form:form>
		</div>
		</div>
		</div>
		<div class="col-sm-4 ">
		<div class="card">
			<div class="card-body">
		  <h2>Login</h2>
		      <form action="login" method="post">
	
									<table>
									<tr>
									    <td>Email ID:</td>
									    <td><input type="email" name="emailid" size="30" class="form-control" required="required" /></td>
									</tr>
									
									<tr>
									    <td>Password:</td>
									    <td><input type="password" name="password" size="30" class="form-control" required="required"/></td>
									</tr>
									
									<tr>
									    <td colspan="2"><input type="submit" value="Login" class="btn btn-primary"/></td>
									</tr>
											
									</table>

			</form>
		</div>
		</div>
		</div>
		
	  </div>
	</div>
	</section
	<br>
	<br>
	<br>
	<br>
	<ber>
	 <section id="about" class="container">
        <div class="container">
            <div class="row align-middle">

				<div class="col-sm-4 ">
                <img id="logo-main" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSorPZIR1n14VqNM_23Fi9bzKtqRi2zdQ8-XR2wBsxkJ0nEAd0t09SsMQ7gJTHSa0fj575xARWALi8&usqp=CAU&ec=48665698" alt="" class="img-fluid" >
				 </div>
                <div class="col-sm-8 ">
                    <br>
                    <p>
                       <b><i> Welcome to Behance Organica, your one-stop-shop for all things organic!</b></i></p>
                    <p>
                        At Behance Organica, we are committed to providing our customers with the highest quality organic products for their homes, bodies, and taste buds. Our extensive selection of organic food, beverages, beauty products, and home decor items are carefully curated to meet the needs and desires of our health-conscious and environmentally aware customers.</p>
                    <p>
                         We believe that everyone deserves access to healthy, sustainable, and organic products, which is why we work with small-scale farmers, artisans, and producers who share our values. We prioritize sourcing our products from local and regional suppliers to reduce our carbon footprint and support local economies.
                    </p>
					 <p>
                         Our organic food and beverage selection includes fresh produce, dairy, meat, bread, and pantry staples. We also carry a range of vegan and vegetarian options, as well as gluten-free and allergy-friendly products. Our beauty products are made from natural and organic ingredients, free from harmful chemicals and additives, and include skincare, haircare, and body care items.
                    </p>
                    
                </div>
				
            
       
      </div>
	  </div>
    </section>
	<br>
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