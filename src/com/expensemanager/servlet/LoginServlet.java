package com.expensemanager.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.expensemanager.datastore.LoginDS;
import com.expensemanager.model.User;
import static com.expensemanager.constant.Constants.COOKIE_USER_ID;
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
		
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		LoginDS loginDS = new LoginDS();
		User user = loginDS.getUser(uname);
		int userId = user.getId();
		String userPassword = user.getPassword();		
		String uId = String.valueOf(userId);		 
		Cookie ck=new Cookie(COOKIE_USER_ID,uId);			
		response.addCookie(ck);
				
		if (password.equals(userPassword)) {
			try {
				request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("login.jsp");
		}

	}

}

