<%@page import="ac.za.medical.medical"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Medical Records</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <style>
        body {
            
            .button-link {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-link.logout {
            background-color: #dc3545;
        }

        .button-link:hover {
            opacity: 0.9;
        }
            font-family: Arial, sans-serif;
            background-color: #f2f6fa;
            padding: 50px;
            margin: 0;
        }

        #record-content {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 90%;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border: 3px solid black;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .filters {
            margin-bottom: 20px;
            text-align: center;
        }

        select {
            padding: 8px;
            margin: 0 10px;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-back:hover, .btn-download:hover {
            background-color: #0056b3;
        }

        .button-container {
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div id="record-content">
    <h2>All Medical Records</h2>

    <div class="filters">
        <label>Filter by Record ID:
            <select id="filter-id" onchange="filterTable()">
                <option value="all">All</option>
            </select>
        </label>
        <label>Filter by Treatment:
            <select id="filter-treatment" onchange="filterTable()">
                <option value="all">All</option>
            </select>
        </label>
    </div>

    <table id="records-table">
        <thead>
            <tr>
                <th>Record ID</th>
                <th>Patient ID</th>
                <th>Diagnosis</th>
                <th>Treatment</th>
                <th>Notes</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<medical> records = (List<medical>) request.getAttribute("records");
            if (records != null && !records.isEmpty()) {
                for (medical record : records) {
        %>
        <tr>
            <td><%= record.getId() %></td>
           
            <td><%= record.getDignosis() %></td>
            <td><%= record.getTreatment() %></td>
            <td><%= record.getNote() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" style="text-align:center;">No records found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div class="button-container">
    <a href="doctorDashboard.jsp" class="btn-back">Back to Doctor Dashboard</a>
    <a href="PetientMenu.jsp" class="btn-back">Back to Patient Dashboard</a>
    <button onclick="downloadPDF()" class="btn-download">Download as PDF</button>
</div>

<script>
    function populateFilters() {
        const rows = document.querySelectorAll("#records-table tbody tr");
        const idSet = new Set();
        const treatmentSet = new Set();

        rows.forEach(row => {
            const id = row.cells[0]?.textContent.trim();
            const treatment = row.cells[3]?.textContent.trim();
            if (id) idSet.add(id);
            if (treatment) treatmentSet.add(treatment);
        });

        const idSelect = document.getElementById("filter-id");
        const treatmentSelect = document.getElementById("filter-treatment");

        idSet.forEach(id => {
            const opt = document.createElement("option");
            opt.value = id;
            opt.textContent = id;
            idSelect.appendChild(opt);
        });

        treatmentSet.forEach(treatment => {
            const opt = document.createElement("option");
            opt.value = treatment;
            opt.textContent = treatment;
            treatmentSelect.appendChild(opt);
        });
    }

    function filterTable() {
        const idFilter = document.getElementById("filter-id").value;
        const treatmentFilter = document.getElementById("filter-treatment").value;
        const rows = document.querySelectorAll("#records-table tbody tr");

        rows.forEach(row => {
            const id = row.cells[0]?.textContent.trim();
            const treatment = row.cells[3]?.textContent.trim();

            const matchesId = (idFilter === "all" || id === idFilter);
            const matchesTreatment = (treatmentFilter === "all" || treatment === treatmentFilter);

            row.style.display = (matchesId && matchesTreatment) ? "" : "none";
        });
    }

    function downloadPDF() {
        const element = document.getElementById('record-content');
        html2pdf()
            .set({
                margin: 1,
                filename: 'Medical_Records_Report.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 4 },
                jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
            })
            .from(element)
            .save();
    }

    window.onload = function () {
        populateFilters();
    };
    
</script>
<a href="summary.jsp" class="button-link">View Summary</a>
<a href="login.jsp" class="button-link logout">Logout</a>
</body>
</html>
