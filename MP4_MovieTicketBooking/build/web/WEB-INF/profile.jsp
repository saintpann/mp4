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
    <title>Edit Profile - The Mouse</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/profile.css">
</head>
<body>

    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
    %>

    <div class="edit-container">
        <div class="edit-header">
            <a href="home">
                <img src="<%= request.getContextPath() %>/images/themouse.png" alt="Logo" class="logo-img">
            </a>
            <h2>Edit Profile</h2>
        </div>

        <form action="profile" method="POST" class="edit-form">
            
            <div class="form-group">
                <label>Username (Cannot be changed)</label>
                <input type="text" name="username" value="<%= user.getUsername() %>" class="form-input readonly" readonly>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="text" name="password" value="<%= user.getPassword() %>" class="form-input" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="<%= user.getName() %>" class="form-input" required>
                </div>
                
                <div class="form-group small-field">
                    <label>Age</label>
                    <input type="number" name="age" value="<%= user.getAge() %>" class="form-input" required>
                </div>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" name="contact" value="<%= user.getContact() %>" class="form-input" required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <input type="text" name="address" value="<%= user.getAddress() %>" class="form-input" required>
            </div>

            <div class="button-group">
                 <a href="home" class="cancel-btn">Cancel</a>
    
                 <button type="button" class="cancel-btn" onclick="window.location.href='logout'" style="color: #ff6b6b; border-color: #ff6b6b;">
                   Sign Out
                 </button>
    
                 <button type="submit" class="save-btn">Save Changes</button>
            </div>
        </form>
    </div>

</body>
</html>