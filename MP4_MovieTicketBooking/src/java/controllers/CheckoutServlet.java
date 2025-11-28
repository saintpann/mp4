package controllers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objects.User;

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security Check
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        // 2. Get Booking Details
        String movie = request.getParameter("movie");
        String date = request.getParameter("date"); 
        String time = request.getParameter("time");
        String[] selectedSeats = request.getParameterValues("seat");

        if (selectedSeats == null || selectedSeats.length == 0) {
            response.sendRedirect("seats?movie=" + movie + "&date=" + date + "&time=" + time); 
            return;
        }

        // 3. Create Session ID
        String sessionID = movie + "_" + date + "_" + time;

        // 4. Format Booking Record
        // NEW FORMAT: username|sessionID|seat1,seat2...
        // We use '|' as a separator to avoid confusion with commas in the seat list
        StringBuilder bookingRecord = new StringBuilder();
        bookingRecord.append(user.getUsername()).append("|"); // Add Username
        bookingRecord.append(sessionID).append("|");          // Add Session ID
        
        for (int i = 0; i < selectedSeats.length; i++) {
            bookingRecord.append(selectedSeats[i]);
            if (i < selectedSeats.length - 1) {
                bookingRecord.append(",");
            }
        }

        // 5. Save to bookings.txt
        String txtFilePath = getServletContext().getRealPath("/WEB-INF/bookings.txt");
        
        if (txtFilePath != null) {
            try (FileWriter fw = new FileWriter(txtFilePath, true);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter out = new PrintWriter(bw)) {
                
                out.println(bookingRecord.toString());
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 6. Redirect to My Tickets Page
        response.sendRedirect("myTickets");
    }
}