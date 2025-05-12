<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="ac.za.tut.entity.Appointment" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Confirmation Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fc;
            padding: 40px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            margin: auto;
            width: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
            color: green;
        }

        .error {
            color: red;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Appointment Confirmation Result</h2>

        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");
            Appointment appointment = (Appointment) request.getAttribute("appointment");

            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <%
            } else if (message != null) {
        %>
            <p class="message"><%= message %></p>

            <%
                if (appointment != null) {
            %>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                    <tr>
                        <td><%= appointment.getId() %></td>
                        <td><%= appointment.getDateOfBirth() %></td>
                        <td><%= appointment.getTime() %></td>
                        
                    </tr>
                </table>
            <%
                }
            %>
        <%
            }
        %>

        <a href="doctorDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
</body>
</html>
