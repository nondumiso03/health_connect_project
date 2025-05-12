<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Appointment Outcome</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("image/healthImg.lnk");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            color: #fff;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            margin: 50px auto;
            padding: 40px;
            border-radius: 12px;
            width: 90%;
            max-width: 900px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            color: black;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn, .btn-download {
            display: inline-block;
            margin: 20px 10px 0 0;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .btn:hover, .btn-download:hover {
            background-color: #0056b3;
        }

        .filters {
            margin-bottom: 20px;
            text-align: center;
        }

        .filters label {
            margin-right: 15px;
            color: white;
        }

        select {
            padding: 5px;
            margin-left: 5px;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="container" id="appointment-content">
    <h2>Appointment Details</h2>

    <%
        List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
    %>

    <div class="filters">
        <label>Filter by ID:
            <select id="filter-id" onchange="filterRows()">
                <option value="all">All</option>
                <% if (appointments != null) {
                    for (Appointment a : appointments) { %>
                        <option value="<%= a.getId() %>"><%= a.getId() %></option>
                <% } } %>
            </select>
        </label>

        <label>Filter by Date:
            <select id="filter-date" onchange="filterRows()">
                <option value="all">All</option>
                <% if (appointments != null) {
                    java.util.Set<String> dates = new java.util.HashSet<>();
                    for (Appointment a : appointments) {
                        String date = a.getDateOfBirth();
                        if (dates.add(date)) {
                %>
                    <option value="<%= date %>"><%= date %></option>
                <% }}} %>
            </select>
        </label>

        <label>Filter by Time:
            <select id="filter-time" onchange="filterRows()">
                <option value="all">All</option>
                <% if (appointments != null) {
                    java.util.Set<String> times = new java.util.HashSet<>();
                    for (Appointment a : appointments) {
                        String time = a.getTime();
                        if (times.add(time)) {
                %>
                    <option value="<%= time %>"><%= time %></option>
                <% }}} %>
            </select>
        </label>
    </div>

    <table id="appointment-table">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>Doctor</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
        </thead>
        <tbody>
            <% if (appointments != null && !appointments.isEmpty()) {
                for (Appointment a : appointments) {
            %>
            <tr>
                <td><%= a.getId() %></td>
                <td><%= a.getDoctor() %></td>
                <td><%= a.getDateOfBirth() %></td>
                <td><%= a.getTime() %></td>
            </tr>
            <% }} else { %>
            <tr>
                <td colspan="4" style="text-align:center;">No appointments found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<div class="button-container">
    <a href="patientDashboard.jsp" class="btn">Schedule Another Appointment</a>
    <a href="PetientMenu.jsp" class="btn">Back to Appointments</a>
    <a href="login.jsp" class="btn">Back to Login</a>
    <button class="btn-download" onclick="downloadPDF()">Download as PDF</button>
</div>

<script>
    function filterRows() {
        const idFilter = document.getElementById("filter-id").value;
        const dateFilter = document.getElementById("filter-date").value;
        const timeFilter = document.getElementById("filter-time").value;

        const rows = document.querySelectorAll("#appointment-table tbody tr");

        rows.forEach(row => {
            const id = row.cells[0]?.textContent.trim();
            const date = row.cells[1]?.textContent.trim();
            const time = row.cells[2]?.textContent.trim();

            const show = (idFilter === "all" || id === idFilter) &&
                         (dateFilter === "all" || date === dateFilter) &&
                         (timeFilter === "all" || time === timeFilter);

            row.style.display = show ? "" : "none";
        });
    }

    function downloadPDF() {
        const element = document.getElementById('appointment-content');
        html2pdf()
            .set({
                margin: 1,
                filename: 'Appointment_Outcome_Report.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 4 },
                jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
            })
            .from(element)
            .save();
    }
</script>

</body>
</html>
