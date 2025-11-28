<%-- 
    Document   : 500_error.jsp
    Created on : Nov 18, 2025, 9:24:52 AM
    Author     : Anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 500: Server Error</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    </head>
    <body style="display: flex; flex-direction: column; justify-content: center; align-items: center; min-height: 100vh; text-align: center; background-color: #121212; color: #EDE6D6;">
        
        <img src="${pageContext.request.contextPath}/images/500.png" alt="500 Mouse" style="width: 200px; height: auto; margin-bottom: 20px; border-radius: 10px;">
        
        <h1 style="font-size: 60px; color: #FFD700; margin: 0;">500</h1>
        <h2 style="margin-top: 10px;">Internal Server Error</h2>
        
        <p style="color: #A9A9A9; max-width: 400px; margin-bottom: 30px;">
            Something went wrong in the kitchen. Our tech-mice are fixing it right now!
        </p>
        
        <a href="${pageContext.request.contextPath}/home" class="login-btn" style="background-color: #FFD700; color: #234E70; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-weight: bold;">
            Return to Home
        </a>

    </body>
</html>