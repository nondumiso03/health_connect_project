<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - HealthConnect</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-weight: bold;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
        }

        form {
            display: inline-block;
            text-align: left;
            background-color: #222;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #444;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: green;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: darkgreen;
        }

        label {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<script>
    window.onload = function() {
        <% if (errorMessage != null) { %>
            alert("<%= errorMessage.replace("\"", "\\\"") %>");
        <% } %>
    };
</script>

    <h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label>Email:</label>
        <input type="text" name="email"  />

        <label>Password:</label>
        <input type="password" name="password"  />

        <label>Role:</label>
        <select name="role" required>
            <option value="">-- Select Role --</option>
            <option value="admin">Admin</option>
            <option value="doctor">Doctor</option>
            <option value="patient">Patient</option>
        </select>

        <input type="submit" value="Login" />
    </form>
</body>
</html>
