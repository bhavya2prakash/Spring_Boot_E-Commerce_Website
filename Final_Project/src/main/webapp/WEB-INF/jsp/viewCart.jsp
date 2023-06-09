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
<br><br>
		<c:if test="${fn:length(sessionScope.orderItemList) == 0}">
			<div class="jumbotron">
				<div class="container">
						
					<div class="panel panel-info">
					
							<div class="panel-heading">
								<h2>Cart</h2>
							</div>
							
							<div class="panel-body">
							
								<h4>Your cart is empty.<br>Its time to start shopping</h4>
							</div>
					</div>
				</div>
			</div>
		</c:if>



		<c:if test="${fn:length(sessionScope.orderItemList) > 0}">

				
		<div class="jumbotron">
				<div class="container">
						
					<div class="panel panel-info">
					
							<div class="panel-heading">
								<h2>Cart</h2>
							</div>
							
							<div class="panel-body">
							
										<c:forEach  var="orderItem" items="${sessionScope.orderItemList}">
							
								
											   <b>Brand: </b> ${orderItem.itemBrand}<br>
											   <b>Item Name: </b> ${orderItem.itemName}<br>
											   <b>Description: </b> ${orderItem.itemDescription}<br>
											   <b>Price per Unit: </b> ${orderItem.itemPrice}<br>
											   <b>Quantity Ordered: </b> ${orderItem.purchaseQuantity}<br>
											   <form action="remove" method="POST">
                                                <input type="hidden" value="${orderItem.itemName}" name="removeItem"/>
												<input type="submit" value="Remove Item" class="btn btn-outline-success">

										       </form>
											   <hr>
							
										</c:forEach>
										
										<form action="delivery" method="POST">

												<input type="submit" value="Proceed to Checkout" class="btn btn-primary btn-block">

										</form>
								
							</div>
					</div>
				</div>
			</div>

		</c:if>

<br><br><br><br>
	
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