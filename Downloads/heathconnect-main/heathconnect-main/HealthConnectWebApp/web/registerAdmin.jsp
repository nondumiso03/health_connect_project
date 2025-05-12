<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HealthConnect | Admin Registration</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-weight: bold;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        header {
            display: flex;
            align-items: center;
            padding: 20px;
        }

        img {
            width: 150px;
            height: auto;
            margin-right: auto;
        }

        main {
            text-align: center;
            padding: 50px 20px;
        }

        .form-container {
            text-align: left;
            max-width: 500px;
            margin: 0 auto;
        }

        .error-message {
            background-color: red;
            color: white;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button {
            background-color: green;
            color: white;
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .button:hover {
            background-color: darkgreen;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Header with Logo -->
    <header>
        <img src="logo.jpeg" alt="HealthConnect Logo">
    </header>

    <!-- Main Content -->
    <main>
        <h1>Admin Registration</h1>

        <%-- Show error message if it exists --%>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div class="error-message">
                <%= error %>
            </div>
        <%
            }
        %>

        <div class="form-container">
            <form action="SubmitAdminRegistrationServlet" method="POST">
                <!-- Personal Details -->
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required><br>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required><br>
                
                <label for="phone">ID:</label>
                <input type="tel" id="phone" name="phone" required oninput="fetchDobFromId()"><br>

                <label for="dob">Date of Birth:</label>
                <!-- Readonly field to display Date of Birth -->
                <input type="text" id="dob" name="dob" readonly required><br>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br>

                

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required><br>

                <label for="role">Role (Admin):</label>
                <input type="text" id="role" name="role" value="Admin" readonly><br>

                <!-- Submit Button -->
                <button type="submit" class="button">Submit Registration</button>
            </form>
        </div>
    </main>

    <script>
        // Function to calculate and fetch Date of Birth based on the ID number
        function fetchDobFromId() {
            var id = document.getElementById("phone").value;

            // Check if the ID is exactly 13 characters long
            if (id.length === 13) {
                var dob = calculateDobFromId(id);
                if (dob) {
                    document.getElementById("dob").value = dob;
                }
            }
        }

        // Calculate Date of Birth from the ID number (assuming SA ID number format)
        function calculateDobFromId(id) {
            var year = id.substring(0, 2);
            var month = id.substring(2, 4);
            var day = id.substring(4, 6);
            
            // If year is greater than the current year, assume the century is 19
            var currentYear = new Date().getFullYear();
            if (parseInt(year) > currentYear.toString().substring(0, 2)) {
                year = '19' + year;
            } else {
                year = '20' + year;
            }

            // Format date as yyyy/mm/dd
            return year + '/' + month + '/' + day;
        }
    </script>
</body>
</html>
