<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Doctor Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 50px;
            text-align: center;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            margin: auto;
            border-radius: 10px;
            width: 50%;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #333;
        }

        p {
            color: #666;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 24px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            margin: 10px;
            width: 250px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Doctor!</h2>
        <p>Manage your appointments and patient records.</p>

        <div class="form-container">
            <!-- Add Medical Records -->
            <form action="addMedicalRecord.jsp" method="GET">
                <input type="submit" class="btn" value="Add Medical Record">
            </form>

            <!-- Update Medical Records -->
            <form action="updateMedicalRecord.jsp" method="GET">
                <input type="submit" class="btn" value="Update Medical Record">
            </form>

            <!-- Confirm Appointments -->
            <form action="confirmAppointment.jsp" method="POST">
                <input type="submit" class="btn" value="Confirm Appointments">
            </form>

            <!-- View Medical Records -->
            <form action="viewMedicalRecords.do" method="POST">
                <input type="submit" class="btn" value="View Medical Records">
            </form>
            <form action="ViewAttendance.jsp" method="POST">
                <input type="submit" class="btn" value="Track Attendance">
            </form>
            <form action="Report.jsp" method="POST">
                <input type="submit" class="btn" value="Report">
            </form>
        </div>
    </div>
</body>
</html>
