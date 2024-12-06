package servlet;

import dao.ExpenseDAO;
import model.Expense;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewExpenses")
public class ViewExpensesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ExpenseDAO dao = new ExpenseDAO();
            List<Expense> expenses = dao.getAllExpenses();
            System.out.println(expenses+"hi bro");
            req.setAttribute("expenses", expenses);
            req.getRequestDispatcher("expenses.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
