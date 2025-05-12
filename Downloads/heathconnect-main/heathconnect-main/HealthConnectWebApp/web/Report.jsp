<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Patient Attendance</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f8;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            h2 {
                margin-bottom: 30px;
                color: #333;
            }

            button {
                padding: 12px 20px;
                margin: 10px;
                font-size: 16px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button[name="action"][value="showed_up"] {
                background-color: #4CAF50;
                color: white;
            }

            button[name="action"][value="showed_up"]:hover {
                background-color: #45a049;
            }

            button[name="action"][value="did_not_show"] {
                background-color: #f44336;
                color: white;
            }

            button[name="action"][value="did_not_show"]:hover {
                background-color: #d73833;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Mark Patient Attendance</h2>

            <form action="ReportServlet.do" method="post">
                <input type="text" name="patientId" value="123" /> <!-- Replace with dynamic value -->
                <button type="submit" name="action" value="showed_up">Patient Showed Up</button>
                <button type="submit" name="action" value="did_not_show">Patient Did Not Show</button>
            </form>
        </div>
    </body>
</html>
