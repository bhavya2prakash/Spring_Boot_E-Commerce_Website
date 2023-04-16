<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

	<form action="searchproduct" method="GET">

	<label for="category">What Do you wish to buy:</label>
    <select name="category" id="product">
		<option value="food">Food</option>
		<option value="beverages">Beverages</option>
		<option value="beauty">Beauty</option>
		<option value="home">Home Decor</option>
		<option value="fashion">Fashion</option>
    </select>
		
		<input type="submit" value="Find Products">

	</form>
	
	<form action="trackorder" method="GET">

		Find Order Details: <input type="number" name = "orderid" required="required" min="1">
		
		<input type="submit" value="Track Your Order">

	</form>
    ${searchItemList}
	<c:if test="${fn:length(searchItemList) > 0}">
	<h2>Here are your search results</h2>
	
		<table border="1">
	            
	            <thead>
	                <tr>
	                	<th>Product Brand</th>
	                    <th>Product Name</th>
	                    <th>Product Category</th>
	                    <th>Product Description</th>
	                    <th>Available Quantity</th>
	                    <th>Price Per unit</th>
	                    <th>Quantity to Purchase</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach  var="product" items="${searchItemList}">
	                <form action="addtocart" method="POST">
	                    <tr>
	                       
	                        <td>${product.productBrand}</td>
	                        <td>${product.productName}</td>
							 <td>${product.productCategory}</td>
	                        <td>${product.productDescription}</td>
	                        <td>${product.avlQuantity}</td>
	                        <td>${product.price}</td>
	                        <td><input type="number" name="purchaseQty${product.productID}" placeholder = "Enter Quantity to purchase" min="1" max="10" required = "required"></td>
	                        <td><button name="productID" type="submit" value="${product.productID}">Add Item To Cart</button></td>
	                    </tr>
	                  </form>
	                </c:forEach>
	            </tbody>
	        </table>
		<form action="cart" method="POST">
			<input type="submit" value="Checkout">
		</form>
	</c:if>



	<c:if test="${fn:length(searchItemList) == 0}">
		<h2>No Results Found.</h2>
		
	</c:if>		
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>