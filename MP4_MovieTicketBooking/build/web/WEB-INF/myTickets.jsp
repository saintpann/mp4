<%@ page import="java.util.List" %>
<%@ page import="objects.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Tickets - The Mouse</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Reuse your home or seats CSS, or create a simple new one -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/home.css"> 
    
    <style>
        .ticket-container {
            max-width: 800px;
            margin: 100px auto;
            padding: 20px;
        }
        .ticket-card {
            background-color: #1F1F1F;
            border-left: 5px solid #FFD700;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .ticket-info h3 { margin: 0 0 5px 0; color: #EDE6D6; }
        .ticket-info p { margin: 0; color: #A0A0A0; font-size: 14px; }
        .ticket-seats { text-align: right; }
        .seat-badge {
            display: inline-block;
            background-color: #FFD700;
            color: #234E70;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
            margin-left: 5px;
        }
        .no-tickets { text-align: center; color: #666; margin-top: 50px; }
    </style>
</head>
<body>

    <!-- Header (Same as Home) -->
    <header class="header">
        <div class="header-left">
            <a href="home">
                <img src="<%= request.getContextPath() %>/images/themouse.png" alt="Logo" class="logo-img">
            </a>
        </div>
        <div class="header-right">
            <a href="home" class="account-icon"><i class="fas fa-times"></i></a>
        </div>
    </header>

    <div class="ticket-container">
        <h2 style="color: #FFD700; border-bottom: 1px solid #333; padding-bottom: 10px;">My Tickets</h2>

        <%
            List<String> bookings = (List<String>) request.getAttribute("myBookings");
            
            if (bookings == null || bookings.isEmpty()) {
        %>
            <div class="no-tickets">
                <h3>No tickets found.</h3>
                <p>Go book a movie to see it here!</p>
            </div>
        <%
            } else {
                for (String booking : bookings) {
                    // Parse the raw line: username|movie_date_time|seat1,seat2
                    String[] parts = booking.split("\\|");
                    String sessionID = parts[1];
                    String seats = parts[2];
                    
                    // Decode SessionID (avengers_today_10:00AM)
                    String[] sessionParts = sessionID.split("_");
                    String movie = sessionParts[0]; // You might want to capitalize this
                    String date = sessionParts[1];
                    String time = sessionParts[2];
        %>
            <div class="ticket-card">
                <div class="ticket-info">
                    <h3><%= movie.toUpperCase() %></h3>
                    <p><i class="far fa-calendar-alt"></i> <%= date %> | <i class="far fa-clock"></i> <%= time %></p>
                </div>
                <div class="ticket-seats">
                    <p>Seats:</p>
                    <span class="seat-badge"><%= seats.replace(",", ", ") %></span>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>

</body>
</html>