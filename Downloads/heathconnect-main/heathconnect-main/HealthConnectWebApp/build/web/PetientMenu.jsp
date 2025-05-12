<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .menu-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
        }
        .menu-button {
            display: block;
            margin: 10px auto;
            padding: 12px 25px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 250px;
        }
        .menu-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="menu-container">
        <h1>Patient Menu</h1>

        <form action="patientDashboard.jsp" method="get">
            <button type="submit" class="menu-button">Schedule an Appointment</button>
        </form>

        <form action="RescheduleAppointment.jsp" method="get">
            <button type="submit" class="menu-button">Reschedule Appointment</button>
        </form>

        <form action="removeAppointment.jsp" method="POST">
            <button type="submit" class="menu-button">Remove Appointment</button>
             </form>
             <form action="viewMedicalRecords.do" method="POST">
            <button type="submit" class="menu-button">View medical record</button>
             </form>
    </div>
</body>
</html>
