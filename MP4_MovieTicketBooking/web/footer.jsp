<%-- 
    Document   : footer
    Created on : Nov 18, 2025, 9:57:03 AM
    Author     : Anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <footer style="background-color: #234E70; color: #EDE6D6; padding: 20px; border-top: 1px solid #383838; text-align: center; margin-top: auto; font-family: 'Poppins', sans-serif;">

            <p style="margin: 0; font-size: 14px;"><strong>MP4: The Mouse Cinema</strong></p>

            <%-- Scriptlet1 (Expression) --%>
            <p style="margin: 5px 0; font-size: 14px;">Current Time: <%= application.getAttribute("date") %></p>

            <%-- Scriptlet 3 (Declaration) --%>
            <%! 
                public String getCopyrightYear() {
                    return "2025";
                }
            %>
            <p style="font-size: 11px; margin-top: 10px; color: #A9A9A9;">
                &copy; <%= getCopyrightYear() %> The Mouse Cinema. All Rights Reserved.
            </p>

        </footer>
    </body>
</html>