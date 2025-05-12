<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entity.Appointment"%>
<%
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - All Appointments</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f8fc;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        #content {
            background-color: #fff;
            padding: 40px;
            border: 3px solid black;
            box-sizing: border-box;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn-back, .btn-download {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-back:hover, .btn-download:hover {
            background-color: #0056b3;
        }

        .button-container {
            text-align: center;
            margin: 40px 0;
        }

        .filters {
            margin-bottom: 20px;
        }

        .filters input {
            margin-right: 10px;
            padding: 6px;
        }
    </style>
</head>
<body>

<div id="content">
    <h2>All Appointments</h2>

    <div class="filters">
        <input type="text" id="idFilter" onkeyup="filterTable()" placeholder="Filter by ID">
        <input type="text" id="dateFilter" onkeyup="filterTable()" placeholder="Filter by Date">
        <input type="text" id="timeFilter" onkeyup="filterTable()" placeholder="Filter by Time">
    </div>

    <table id="emp-table">
        <thead>
        <tr>
            <th>Appointment ID</th>
            <th>Date</th>
            <th>Time</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (appointments != null && !appointments.isEmpty()) {
                for (Appointment a : appointments) {
        %>
        <tr>
            <td><%= a.getId() %></td>
            <td><%= a.getDateOfBirth() %></td>
            <td><%= a.getTime() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No appointments found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div class="button-container">
    <a href="adminDashboard.jsp" class="btn-back">Back to Dashboard</a>
    <button class="btn-download" onclick="downloadPDF()">Download as PDF</button>
</div>

<script>
    function filterTable() {
        const idFilter = document.getElementById("idFilter").value.toLowerCase();
        const dateFilter = document.getElementById("dateFilter").value.toLowerCase();
        const timeFilter = document.getElementById("timeFilter").value.toLowerCase();
        const table = document.getElementById("emp-table");
        const tr = table.getElementsByTagName("tr");

        for (let i = 1; i < tr.length; i++) {
            const tdId = tr[i].getElementsByTagName("td")[0];
            const tdDate = tr[i].getElementsByTagName("td")[1];
            const tdTime = tr[i].getElementsByTagName("td")[2];

            if (tdId && tdDate && tdTime) {
                const idText = tdId.textContent.toLowerCase();
                const dateText = tdDate.textContent.toLowerCase();
                const timeText = tdTime.textContent.toLowerCase();

                if (
                    idText.includes(idFilter) &&
                    dateText.includes(dateFilter) &&
                    timeText.includes(timeFilter)
                ) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    function downloadPDF() {
        const element = document.getElementById('content');
        html2pdf().set({
            margin: 1,
            filename: 'Appointment_Report.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2 },
            jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
        }).from(element).save();
    }
</script>

</body>
</html>
