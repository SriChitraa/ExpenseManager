package com.expensemanager.servlet;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExpenseServlet
 */
@WebServlet("/ExpenseServlet")
public class ExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpenseServlet() {
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
		// TODO Auto-generated method stub
		
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String category = request.getParameter("category");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String content = request.getParameter("content");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task", "root", "root");
			CallableStatement call = (CallableStatement) connect.prepareCall("call addExpenses(?,?,?,?,?)");
			call.setString(1, date);
			call.setString(2, time);
			call.setString(3, category);
			call.setInt(4, amount);
			call.setString(5, content);
			call.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
