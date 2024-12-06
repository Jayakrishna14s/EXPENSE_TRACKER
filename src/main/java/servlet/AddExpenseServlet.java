package servlet;

import dao.ExpenseDAO;
import model.Expense;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/addExpense")
public class AddExpenseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String description = req.getParameter("description");
            String category = req.getParameter("category");
            double amount = Double.parseDouble(req.getParameter("amount"));
            String dateStr = req.getParameter("date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf.parse(dateStr);

            Expense expense = new Expense();
            expense.setDescription(description);
            expense.setCategory(category);
            expense.setAmount(amount);
            expense.setDate(date);

            ExpenseDAO dao = new ExpenseDAO();
            dao.addExpense(expense);

            resp.sendRedirect("/expensestracker/viewExpenses");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
