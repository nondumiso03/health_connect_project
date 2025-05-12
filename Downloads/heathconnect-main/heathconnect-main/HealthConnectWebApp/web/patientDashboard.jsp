<%-- 
    Document   : patientDashboard
    Created on : 03 May 2025, 1:36:34 PM
    Author     : frank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Schedule Appointment</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url("image/background.webp"); /* Adjust path if needed */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            color: white;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.6); /* optional dark overlay for readability */
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin: 100px auto;
            text-align: center;
        }

        label, select, input {
            font-size: 16px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Patient!</h2>
        <p>Schedule an appointment here:</p>

        <form action="ScheduleAppointmentServlet.do" method="post">
            <label for="doctor">Select Doctor:</label><br>
            <select name="doctor" id="doctor">
                <option value="dr_smith">Dr. Smith</option>
                <option value="dr_jones">Dr. Jones</option>
            </select><br><br>
              <label for="id">Appointment id:</label><br>
            <input type="text" name="id" id="id" required><br><br>
            <label for="date">Appointment Date:</label><br>
            <input type="date" name="date" id="date" required><br><br>

            <label for="time">Time:</label><br>
            <input type="time" name="time" id="time" required><br><br>

            <input type="submit" value="Schedule Appointment">
            
        </form>
        
        <p>Click <a href="login.jsp">here</a>to get back to the login page</p>
    </div>
</body>
</html>
