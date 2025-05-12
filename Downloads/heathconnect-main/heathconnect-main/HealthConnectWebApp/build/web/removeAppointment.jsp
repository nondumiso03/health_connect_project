<%-- 
    Document   : removeAppointment
    Created on : 04 May 2025, 7:18:11 PM
    Author     : Potego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Remove page</h1>
         <form action="removeAppointments.do" method="post">
    <label for="appointment_id">Appointment ID:</label>
    <input type="text" name="appointment_id" id="appointment_id" required><br><br>
    
      <input type="submit" value="Remove Appointment">
         </form>
    </body>
</html>
