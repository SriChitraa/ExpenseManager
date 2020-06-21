package com.expensemanager.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.expensemanager.datastore.LoginDS;
import com.expensemanager.datastore.ExpenseDS;
import com.expensemanager.model.Expense;
import com.expensemanager.model.User;
import com.expensemanager.model.dto.ExpenseDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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

		String uname = request.getParameter("username");
		HttpSession session = request.getSession();
		String password = request.getParameter("password");
		try {
			LoginDS loginDS = new LoginDS();
			loginDS.getUser(uname, password);
			User user = new User();
			int id = user.getId();
			String userPassword = user.getPassword();
			if (password.equals(userPassword)) {

				try {
					ExpenseDS expense = new ExpenseDS();
					ArrayList<Expense> expenses = expense.viewExpense();
					ArrayList<ExpenseDTO> expenseDTOs = convertToDTO(expenses);
					String dataPoints = new Gson().toJson(expenseDTOs);
					System.out.print(dataPoints);
					session.setAttribute("expenses", dataPoints);
					response.sendRedirect("dashboard.jsp");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
		


private ArrayList<ExpenseDTO> convertToDTO(List<Expense> expenses) {
			ArrayList<ExpenseDTO> expenseDTOs = new ArrayList<>();
			ExpenseDTO expenseDTO;
			for(Expense expense: expenses) {
				expenseDTO = new ExpenseDTO(expense.getCategory(),expense.getAmount());
				expenseDTOs.add(expenseDTO);
			}
			return expenseDTOs;
		}

				
	}

