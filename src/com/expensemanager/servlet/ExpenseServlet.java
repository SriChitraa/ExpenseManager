package com.expensemanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expensemanager.datastore.ExpenseDS;
import com.expensemanager.model.Expense;
import com.google.gson.Gson;

/**
 * Servlet implementation class ExpenseServlet
 */
@WebServlet("/expenses")
public class ExpenseServlet extends HttpServlet {
	private static final String SUCCESS = "success";
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExpenseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category") == null ? "All" : request.getParameter("category");		
		if ( "All".equals(category)) {
			 category = null;
		}
		String startDate = request.getParameter("startDate") == null ? getMonthStartDate()
				: request.getParameter("startDate");
		String endDate = request.getParameter("endDate") == null ? getMonthEndDate() : request.getParameter("endDate");

		int userId = 1;
		try {
			ExpenseDS expenseDS = new ExpenseDS();
			ArrayList<Expense> expenses = expenseDS.getExpenses(userId, category, startDate, endDate);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			HashMap<String, ArrayList<Expense>> expensesMap = new HashMap<>();
			expensesMap.put("data", expenses);
			out.print(new Gson().toJson(expensesMap));
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String getMonthStartDate() {
		LocalDate today = LocalDate.now();
		Date startDate = java.sql.Date.valueOf(today.withDayOfMonth(1));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String monthStart = df.format(startDate);
		return monthStart;
	}

	private String getMonthEndDate() {
		LocalDate today = LocalDate.now();
		Calendar cal = Calendar.getInstance();
		Date endDate = java.sql.Date.valueOf(today.withDayOfMonth(cal.getActualMaximum(Calendar.DATE)));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String monthEnd = df.format(endDate);
		return monthEnd;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = 1;
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String category = request.getParameter("category");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String content = request.getParameter("content");
		HashMap<String, Boolean> statusMap = new HashMap<>();

		try {
			ExpenseDS expenseDS = new ExpenseDS();
			expenseDS.addExpense(date, time, category, amount, userId, content);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			statusMap.put(SUCCESS, true);
		} catch (Exception e) {
			statusMap.put(SUCCESS, false);
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(statusMap));
		out.flush();
	}

}
