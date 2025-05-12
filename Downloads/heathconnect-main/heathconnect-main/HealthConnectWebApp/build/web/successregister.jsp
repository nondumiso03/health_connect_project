<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Patient Registered</title>
        <style>
            body {
                background-color: black;
                color: white;
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 100px;
            }

            .button {
                display: inline-block;
                margin-top: 30px;
                padding: 12px 24px;
                font-size: 16px;
                font-weight: bold;
                background-color: green;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            .button:hover {
                background-color: darkgreen;
            }
        </style>
    </head>
    <body>
        <h1>Patient Registered Successfully!</h1>
        <p>You may now log in using the credentials you provided during registration.</p>
        <a class="button" href="login.jsp">Go to Login</a>
    </body>
</html>
