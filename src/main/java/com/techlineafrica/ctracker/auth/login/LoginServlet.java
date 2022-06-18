package com.techlineafrica.ctracker.auth.login;

import com.techlineafrica.ctracker.auth.dao.LoginDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("union");
        String branch = request.getParameter("branch");
        String pass = request.getParameter("pass");

        response.getWriter().println(name);
        LoginDao dao = new LoginDao();
        HttpSession session = request.getSession(false);
        if(dao.check(name,branch, pass)) {

            if(name.equals("admin") && pass.equals(pass)) {

                session.setAttribute("name",name);
                session.setAttribute("branch",branch);
                session.setAttribute("pass",pass);
                response.sendRedirect("adminDashboard.jsp");


            }else if(name.equals(name)&& branch.equals("Union")&& pass.equals(pass)){
                session.setAttribute("name",name);
                session.setAttribute("branch",branch);
                session.setAttribute("pass",pass);
                response.sendRedirect("unionDashboard.jsp");
            }else if(name.equals(name)&&branch.contains("Branch") && pass.equals(pass)) {

                session.setAttribute("name",name);
                session.setAttribute("branch",branch);
                session.setAttribute("pass",pass);
                response.sendRedirect("BranchDashboard.jsp");

            }
        }

        else {
            response.sendRedirect("index.jsp");
        }
    }
}
