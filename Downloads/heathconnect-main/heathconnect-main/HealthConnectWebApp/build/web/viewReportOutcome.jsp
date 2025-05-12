<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.Long" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Report Outcome</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 600px;
            width: 100%;
        }

        h2 {
            color: #2c3e50;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Patient Attendance Report</h2>
    <p>
        <% 
            String msg = (String) session.getAttribute("message");
            Long showed = (Long) session.getAttribute("show");
            Long notShowed = (Long) session.getAttribute("not");
        %>

        <% if (msg != null) { %>
            <strong>Status:</strong> <%= msg %><br><br>
        <% } %>

        <% if (showed != null) { %>
            <strong>Total times patient showed up:</strong> <%= showed %><br>
        <% } %>

        <% if (notShowed != null) { %>
            <strong>Total times patient did not show up:</strong> <%= notShowed %><br>
        <% } %>
    </p>
    <a href="ViewAttendance.jsp">Mark Another Patient</a>
</div>
</body>
</html>
