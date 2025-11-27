<%@ page import="objects.User" %>
<%-- PREVENT BROWSER CACHING --%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <title>The Mouse - Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/signup.css">
    
    <style>
        .login-container { max-width: 500px; margin: 40px auto; }
        .form-row { display: flex; gap: 15px; }
        .form-row .form-group { flex: 1; }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="login-header">
            <img src="<%= request.getContextPath() %>/images/themouse.png" alt="The Mouse Logo" class="logo-img-login">
        </div>

        <form action="<%= request.getContextPath() %>/signup" method="POST" class="login-form">
            <h2>Create Account</h2>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-input" required>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-input" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" class="form-input" required>
                </div>
                <div class="form-group" style="flex: 0 0 100px;">
                    <label>Age</label>
                    <input type="number" name="age" class="form-input" required>
                </div>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" name="contact" class="form-input" required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" class="form-input" required>
            </div>

            <button type="submit" class="form-button">Sign Up</button>
        </form>

        <div class="signup-link">
            Already have an account? <a href="login">Log In here.</a>
        </div>
    </div>

</body>
</html>