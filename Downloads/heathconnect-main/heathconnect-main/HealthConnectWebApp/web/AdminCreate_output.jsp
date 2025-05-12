<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ac.za.tut.entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Details</title>
    <style>
        body {
            background-image: url("image/adminBack.webp"); /* Adjust path to match your structure */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.6); /* Transparent dark background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #000;
            text-align: center;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        a {
            color: #00ffcc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Appointment Scheduled Successfully</h2>
        <%
            Appointment app = (Appointment) request.getAttribute("appointment");
            if (app != null) {
        %>
            <p><strong>Doctor:</strong> <%= app.getDoctor() %></p>
            <p><strong>Date:</strong> <%= app.getDateOfBirth() %></p>
            <p><strong>Time:</strong> <%= app.getTime() %></p>
        <%
            } else {
        %>
            <p>No appointment data found.</p>
        <%
            }
        %>
        <br><br>
        <a href="ceateAppointmentAdmin.jsp">Schedule Another Appointment</a>
        <p>Click <a href="login.jsp">here</a>to get back to the login page</p>
         <a href="adminDashboard.jsp" class="btn">Back to Appointments</a>
    </div>
</body>
</html>
