<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Accounts</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f0f2f5;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            h1 {
                color: #333;
                margin-bottom: 30px;
            }

            .button {
                display: inline-block;
                padding: 12px 24px;
                margin: 10px;
                font-size: 16px;
                text-decoration: none;
                color: white;
                background-color: #007bff;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }

            .button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h1>Create Accounts</h1>
        <a href="registerAdmin.jsp?role=Admin" class="button">Admin</a>
        <a href="registerDoctor.jsp?role=Doctor" class="button">Doctor</a>
    </body>
</html>
