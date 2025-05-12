<!DOCTYPE html>
<html>
<head>
    <title>HealthConnect | Select Role</title>
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
            display: inline-block;
        }

        .button:hover {
            background-color: darkgreen;
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
        <h1>Select Your Role</h1>
        <p>Please choose the role you are registering for:</p>
        
        <a href="RegisterServlet.do?role=Patient" class="button">Patient</a><br>
        
    </main>
</body>
</html>
