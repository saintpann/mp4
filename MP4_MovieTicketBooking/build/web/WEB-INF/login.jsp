<%@ page import="objects.User, javax.servlet.http.HttpSession" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
<head>
    <title>The Mouse - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

    <div class="login-container">
        <div class="login-header">
            <img src="images/themouse.png" alt="The Mouse Logo" class="logo-img-login">
        </div>
        <% 
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) { 
        %>
        <div style="color: #ff4d4d; background: rgba(255,0,0,0.1); padding: 10px; border-radius: 5px; text-align: center; margin-bottom: 15px;">
            <%= error %>
        </div>
        <% } %>
        <form action="<%= request.getContextPath() %>/login" method="POST" class="login-form">
            <h2>Sign In</h2>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-input" required>
            </div>

            <button type="submit" class="form-button" href="">Sign In</button>
        </form>

        <div class="signup-link">
            New to The Mouse? <a href="signup">Sign up now.</a>
        </div>
    </div>

</body>
</html>