<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
     window.onload=function(){
	 const form = document.getElementById('myForm');

		// Add submit event listener
		form.addEventListener('submit', (event) => {
		  // Prevent form submission
		  event.preventDefault();

		  // Get form inputs
		 const brandField = document.getElementById('brand');
         const nameField = document.getElementById('name');
		
		const descriptionField = document.getElementById('description');
		const priceField = document.getElementById('price');

		  // Define regex patterns
		  const brandRegex = /^[a-zA-Z0-9]+$/;
			const nameRegex = /^[a-zA-Z0-9\s]+$/;
			const categoryRegex = /^[a-zA-Z\s]+$/;
			const descriptionRegex = /^[a-zA-Z0-9\s]+$/;
			const priceRegex = /^[0-9]+$/;

		  // Validate inputs
		  let isValid = true;

		  if (!brandField.value.trim().match(brandRegex)) {
			// Invalid first name
			brandField.classList.add('is-invalid');
			isValid = false;
		  } 

		  if (!nameField.value.trim().match(nameRegex)) {
			// Invalid last name
			nameField.classList.add('is-invalid');
			isValid = false;
		  } 

		  if (!descriptionField.value.trim().match(descriptionRegex)) {
			// Invalid phone number
			descriptionField.classList.add('is-invalid');
			isValid = false;
		  } 

		  if (!priceField.value.trim().match(priceRegex)) {
			// Invalid email
			priceField.classList.add('is-invalid');
			isValid = false;
		  } 

		  // Submit form if valid
		  if (isValid) {
			form.submit();
		  }
		});
	 }
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
	<br>
	<br>	

	<div class="container">
       <div class="row align-middle">
		<div class="col-sm-12">
	<c:choose>  
    <c:when test="${fn:length(allproducts) > 0}">
       

			<h2>Here are all Products</h2>
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
						</tr>
					</thead>
					<tbody>
						<c:forEach  var="product" items="${allproducts}">
						   
							<tr>
								<td>${product.productCategory}</td>
								<td>${product.productBrand}</td>
								<td>${product.productName}</td>
								<td>${product.productDescription}</td>
								<td>${product.price}</td>
								
							</tr>
					
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
       <h2>No products.</h2>
    </c:otherwise>
</c:choose>
   
</div>
    </div>	
    </div>
	 <div class="container">
        <div class="row align-middle">
		<div class="col-sm-8 ">
		<div class="card">
			<div class="card-body">
<h2>Add New Products Below: </h2>

	<!-- Use HTML Form Tags.... Redirect to Product Controller.....Annotate Product Pojo -->
	
	
	<form:form id="myForm" action="addproduct" method="post" modelAttribute="product" >

		<table>

			<tr>
				<td>Product Brand:</td>
				<td><form:input type="text" path="productBrand" class="form-control" id="brand" size="30" required="required" /></td>
			</tr>

			<tr>
				<td>Product Name:</td>
				<td><form:input type="text" path="productName" class="form-control" id="name" size="30" required="required"/>
				
			</tr>
			<tr>
			<label for="category">Category :</label>
				<form:select name="category" id="product" path="productCategory" class="form-control" >
					<form:option value="food" label="Food"/>
					<form:option value="beverages" label="Beverages"/>
					<form:option value="beauty" label="Beauty"/>
					<form:option value="home" label="Home Decor"/>
					<form:option value="fashion" label="Fashion"/>
				
				</form:select>  
			</tr>
			
			<tr>
				<td>Product Description:</td>
				<td><form:textarea path="productDescription" rows="10" cols="30" class="form-control" id="description" required="required"/>
				
			</tr>

			
			
			<tr>
				<td>Price Per Unit:</td>
				<td><form:input type="text" path="price" size="30" class="form-control" id="price" required="required"/>
				
			</tr>
			
			
			<tr>
				<td colspan="2"><input type="submit" class="btn btn-primary" value="Post Your Product Online"  /></td>
			</tr>
		</table>

	</form:form>
	 </div> 
	  </div>
	   </div>
	    </div>
		 </div>
		
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