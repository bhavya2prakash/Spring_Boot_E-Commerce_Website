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
</head>
<body>
Payment
	<div class="jumbotron">
			<div class="container">
	<div class="panel panel-info">
				
						<div class="panel-heading">
							<h3>Order Summary</h3>
						</div>
						
						<div class="panel-body">
							Total Price ${totalOrderWorth}
							<form action='charge' method='POST' id='checkout-form'>
								<input type='hidden' value='${totalOrderWorth*100}' name='amount' />
								<label>Price:<span text='${totalOrderWorth}' /></label>
								<script
								   src='https://checkout.stripe.com/checkout.js' 
								   class='stripe-button'
								   data-key=${stripePublicKey}
								   data-amount=${totalOrderWorth*100}
								   data-currency=${currency}
								   data-name='Behance Organica'
								   data-description='Please enter the details'
								   data-image
									 ='https://www.baeldung.com/wp-content/themes/baeldung/favicon/android-chrome-192x192.png'
								   data-locale='auto'
								   data-zip-code='false'>
                                </script>
							</form>
						</div>
				</div>
			</div>
		</div>
	
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>