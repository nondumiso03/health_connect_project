<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ac.za.tut.entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rescheduled Appointment</title>
    <style>
        body {
            background-image: url("image/health_background.jpg"); /* Update this to your actual image path */
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
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px #000;
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        a {
            color: #00ffff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Appointment Rescheduled Successfully</h2>

        <%
            Appointment app = (Appointment) request.getAttribute("appointment");
            if (app != null) {
        %>
            <p><strong>Doctor:</strong> <%= app.getDoctor() %></p>
            <p><strong>New Date:</strong> <%= app.getDateOfBirth() %></p>
            <p><strong>New Time:</strong> <%= app.getTime() %></p>
        <%
            } else {
        %>
          
        <%
            }
        %>

        <br><br>
        <a href="patientDashboard.jsp">Return to Dashboard</a>
         <a href="PetientMenu.jsp" class="btn">Back to Appointments</a>
    </div>
</body>
</html>
