<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="objects.User"%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body style="display: flex; flex-direction: column; min-height: 100vh;">
    
    <header class="header">
        <div class="header-left">
            <span style="font-weight:bold; font-size: 20px;">The Mouse | Staff</span>
        </div>
    </header>
    
    <div style="padding: 100px 20px; text-align: center; flex: 1;">
        <h1 style="color: #EDE6D6; margin-bottom: 20px;">Staff Administration Panel</h1>
        
        <% 
            User user = (User) session.getAttribute("user");
            if(user != null) {
        %>
            <p style="font-size: 18px;">Welcome, Officer <strong><%= user.getName() %></strong></p>
            <p>Role Status: <span style="color: #FFD700; font-weight: bold;"><%= user.getRole() %></span></p>
        <% } %>

        <br><br>
        
        <div style="border: 1px solid #383838; padding: 30px; max-width: 400px; margin: 0 auto; background: #282828; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.5);">
            <h3 style="border-bottom: 1px solid #383838; padding-bottom: 10px; margin-bottom: 15px;">Operations</h3>
            <ul style="list-style: none; padding: 0;">
                <li style="margin: 15px 0; color: #A9A9A9;">Manage Showings (Coming Soon)</li>
                <li style="margin: 15px 0; color: #A9A9A9;">Manage Tickets (Coming Soon)</li>
            </ul>
        </div>
        
        <br><br>
        <a href="logout" class="login-btn" style="background-color: #ff6b6b; color: white;">Logout</a>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>