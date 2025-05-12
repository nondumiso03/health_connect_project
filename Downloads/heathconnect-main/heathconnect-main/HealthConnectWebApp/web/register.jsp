<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - HealthConnect</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
            padding: 20px;
            font-weight: bold;
        }

        h2 {
            text-align: center;
        }

        form {
            background-color: #222;
            padding: 30px;
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
            box-shadow: 0 0 10px #444;
        }

        input, select, textarea {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: none;
            background-color: #333;
            color: white;
        }

        input[type="radio"], input[type="checkbox"] {
            width: auto;
            margin-right: 5px;
        }

        label {
            margin-top: 10px;
            display: block;
        }

        .section-title {
            font-size: 18px;
            margin-top: 30px;
            color: #00ffcc;
        }

        .green-button {
            background-color: green;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .green-button:hover {
            background-color: darkgreen;
        }

        .gender-group {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 15px;
        }

        .gender-group label {
            margin: 0;
            display: flex;
            align-items: center;
            gap: 5px;
        }
    </style>

    <script>
        window.onload = function() {
            <% if (request.getAttribute("error") != null) { %>
                alert("<%= request.getAttribute("error").toString().replaceAll("\"", "\\\\\"") %>");
            <% } else if (request.getAttribute("errors") != null) { %>
                alert("<%= request.getAttribute("errors").toString().replaceAll("\"", "\\\\\"") %>");
            <% } %>
        };

        // Function to calculate Date of Birth from ID number
        function calculateDobFromId() {
            var idNumber = document.getElementsByName('idNumber')[0].value;
            if (idNumber.length === 13) {
                var year = idNumber.substring(0, 2);
                var month = idNumber.substring(2, 4);
                var day = idNumber.substring(4, 6);

                var currentYear = new Date().getFullYear();
                if (parseInt(year) > currentYear.toString().substring(2)) {
                    year = '19' + year;
                } else {
                    year = '20' + year;
                }

                // Format as yyyy-MM-dd (server expects this)
                var dob = year + '-' + month + '-' + day;
                document.getElementsByName('dateOfBirth')[0].value = dob;
            }
        }
    </script>
</head>
<body>
    <h2>Patient Registration</h2>

    <form action="RegisterServlet" method="POST" enctype="multipart/form-data">
        <!-- Personal Info -->
        <div class="section-title">Personal Information</div>
        <input type="text" name="firstName" placeholder="First Name" required value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>" />
        <input type="text" name="lastName" placeholder="Last Name" required value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>" />
        
        <input type="text" name="idNumber" placeholder="ID Number" required value="<%= request.getParameter("idNumber") != null ? request.getParameter("idNumber") : "" %>" oninput="calculateDobFromId()"/>
        
        <label>Date of Birth:</label>
        <input type="text" name="dateOfBirth" placeholder="YYYY-MM-DD" required readonly value="<%= request.getParameter("dateOfBirth") != null ? request.getParameter("dateOfBirth") : "" %>" />

        <input type="tel" name="cellphone" placeholder="Cellphone (e.g. +27...)" pattern="^\+27\d{9}$" required value="<%= request.getParameter("cellphone") != null ? request.getParameter("cellphone") : "" %>" />
        
        <label>Gender:</label>
        <div class="gender-group">
            <label><input type="radio" name="gender" value="Male" <%= "Male".equals(request.getParameter("gender")) ? "checked" : "" %> /> Male</label>
            <label><input type="radio" name="gender" value="Female" <%= "Female".equals(request.getParameter("gender")) ? "checked" : "" %> /> Female</label>
            <label><input type="radio" name="gender" value="Other" <%= "Other".equals(request.getParameter("gender")) ? "checked" : "" %> /> Other</label>
        </div>

        <input type="text" name="address" placeholder="Address" required value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" />
        <input type="text" name="occupation" placeholder="Occupation" required value="<%= request.getParameter("occupation") != null ? request.getParameter("occupation") : "" %>" />

        <!-- Medical Info -->
        <div class="section-title">Medical Information</div>
        <label>Primary Care Doctor:</label>
        <select name="primaryCareDoctor" required>
            <option value="">-- Select Doctor --</option>
            <option value="Dr Smith" <%= "Dr Smith".equals(request.getParameter("primaryCareDoctor")) ? "selected" : "" %>>Dr Smith</option>
            <option value="Dr Patel" <%= "Dr Patel".equals(request.getParameter("primaryCareDoctor")) ? "selected" : "" %>>Dr Patel</option>
            <option value="Dr Adams" <%= "Dr Adams".equals(request.getParameter("primaryCareDoctor")) ? "selected" : "" %>>Dr Adams</option>
        </select>

        <input type="text" name="insuranceProvider" placeholder="Insurance Provider" value="<%= request.getParameter("insuranceProvider") != null ? request.getParameter("insuranceProvider") : "" %>" />
        <input type="text" name="insurancePolicyNumber" placeholder="Insurance Policy Number" value="<%= request.getParameter("insurancePolicyNumber") != null ? request.getParameter("insurancePolicyNumber") : "" %>" />
        <input type="text" name="allergiesDetails" placeholder="Allergies (if any)" value="<%= request.getParameter("allergiesDetails") != null ? request.getParameter("allergiesDetails") : "" %>" />
        <textarea name="currentMedications" placeholder="Current Medications"><%= request.getParameter("currentMedications") != null ? request.getParameter("currentMedications") : "" %></textarea>
        <textarea name="familyHistory" placeholder="Family History"><%= request.getParameter("familyHistory") != null ? request.getParameter("familyHistory") : "" %></textarea>
        <textarea name="pastMedicalHistory" placeholder="Past Medical History"><%= request.getParameter("pastMedicalHistory") != null ? request.getParameter("pastMedicalHistory") : "" %></textarea>

        <!-- Identification -->
        <div class="section-title">Identification</div>
        <input type="text" name="identificationId" placeholder="Identification ID" required value="<%= request.getParameter("identificationId") != null ? request.getParameter("identificationId") : "" %>" />
        <label>Upload ID Copy:</label>
        <input type="file" name="uploadedIdCopy" accept=".pdf,.jpg,.png" />

        <!-- Account Info -->
        <div class="section-title">Account & Consent</div>
        <input type="email" name="email" placeholder="Email" required value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" />
        <input type="password" name="password" placeholder="Password (must include upper, lower, digit & special char)" required />

        <label>
            <input type="checkbox" name="consentToTreatment" <%= request.getParameter("consentToTreatment") != null ? "checked" : "" %> required />
            I consent to receive treatment and allow use of my health info for medical purposes.
        </label>

        <label>
            <input type="checkbox" name="isOver18" <%= request.getParameter("isOver18") != null ? "checked" : "" %> required />
            I am over 18
        </label>

        <br/>
        <button type="submit" class="green-button">Submit Registration</button>
    </form>
</body>
</html>
