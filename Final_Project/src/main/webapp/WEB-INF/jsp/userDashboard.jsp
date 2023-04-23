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
		
	  </div>
	</nav>
	<br>
	<br>
	<br>
     <div class="container">
        <div class="row align-middle">
		<div class="col-sm-6 ">
		<div class="card">
			<div class="card-body">
	           <form action="searchproduct" method="GET">

				<label for="category">What Do you wish to buy:</label>
				<select name="category" id="product" class="form-control">
				    <option value="Select" disabled selected>Select</option>
					<option value="food">Food</option>
					<option value="beverages">Beverages</option>
					<option value="beauty">Beauty</option>
					<option value="home">Home Decor</option>
					<option value="fashion">Fashion</option>
				</select>
					
					<input type="submit" value="Find Products"  class="btn btn-primary">

				</form>
	</div>
	  </div>	
    </div>	
	<div class="col-sm-3 ">
	<div class="card">
			<div class="card-body">
	<form action="trackorder" method="GET">
		
	<input type="submit" class="btn btn-primary" value="Track Your Orders">

	</form>
	</div>
	</div>
	</div>
	<div class="col-sm-3 ">
	<div class="card">
			<div class="card-body">
	
	<form action="cart" method="POST">
			<input type="submit" class="btn btn-primary" value="View Cart">
		</form>
	</div>
    </div>	
	</div>
    </div>	
    </div>	
	<br>
	<br>
	<br>
	  <div class="container">
        <div class="row align-middle">
		<div class="col-sm-12">
	<c:choose>  
    <c:when test="${fn:length(searchItemList) > 0}">
       	<!-- <form action="addtocart" method="POST">-->

			<h2>Here are your search results</h2>
		    <div class="card">
			<div class="card-body">
			<table class="table">
					
					<thead>
						<tr>
							<th>Product Category</th>
							<th>Product Brand</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Price Per unit</th>
							<th>Quantity to Purchase</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="product" items="${searchItemList}">
						<form action="addtocart" method="POST">
							<tr>
								<td>${product.productCategory}</td>
								<td>${product.productBrand}</td>
								<td>${product.productName}</td>
								<td>${product.productDescription}</td>
								<td>${product.price}</td>
								<td><input type="number" class="form-control" name="purchaseQty${product.productID}" placeholder = "Quantity" min="1" max="10" required = "required"></td>
								<td><button name="productID" class="btn btn-primary" type="submit" value="${product.productID}">Add Item To Cart</button></td>
							</tr>
						  </form>
						</c:forEach>
					</tbody>
				</table>

            </div >
			</div >
		<!--  </form> -->
    </c:when>
    <c:otherwise>
	<br>
	<br>
       <h2>Please select a category with available products.</h2>
    </c:otherwise>
</c:choose>
   
</div>
    </div>	
    </div>
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