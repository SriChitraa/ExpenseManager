package com.expensemanager.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.expensemanager.datastore.ExpenseDS;
import com.expensemanager.model.Expense;

/**
 * Servlet implementation class AllExpense
 */
@WebServlet("/AllExpense")
public class CategoryFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		ArrayList<String> filter = new ArrayList<>();
		String category = request.getParameter("category");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		filter.add(category);
		filter.add(start);
		filter.add(end);
		request.setAttribute("filter", filter);

		int userId = (int) request.getSession().getAttribute("user_id");
		try {
			ExpenseDS expenseDS = new ExpenseDS();
			ArrayList<Expense> expenses = expenseDS.getExpense(userId, category, start, end);
			request.setAttribute("expenses", expenses);
			request.getRequestDispatcher("/expense.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
