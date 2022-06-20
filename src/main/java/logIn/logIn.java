package logIn;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginDao.loginDao;

/**
 * Servlet implementation class logIn
 */
@WebServlet("/logIn")
public class logIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logIn() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("union");
		String branch = request.getParameter("branch");
		String pass = request.getParameter("pass");
		
		try {
        // Static getInstance method is called with hashing MD5
        MessageDigest md = MessageDigest.getInstance("MD5");

        // digest() method is called to calculate message digest
        //  of an input digest() return array of byte
        byte[] messageDigest = md.digest(pass.getBytes());

        // Convert byte array into signum representation
        BigInteger no = new BigInteger(1, messageDigest);

        // Convert message digest into hex value
        String hashtext = no.toString(16);
        while (hashtext.length() < 32) {
            hashtext = "0" + hashtext;
        }
		
		loginDao dao = new loginDao();
		HttpSession session = request.getSession(false);
       if(dao.check(name,branch, hashtext)) {
			
			if(name.equals("admin") && pass.equals(pass)) {
			
			session.setAttribute("name",name);
			session.setAttribute("branch",branch);
			session.setAttribute("pass",hashtext);
			response.sendRedirect("adminDashboard.jsp");
			
			
			}else if(name.equals(name)&& branch.equals("Union")&& pass.equals(pass)){
				session.setAttribute("name",name);
				session.setAttribute("branch",branch);
				session.setAttribute("pass",hashtext);
				response.sendRedirect("unionDashboard.jsp");
			}else if(name.equals(name)&&branch.contains("Branch") && pass.equals(pass)) {
				
				session.setAttribute("name",name);
				session.setAttribute("branch",branch);
				session.setAttribute("pass",hashtext);
				response.sendRedirect("BranchDashboard.jsp");
				
			}
		}
		
		else {
			System.out.println("else was called.....");
			response.sendRedirect("index.jsp");
		}
	}catch(Exception e) {
		System.out.println(e);
		}
	}
}
