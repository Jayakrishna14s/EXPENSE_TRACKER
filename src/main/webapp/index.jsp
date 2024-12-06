<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expenses Tracker</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        header {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #ffffff;
            font-size: 2rem;
        }

        h2 {
            color: #555;
            font-size: 1.5rem;
        }

        /* Navigation menu styling */
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .nav a {
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 18px;
        }

        .nav a:hover {
            background-color: #45a049;
        }

        /* Form and Table container styles */
        .form-container, .table-container {
            display: none;
            margin-top: 30px;
        }

        /* Show form and table on the respective pages */
        .form-container.active, .table-container.active {
            display: block;
        }

        /* Style the form */
        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fafafa;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .form-container input:focus {
            border-color: #4CAF50;
        }

        .form-container button {
            padding: 12px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table th {
            background-color: #f2f2f2;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #e1e1e1;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Expense Tracker</h1>
    </header>

    <!-- Home Page Navigation -->
    <div class="container">
        <h2>Welcome to Expense Tracker</h2>
        <div class="nav">
            <a href="/expensestracker/viewExpenses">View Expenses</a>
            <a href="#add-expense" onclick="showAddExpense()">Add Expense</a>
        </div>

        <!-- View Expenses Section (Initially hidden) -->
        <div class="table-container" id="view-expenses">
            <h2>All Expenses</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Amount</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dynamically populate rows from database -->
                    <c:forEach var="expense" items="${expenses}">
                        <tr>
                            <td>${expense.id}</td>
                            <td>${expense.description}</td>
                            <td>${expense.category}</td>
                            <td>${expense.amount}</td>
                            <td>${expense.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Add Expense Form Section (Initially hidden) -->
        <div class="form-container" id="add-expense">
            <h2>Add Expense</h2>
            <form action="/expensestracker/addExpense" method="POST">
                <input type="text" name="description" placeholder="Description" required>
                <input type="text" name="category" placeholder="Category" required>
                <input type="number" name="amount" placeholder="Amount" required>
                <input type="date" name="date" required>
                <button type="submit">Add Expense</button>
            </form>
        </div>
    </div>

    <script>
        // Function to show the "View Expenses" section
        function showViewExpenses() {
            document.getElementById('view-expenses').classList.add('active');
            document.getElementById('add-expense').classList.remove('active');
        }

        // Function to show the "Add Expense" form section
        function showAddExpense() {
            document.getElementById('add-expense').classList.add('active');
            document.getElementById('view-expenses').classList.remove('active');
        }
    </script>

</body>
</html>
