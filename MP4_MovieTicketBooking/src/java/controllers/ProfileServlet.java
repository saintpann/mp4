package controllers;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import objects.User;

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // CONVENTION FIX: Point to lowercase JSP file
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (currentUser == null) {
            response.sendRedirect("login");
            return;
        }

        String targetUsername = currentUser.getUsername();
        String newPassword = request.getParameter("password");
        String newName = request.getParameter("name");
        String newAge = request.getParameter("age");
        String newContact = request.getParameter("contact");
        String newAddress = request.getParameter("address");

        String txtFilePath = getServletContext().getRealPath("/WEB-INF/users.txt");
        List<String> fileLines = new ArrayList<>();
        
        if (txtFilePath != null) {
            try (BufferedReader reader = new BufferedReader(new FileReader(txtFilePath))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",");
                    if (parts.length > 0 && parts[0].trim().equals(targetUsername)) {
                        String updatedLine = targetUsername + "," + newPassword + "," + newName + "," + 
                                             newAge + "," + newContact + "," + newAddress;
                        fileLines.add(updatedLine);
                        
                        // Update session object
                        currentUser.setPassword(newPassword);
                        currentUser.setName(newName);
                        currentUser.setAge(newAge);
                        currentUser.setContact(newContact);
                        currentUser.setAddress(newAddress);
                    } else {
                        fileLines.add(line);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            try (PrintWriter writer = new PrintWriter(new FileWriter(txtFilePath))) {
                for (String line : fileLines) {
                    writer.println(line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        session.setAttribute("user", currentUser);
        response.sendRedirect("home");
    }
}