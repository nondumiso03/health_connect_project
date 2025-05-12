<%-- 
    Document   : reschedule
    Created on : 04 May 2025, 6:18:23 PM
    Author     : Potego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reschedule Appointment</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f4f8;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0,0,0,0.1);
                width: 400px;
                text-align: center;
            }

            h1 {
                margin-bottom: 10px;
                color: #333333;
            }

            p {
                margin-bottom: 30px;
                color: #666666;
            }

            label {
                display: block;
                margin-bottom: 5px;
                text-align: left;
                font-weight: bold;
                color: #444444;
            }

            input[type="text"],
            input[type="date"],
            input[type="time"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #cccccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Reschedule Appointment</h1>
            <p>Enter the details to reschedule your appointment</p>
            <form action="rescheduleAppointmentAdmin.do" method="post">
                <label for="appointment_id">Appointment ID:</label>
                <input type="text" name="appointment_id" id="appointment_id" required>

                <label for="new_date">New Date:</label>
                <input type="date" name="new_date" id="new_date" required>

                <label for="new_time">New Time:</label>
                <input type="time" name="new_time" id="new_time" required>

                <input type="submit" value="Reschedule Appointment">
            </form>
        </div>
    </body>
</html>
