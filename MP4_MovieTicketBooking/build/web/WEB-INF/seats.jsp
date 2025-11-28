<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="objects.User" %>
<%
    // Prevent Caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Get Attributes with Safety Checks
    String movie = (String) request.getAttribute("selectedMovie");
    String date = (String) request.getAttribute("selectedDate");
    String time = (String) request.getAttribute("selectedTime");
    
    if (movie == null) movie = "Select a Movie";
    if (date == null) date = "--";
    if (time == null) time = "--";

    // Use fully qualified names to fix List casting errors
    java.util.List<String> occupiedSeats = (java.util.List<String>) request.getAttribute("occupiedSeats");
    if (occupiedSeats == null) {
        occupiedSeats = new java.util.ArrayList<String>();
    }
    
    // Get User for Header
    User loggedInUser = (User) session.getAttribute("user");
    String userName = (loggedInUser != null) ? loggedInUser.getName() : "Guest";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Seats - <%= movie %></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Link to your seats.css -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/seats.css">
</head>
<body>

    <!-- Header -->
    <header class="header">
        <div class="header-left">
            <a href="<%= request.getContextPath() %>/home">
                <img src="<%= request.getContextPath() %>/images/themouse.png" alt="Logo" class="logo-img">
            </a>
        </div>
        <div class="header-right">
            <span class="account-info">Seat Selection</span>
            <a href="<%= request.getContextPath() %>/home" class="close-btn"><i class="fas fa-times"></i></a>
        </div>
    </header>

    <div class="main-container">
        
        <!-- Info Bar -->
        <div class="movie-info-bar">
            <h2><%= movie %></h2>
            <div class="meta-details">
                <span><i class="far fa-calendar-alt"></i> <%= date %></span>
                <span class="divider">|</span>
                <span><i class="far fa-clock"></i> <%= time %></span>
            </div>
        </div>

        <!-- The Screen -->
        <div class="screen-container">
            <div class="screen"></div>
            <p>SCREEN</p>
        </div>

        <!-- Seat Map Form -->
        <form action="<%= request.getContextPath() %>/checkout" method="POST">
            <!-- Hidden inputs to pass data to checkout -->
            <input type="hidden" name="movie" value="<%= movie %>">
            <input type="hidden" name="date" value="<%= date %>">
            <input type="hidden" name="time" value="<%= time %>">

            <div class="seat-grid">
                <% 
                   // Generate 5 Rows (A-E)
                   String[] rows = {"A", "B", "C", "D", "E"};
                   int seatsPerRow = 8;

                   for (String row : rows) {
                %>
                    <div class="seat-row">
                        <span class="row-label"><%= row %></span>
                        <% 
                           for (int i = 1; i <= seatsPerRow; i++) { 
                               String seatID = row + i;
                               
                               // Check if seat is occupied
                               boolean isTaken = occupiedSeats.contains(seatID);
                               String statusClass = isTaken ? "occupied" : "available";
                               String disabledAttr = isTaken ? "disabled" : "";
                        %>
                            <!-- Add a gap (aisle) in the middle -->
                            <% if (i == 5) { %><div class="aisle"></div><% } %>

                            <input type="checkbox" name="seat" value="<%= seatID %>" id="<%= seatID %>" <%= disabledAttr %>>
                            <label for="<%= seatID %>" class="seat <%= statusClass %>"></label>
                        <% } %>
                    </div>
                <% } %>
            </div>

            <!-- Legend -->
            <div class="legend">
                <div class="legend-item"><span class="seat-sample available"></span> Available</div>
                <div class="legend-item"><span class="seat-sample selected"></span> Selected</div>
                <div class="legend-item"><span class="seat-sample occupied"></span> Occupied</div>
            </div>

            <!-- Bottom Bar -->
            <div class="checkout-bar">
                <div class="total-section">
                    <span class="label">Total Price</span>
                    <span class="amount" id="total">$0.00</span>
                </div>
                <button type="submit" class="checkout-btn">Proceed to Checkout</button>
            </div>
        </form>
    </div>

    <!-- JavaScript for Price Calculation -->
    <script>
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(:disabled)');
        var totalDisplay = document.getElementById('total');
        var pricePerSeat = 12.50; // Set ticket price

        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].addEventListener('change', function() {
                var count = document.querySelectorAll('input[type="checkbox"]:checked').length;
                totalDisplay.innerText = '$' + (count * pricePerSeat).toFixed(2);
            });
        }
    </script>

</body>
</html>