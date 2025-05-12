<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
            padding: 60px;
        }

        .dashboard {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        form {
            margin: 0;
        }

        .btn {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 500px) {
            .dashboard {
                padding: 25px 20px;
            }

            .btn {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <h2>Welcome, Admin!</h2>
        <p>Manage users and system settings.</p>

        <div class="button-group">
              <form action="registerMore.jsp" method="POST">
                <input type="submit" class="btn" value="Create Account">
            </form>
            <form action="adminServlet.do" method="POST">
                <input type="submit" class="btn" value="View All Appointments">
            </form>

            <form action="createAppointmentAdmin.jsp" method="GET">
                <input type="submit" class="btn" value="Create Appointment">
            </form>

            <form action="updateAppointmentAdmin.jsp" method="POST">
                <input type="submit" class="btn" value="Update Appointment">
            </form>
            <form action="getingReprtServlet.do" method="POST">
                <input type="submit" class="btn" value="Appointment Report">
            </form>
            
        </div>
    </div>

</body>
</html>
