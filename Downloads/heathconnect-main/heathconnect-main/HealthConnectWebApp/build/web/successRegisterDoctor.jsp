<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Registration Success</title>
    <style>
        body {
            background: linear-gradient(to right, #141E30, #243B55);
            color: #f2f2f2;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.05);
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.3);
            max-width: 600px;
        }

        h1 {
            font-size: 32px;
            color: #00ffcc;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin: 8px 0;
        }

        .highlight {
            color: #ffcc00;
            font-weight: bold;
        }

        .button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 26px;
            font-size: 16px;
            font-weight: bold;
            background-color: #00ffcc;
            color: #141E30;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s;
        }

        .button:hover {
            background-color: #00ccaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Doctor Registered Successfully</h1>
        <p>Welcome <span class="highlight"><%= request.getParameter("firstName") %> <%= request.getParameter("lastName") %></span>!</p>
        <p>Your specialization: <span class="highlight"><%= request.getParameter("specialization") %></span></p>
        <p>Hospital: <span class="highlight"><%= request.getParameter("hospital") %></span></p>
        <p>Email: <span class="highlight"><%= request.getParameter("email") %></span></p>
        <p>You may now <strong>log in</strong> and begin using your dashboard.</p>
        <a class="button" href="login.jsp">Go to Login</a>
    </div>
</body>
</html>
