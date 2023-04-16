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
    <title>Behance Organica</title>
</head>

<body>
<h2>Add New Products Below: </h2>

	<!-- Use HTML Form Tags.... Redirect to Product Controller.....Annotate Product Pojo -->
	
	
	<form:form action="addproduct" method="post"
		modelAttribute="product" >

		<table>

			<tr>
				<td>Product Brand:</td>
				<td><form:input type="text" path="productBrand" size="30" required="required" /></td>
			</tr>

			<tr>
				<td>Product Name:</td>
				<td><form:input type="text" path="productName" size="30" required="required"/>
				
			</tr>
			<tr>
			<label for="category">Category :</label>
				<form:select name="category" id="product" path="productCategory">
					<form:option value="food" label="Food"/>
					<form:option value="beverages" label="Beverages"/>
					<form:option value="beauty" label="Beauty"/>
					<form:option value="home" label="Home Decor"/>
					<form:option value="fashion" label="Fashion"/>
				
				</form:select>  
			</tr>
			
			<tr>
				<td>Product Description:</td>
				<td><form:textarea path="productDescription" rows="10" cols="30" required="required"/>
				
			</tr>

			<tr>
				<td>Available Quantity:</td>
				<td><form:input type="number" path="avlQuantity" size="5" required="required" min="0"/>
				</td>
			</tr>
			
			<tr>
				<td>Price Per Unit:</td>
				<td><form:input type="text" path="price" size="30" required="required"/>
				
			</tr>
			
			
			<tr>
				<td colspan="2"><input type="submit" value="Post Your Product Online" /></td>
			</tr>
		</table>

	</form:form>
	
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>