<%@ page import="objects.User, javax.servlet.http.HttpSession" %>
<%-- PREVENT BROWSER CACHING --%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
<head>
    <title>The Mouse - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>

    <%-- 
      This Java code block checks the session, same as before.
      It runs on the server before the page is sent to the user.
    --%>
    <%
        HttpSession currentSession = request.getSession(false);
        User loggedInUser = null;
        String userName = "Guest"; // Default for guest
        if (currentSession != null && currentSession.getAttribute("user") != null) {
            loggedInUser = (User) currentSession.getAttribute("user");
            // Assuming your User object has a getName() method
            userName = loggedInUser.getName(); 
        }
    %>

    
    <header class="header">
        <div class="header-left">
            <%-- Logo image for the header --%>
            <a href="home">
                <img src="images/themouse.png" alt="The Mouse Logo" class="logo-img">
            </a>
            <div class="headstamp"><%= application.getAttribute("header") %> </div>
        </div>
        <div class="header-right">
            <% if (loggedInUser != null) { %>
                <span class="account-info">Welcome, <%= userName %></span>
                <a href="profile" class="account-icon" title="Edit Profile">
                    <i class="fas fa-user-circle"></i>
                </a>
        
                <a href="logout" class="account-icon" title="Sign Out" style="margin-left: 15px; color: #ff6b6b;">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            <% } else { %>
                <a href="login" class="login-btn">Login</a>
            <% } %>
</div>
    </header>

    
    <section class="hero-section">
        <%-- Larger logo image for the hero section --%>
        <img src="images/themouse.png" alt="The Mouse Logo" class="hero-logo-large">
        <h1 class="hero-title">Your Ultimate Movie Experience</h1> <%-- Changed hero title for a generic welcome --%>
    </section>

    
    <section class="movie-listings">
        <div class="listing-header">
            <div class="listing-tabs">
                <button class="active">Now Showing</button>
            </div>
            <a href="#" class="view-all">
                View All <i class="fas fa-chevron-right"></i>
            </a>
        </div>

        <div class="movie-grid">
            <a class='movieclick' href="avengers">
            <div class="movie-card">
                <img src="<%= request.getContextPath() %>/images/movie1.jpg" alt="Shadow Strike">
                <div class="movie-info">
                    <div class="title">Avengers: Endgame</div>
                    <div class="details">
                        <span class="genre">Action</span>
                        <span class="rating"><i class="fas fa-star"></i> 8.5</span>
                    </div>
                </div>
            </div>
            </a>
            
            <a class='movieclick' href="beautifulboy">
            <div class="movie-card">
                <img src="<%= request.getContextPath() %>/images/movie2.jpg" alt="Dark Secrets">
                <div class="movie-info">
                    <div class="title">Beautiful Boy</div>
                    <div class="details">
                        <span class="genre">Drama</span>
                        <span class="rating"><i class="fas fa-star"></i> 7.8</span>
                    </div>
                </div>
            </div>
            </a>
            
            <a class='movieclick' href="wicked">
            <div class="movie-card">
                <img src="<%= request.getContextPath() %>/images/movie3.jpg" alt="Beyond the Horizon">
                <div class="movie-info">
                    <div class="title">Wicked</div>
                    <div class="details">
                        <span class="genre">Fantasy</span>
                        <span class="rating"><i class="fas fa-star"></i> 8.2</span>
                    </div>
                </div>
            </div>
            </a>
            
            <a class='movieclick' href="lalaland">
            <div class="movie-card">
                <img src="<%= request.getContextPath() %>/images/movie4.jpg" alt="Cosmic Voyage">
                <div class="movie-info">
                    <div class="title">La La Land</div>
                    <div class="details">
                        <span class="genre">Drama</span>
                        <span class="rating"><i class="fas fa-star"></i> 9.1</span>
                    </div>
                </div>
            </div>
            </a>
        </div>
    </section>

    
    <footer class="footer">
        </footer>

    
    <button class="shopping-cart-btn">
        <i class="fas fa-shopping-cart"></i>
    </button>

</body>
</html>