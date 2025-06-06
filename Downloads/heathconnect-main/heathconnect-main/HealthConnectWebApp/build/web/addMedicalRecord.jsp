<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Medical Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6fa;
            padding: 50px;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .btn {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add Medical Record</h2>
        <form action="AddMedicalRecordServlet.do" method="POST">
            <label for="patientId">Patient ID:</label>
            <input type="text" id="patientId" name="patientId" required>

            <label for="diagnosis">Diagnosis:</label>
            <input type="text" id="diagnosis" name="diagnosis" required>

            <label for="treatment">Treatment:</label>
            <input type="text" id="treatment" name="treatment" required>

            <label for="notes">Additional Notes:</label>
            <textarea id="notes" name="notes" rows="5"></textarea>

            <input type="submit" value="Submit Record" class="btn">
        </form>

        <a href="doctorDashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>

</body>
</html>
