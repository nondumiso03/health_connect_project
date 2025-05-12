<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Outcome</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message-box {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        h2 {
            color: #2e7d32;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #125ea8;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>Attendance Recorded</h2>
        <p>
            <% 
                String msg = (String) request.getAttribute("message");
                Long showed = (Long) request.getAttribute("show");
                Long notShowed = (Long) request.getAttribute("not");
            %>

            <% if (msg != null) { %>
                Patient has <strong><%= msg %></strong>.<br>
            <% } %>

            <% if (showed != null) { %>
                Total times patient showed up: <strong><%= showed %></strong><br>
            <% } %>

            <% if (notShowed != null) { %>
                Total times patient did not show up: <strong><%= notShowed %></strong><br>
            <% } %>
        </p>
        <a href="Report.jsp">Mark Another Patient</a>

    </div>
</body>
</html>
