package controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objects.User;

public class MyTicketsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        List<String> myBookings = new ArrayList<>();
        String txtFilePath = getServletContext().getRealPath("/WEB-INF/bookings.txt");

        if (txtFilePath != null) {
            File file = new File(txtFilePath);
            if (file.exists()) {
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        // Line: username|sessionID|seats
                        String[] parts = line.split("\\|"); // Split by pipe character
                        
                        // Check if this line belongs to the current user
                        if (parts.length >= 3 && parts[0].equals(user.getUsername())) {
                            // Add the raw booking data to the list
                            // We will format it nicely in the JSP
                            myBookings.add(line);
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        request.setAttribute("myBookings", myBookings);
        request.getRequestDispatcher("/WEB-INF/myTickets.jsp").forward(request, response);
    }
}