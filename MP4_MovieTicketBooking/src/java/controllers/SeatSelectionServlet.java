package controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SeatSelectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        // 2. Get Parameters
        String movie = request.getParameter("movie");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Fallbacks to prevent null pointers
        if (movie == null) movie = "Unknown Movie";
        if (date == null) date = "Today";
        if (time == null) time = "10:00AM";

        // 3. Create Session ID (e.g., avengers_today_10:00AM)
        String targetSessionID = movie + "_" + date + "_" + time;
        
        // 4. File Handling
        List<String> occupiedSeats = new ArrayList<>();
        
        // Note the leading slash "/" which is required for getRealPath
        String txtFilePath = getServletContext().getRealPath("/WEB-INF/bookings.txt");
        
        if (txtFilePath != null) {
            File file = new File(txtFilePath);
            
            // Auto-create file if it is missing
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            // Read the file
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.trim().isEmpty()) continue;

                    // CHECK 1: Try New Format (username|sessionID|seat1,seat2)
                    String[] pipeParts = line.split("\\|");
                    
                    if (pipeParts.length >= 3) {
                        String fileSessionID = pipeParts[1];
                        String seatsPart = pipeParts[2];
                        
                        if (fileSessionID.equals(targetSessionID)) {
                            String[] seats = seatsPart.split(",");
                            for (String s : seats) {
                                occupiedSeats.add(s.trim());
                            }
                        }
                    } 
                    // CHECK 2: Fallback for Old Format (sessionID,seat1,seat2)
                    else {
                        String[] commaParts = line.split(",");
                        if (commaParts.length > 1 && commaParts[0].equals(targetSessionID)) {
                            for (int i = 1; i < commaParts.length; i++) {
                                occupiedSeats.add(commaParts[i].trim());
                            }
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 5. Send Data to JSP
        request.setAttribute("selectedMovie", movie);
        request.setAttribute("selectedDate", date);
        request.setAttribute("selectedTime", time);
        request.setAttribute("occupiedSeats", occupiedSeats); 

        request.getRequestDispatcher("/WEB-INF/seats.jsp").forward(request, response);
    }
}