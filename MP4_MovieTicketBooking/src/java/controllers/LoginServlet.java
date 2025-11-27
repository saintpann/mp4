package controllers;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objects.User;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        HttpSession session = request.getSession(false);
        
        if(session != null){
            session.invalidate();
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String inputUsername = request.getParameter("username"); 
        String inputPassword = request.getParameter("password");
        
        String txtFilePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        User foundUser = null;

        if (txtFilePath != null) {
            try (BufferedReader reader = new BufferedReader(new FileReader(txtFilePath))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    
                    // We now check for 6 parts because we added Age, Contact, and Address
                    if (parts.length >= 6) {
                        String fileUsername = parts[0].trim();
                        String filePassword = parts[1].trim();
                        String fileName = parts[2].trim();
                        String fileAge = parts[3].trim();
                        String fileContact = parts[4].trim();
                        String fileAddress = parts[5].trim();

                        if (fileUsername.equals(inputUsername) && filePassword.equals(inputPassword)) {
                            // Create the User object with ALL the new info
                            foundUser = new User(fileUsername, filePassword, fileName, fileAge, fileContact, fileAddress);
                            break;
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if (foundUser != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", foundUser);
            response.sendRedirect("home");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}