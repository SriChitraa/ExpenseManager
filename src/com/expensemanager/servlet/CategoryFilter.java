package com.expensemanager.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// TODO Auto-generated method stub
		HttpSession session= request.getSession();
		ArrayList<String>filter = new ArrayList<>();
		String category = request.getParameter("category");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		filter.add(category);
		filter.add(start);
		filter.add(end);
		session.setAttribute("filter", filter);
		
		ArrayList<Expense>expenses = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/task","root","root");
			PreparedStatement ps =  connect.prepareStatement("select * from expenses where Category = '"+category+"'and Date between '"+start+"'and'"+end+"'order by Date Desc;");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Expense list = new Expense();
				list.setDate(rs.getString("date"));
				list.setTime(rs.getString("time"));
				list.setCategory(rs.getString("category"));
				list.setAmount(rs.getInt("amount"));
				list.setContent(rs.getString("content"));
				expenses.add(list);			
			}session.setAttribute("expenses",expenses);
			response.sendRedirect("expense.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
