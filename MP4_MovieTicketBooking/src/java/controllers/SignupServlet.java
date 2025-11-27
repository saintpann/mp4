package controllers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if(session !=null && session.getAttribute("user")!=null){
            response.sendRedirect("home");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // A. Get parameters (Payment removed)
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        // B. Format data string (Payment removed from end)
        String userRecord = username + "," + password + "," + name + "," + 
                            age + "," + contact + "," + address;

        // C. Save to users.txt
        String txtFilePath = getServletContext().getRealPath("/WEB-INF/users.txt");

        if (txtFilePath != null) {
            try (FileWriter fw = new FileWriter(txtFilePath, true);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter out = new PrintWriter(bw)) {
                
                out.println(userRecord);
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("login");
    }
}