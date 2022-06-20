package logIn;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logOut
 */
@WebServlet("/logOut")
public class logOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("logging out...... in servlet");
		
		HttpSession session = request.getSession(false);
		  if(session!=null) 
	        {
	            session.invalidate(); 
	            request.setAttribute("errMessage", "You have logged out successfully");
	            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
	            requestDispatcher.forward(request, response);
	            
	        }
		
	}



}
