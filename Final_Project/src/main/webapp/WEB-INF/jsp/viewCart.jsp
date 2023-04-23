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
</head>

<body>

    <h1>Hi, ${user.firstName}</h1>

	<h1>
		Welcome To Behance Organica  
	</h1>

		<c:if test="${fn:length(sessionScope.orderItemList) == 0}">
			<div class="jumbotron">
				<div class="container">
						
					<div class="panel panel-info">
					
							<div class="panel-heading">
								<h2>Cart Page</h2>
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
								<h2>Cart Page</h2>
							</div>
							
							<div class="panel-body">
							
										<c:forEach  var="orderItem" items="${sessionScope.orderItemList}">
							
								
											   <b>Brand: </b> ${orderItem.itemBrand}<br>
											   <b>Item Name: </b> ${orderItem.itemName}<br>
											   <b>Description: </b> ${orderItem.itemDescription}<br>
											   <b>Price per Unit: </b> ${orderItem.itemPrice}<br>
											   <b>Quantity Ordered: </b> ${orderItem.purchaseQuantity}<br>
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


	
	
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>