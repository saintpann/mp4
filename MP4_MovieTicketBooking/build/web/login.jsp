<!DOCTYPE html>
<html>
<head>
    <title>The Mouse - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>

    <div class="login-container">
        <div class="login-header">
            <img src="themouse.png" alt="The Mouse Logo" class="logo-img-login">
        </div>

        <form action="login" method="POST" class="login-form">
            <h2>Sign In</h2>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-input" required>
            </div>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if(errorMessage != null && !errorMessage.isEmpty()) {
            %>
                <div style="color: red; text-align: center; margin-bottom: 15px;">
                    <%= errorMessage %> <%-- scriplet 2 --%>
                </div>
            <%
                }
            %>
            <button type="submit" class="form-button">Sign In</button>
        </form>

        <div class="signup-link">
            New to The Mouse? <a href="signup">Sign up now.</a>
        </div>
    </div>

</body>
</html>