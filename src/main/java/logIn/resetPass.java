package logIn;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class resetPass
 */
@WebServlet("/resetPass")
public class resetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resetPass() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uName");
		String oldpass = request.getParameter("oldPass");
		String newpass = request.getParameter("newPass");
		String repeatpass = request.getParameter("repeatPass");
		HttpSession session = request.getSession();
		String currentpass = (String)session.getAttribute("pass");
		
		
		 if(uname.equals(null)||uname==""|| oldpass.equals(null)||oldpass==""|| newpass.equals(null)||newpass=="" || repeatpass.equals(null)||repeatpass==""){
				
				request.setAttribute("msg", "all fields are required");
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
			}
	        
	        else if(!newpass.equals(repeatpass)){
				request.setAttribute("msg", "password does not match");
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
			}
	        
	        else if(!currentpass.equals(oldpass)){
	        	getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
	        }
		 
	        else{
	        	String sql = "update login set password=? where manager=?";
	        	String url ="jdbc:mysql://localhost/caldriva";
	        	String userName ="root";
	        	String pass="root";
	        	
	        
	        	
	    		try {
	    			
	    			Class.forName("com.mysql.jdbc.Driver");
	    			
	    			Connection con = DriverManager.getConnection(url,userName,pass);
	    			PreparedStatement st = con.prepareStatement(sql);
	    			
	    			st.setString(1, newpass);
	    			st.setString(2, uname);
	    			st.executeUpdate();
	    			
	    			 response.sendRedirect("index.jsp");
	    		}catch(Exception e) {
	    			e.printStackTrace();
	    		}
	        	
	        	
	        }
	}

}
