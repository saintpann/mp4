<%@ page import="objects.User, javax.servlet.http.HttpSession" %>
<%
    // PREVENT BROWSER CACHING (same as your home.jsp)
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // SESSION HANDLING (same pattern as your home.jsp)
    HttpSession currentSession = request.getSession(false);
    User loggedInUser = null;
    String userName = "Guest";
    if (currentSession != null && currentSession.getAttribute("user") != null) {
        loggedInUser = (User) currentSession.getAttribute("user");
        userName = loggedInUser.getName(); // Using getName() like your home.jsp
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>The Mouse - Avengers: Endgame</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/movie.css">
    </head>
    <body>
        <header class="header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/images/themouse.png" alt="The Mouse Logo" class="logo-img">
                </a>
                <div class="headstamp"><%= application.getAttribute("header")%></div>
            </div>
            <div class="header-right">
                <% if (loggedInUser != null) {%>
                <span class="account-info">Welcome, <%= userName%></span>
                <a href="${pageContext.request.contextPath}/profile" class="account-icon" title="Edit Profile">
                    <i class="fas fa-user-circle"></i>
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="account-icon" title="Sign Out" style="margin-left: 15px; color: #ff6b6b;">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
                <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="login-btn">Login</a>
                <% } %>
            </div>
        </header>

        <div class="movie-detail-container">
            <div class="movie-hero">
                <div class="movie-poster">
                    <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="Avengers: Endgame">
                </div>
                <div class="movie-info">
                    <h1 class="movie-title">Avengers: Endgame</h1>
                    <div class="movie-meta">
                        <span class="rating"><i class="fas fa-star"></i> 8.5/10</span>
                        <span class="duration">3h 1m</span>
                        <span class="year">2019</span>
                        <span class="genre-tag">Action</span>
                        <span class="genre-tag">Adventure</span>
                        <span class="genre-tag">Sci-Fi</span>
                    </div>
                    <p class="movie-synopsis">
                        After the devastating events of Avengers: Infinity War, the universe is in ruins. 
                        With the help of remaining allies, the Avengers assemble once more in order to 
                        reverse Thanos' actions and restore balance to the universe.
                    </p>
                </div>
            </div>

            <div class="movie-details-section">
                <div class="details-grid">
                    <div class="detail-card">
                        <h3>Director</h3>
                        <p>Anthony Russo, Joe Russo</p>
                    </div>
                    <div class="detail-card">
                        <h3>Cast</h3>
                        <p>Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson</p>
                    </div>
                    <div class="detail-card">
                        <h3>Release Date</h3>
                        <p>April 26, 2019</p>
                    </div>
                    <div class="detail-card">
                        <h3>Language</h3>
                        <p>English</p>
                    </div>
                </div>
            </div>

            <%-- Showtimes Section --%>
            <div class="showtimes-section">
                <h2>Showtimes</h2>

                <!-- Today's Showtimes -->
                <div class="time-group">
                    <h3>Today</h3>
                    <div class="time-slots">
                        <% if (loggedInUser != null) { %>
                        <!-- Logged-in users see clickable buttons -->
                        <a href="seats?movie=avengers&date=today&time=10:00AM" class="time-slot">10:00 AM</a>
                        <a href="seats?movie=avengers&date=today&time=1:30PM" class="time-slot">1:30 PM</a>
                        <a href="seats?movie=avengers&date=today&time=4:45PM" class="time-slot">4:45 PM</a>
                        <a href="seats?movie=avengers&date=today&time=8:00PM" class="time-slot">8:00 PM</a>
                        <% } else { %>
                        <!-- Guests see non-clickable times -->
                        <span class="time-slot">10:00 AM</span>
                        <span class="time-slot">1:30 PM</span>
                        <span class="time-slot">4:45 PM</span>
                        <span class="time-slot">8:00 PM</span>
                        <% } %>
                    </div>
                </div>

                <!-- Tomorrow's Showtimes -->
                <div class="time-group">
                    <h3>Tomorrow</h3>
                    <div class="time-slots">
                        <% if (loggedInUser != null) { %>
                        <!-- Logged-in users see clickable buttons -->
                        <a href="seats?movie=avengers&date=tomorrow&time=11:00AM" class="time-slot">11:00 AM</a>
                        <a href="seats?movie=avengers&date=tomorrow&time=2:15PM" class="time-slot">2:15 PM</a>
                        <a href="seats?movie=avengers&date=tomorrow&time=5:30PM" class="time-slot">5:30 PM</a>
                        <a href="seats?movie=avengers&date=tomorrow&time=8:45PM" class="time-slot">8:45 PM</a>
                        <% } else { %>
                        <!-- Guests see non-clickable times -->
                        <span class="time-slot">11:00 AM</span>
                        <span class="time-slot">2:15 PM</span>
                        <span class="time-slot">5:30 PM</span>
                        <span class="time-slot">8:45 PM</span>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>

        <%-- Shopping Cart Button --%>
        <button class="shopping-cart-btn">
            <i class="fas fa-shopping-cart"></i>
        </button>
    </body>
</html>