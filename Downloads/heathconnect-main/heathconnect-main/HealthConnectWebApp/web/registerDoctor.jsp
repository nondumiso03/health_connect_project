<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HealthConnect | Doctor Registration</title>
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
            max-width: 600px;
            margin: 0 auto;
        }

        input, select, textarea {
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
            margin: 10px 0;
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

        label {
            margin-top: 10px;
            display: block;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<header>
    <img src="logo.jpeg" alt="HealthConnect Logo">
</header>

<main>
    <h1>Doctor Registration</h1>

    <div class="form-container">

        <!-- Display error message if any -->
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="submitDoctorRegistrationServlet" method="POST">
            <!-- Personal Details -->
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>

            <label for="idNumber">ID Number:</label>
            <input type="text" id="idNumber" name="idNumber" required>

            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="occupation">Occupation:</label>
            <input type="text" id="occupation" name="occupation" value="Doctor" required>

            <label>
                <input type="checkbox" id="over18" name="over18" required> I confirm I am over 18
            </label>

            <!-- Medical Info -->
            <label for="specialty">Specialty:</label>
            <input type="text" id="specialty" name="specialty" required>

            <label for="licenseNumber">License Number:</label>
            <input type="text" id="licenseNumber" name="licenseNumber" required>

            <label for="licenseExpiryDate">License Expiry Date:</label>
            <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" required>

            <label for="hospital">Hospital:</label>
            <input type="text" id="hospital" name="hospital" required>

            <label for="experience">Years of Experience:</label>
            <input type="number" id="experience" name="experience" min="0" required>

            <label for="bio">Short Bio:</label>
            <textarea id="bio" name="bio" rows="4" required></textarea>

            <!-- Login Info -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label>
                <input type="checkbox" id="consent" name="consent" required> I consent to treatment policies
            </label>

            <button type="submit" class="button">Register</button>
        </form>
    </div>
</main>
</body>
</html>
