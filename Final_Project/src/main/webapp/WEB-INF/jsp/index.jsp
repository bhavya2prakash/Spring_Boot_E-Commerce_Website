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

    <div class="container text-center">
	  <div class="row align-items-center">
		<div class="col">
		  <h2>New Customer Registration ${requestScope.user.emailId}</h2>
		
			<form:form action="register" modelAttribute="user" method="post">
				
				<!-- action="register" -->
				<table>
					<tr>
						<td>First Name:</td>
						<td><form:input path="firstName" size="30"/>
							</td>
					</tr>

					<tr>
						<td>Last Name:</td> 
						<td><form:input path="lastName" size="30"/>
							</td>
					</tr>
					
					<tr>
						<td>Email Id:</td>
						<td><form:input path="emailId" size="30"
								type="email"/></td>
					</tr>
					
					<tr>
						<td>Password:</td>
						<td><form:password path="password" size="30"/> </td>
					</tr>
					
					<tr>
						<td>Phone Number:</td>
						<td><form:input path="phoneNumber" size="30"/> </td>
					</tr>
								

					<tr>
						<td colspan="2"><input type="submit" value="Register User" /></td>
					</tr>
				</table>

			</form:form>
		</div>
		<div class="col">
		  <h2>Customer Login ${requestScope.user.emailId}</h2>
		      <form action="login" method="post">
	
									<table>
									<tr>
									    <td>Email ID:</td>
									    <td><input type="email" name="emailid" size="30" required="required" /></td>
									</tr>
									
									<tr>
									    <td>Password:</td>
									    <td><input type="password" name="password" size="30" required="required"/></td>
									</tr>
									
									<tr>
									    <td colspan="2"><input type="submit" value="Login" /></td>
									</tr>
											
									</table>

			</form>
		
		</div>
		
	  </div>
	</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>