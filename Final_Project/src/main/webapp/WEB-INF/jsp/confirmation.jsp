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
    Confirmation
<c:choose>  
    <c:when test="${not empty error}">
       <h2 style='color: red;'>${error}</h2> 
	   <form action="delivery" method="post">
      <input type="submit" value="Try Again" />
      </form>
    </c:when>
    <c:otherwise>
       <h3 style='color: green;'>Success!</h3>
            <div>Id.: ${id}</div>
            <div>Status:${status}</div>
            <div>Charge id.: ${chargeId}</div>
            <div>Balance transaction id.:${balance_transaction}</div>  
    </c:otherwise>
</c:choose>


	
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    
</body>

</html>