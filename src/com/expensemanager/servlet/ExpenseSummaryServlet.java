package com.expensemanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expensemanager.datastore.ExpenseDS;
import com.expensemanager.model.Expense;
import com.expensemanager.model.dto.ExpenseDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class ExpenseSummaryServlet
 */
@WebServlet("/expense-summary")
public class ExpenseSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpenseSummaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String uId = request.getParameter("userId");
		
		int userId = Integer.parseInt(uId);
		try {
			ExpenseDS expenseDS = new ExpenseDS();
			ArrayList<Expense> expenses = expenseDS.getExpenseForChart(userId);
			ArrayList<ExpenseDTO> expenseDTOs = convertToDTO(expenses);
			PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");	        
	        out.print(new Gson().toJson(expenseDTOs));
	        out.flush(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	private ArrayList<ExpenseDTO> convertToDTO(List<Expense> expenses) {
		ArrayList<ExpenseDTO> expenseDTOs = new ArrayList<>();
		ExpenseDTO expenseDTO;
		for (Expense expense : expenses) {
			expenseDTO = new ExpenseDTO(expense.getCategory(), expense.getAmount());
			expenseDTOs.add(expenseDTO);
		}
		return expenseDTOs;
	}	

}
