package com.techlineafrica.ctracker.libs;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

@WebServlet(name = "HellioServlet", value = "/hellio")
public class HellioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String baseUrl="https://api.helliomessaging.com/v1/sms?";
        final String phone = request.getParameter("phone");
        //Hi Benjamin Nyarko, Onboard is CR 123-22. Your Seat and Trip Numbers are 2 and T02048. Have a Safe Trip.
        // #ThinkRoadSafety
        // Powered By: BN Technology
        HttpSession session = request.getSession();
        String car = (String)session.getAttribute("car");
        String trip = (String)session.getAttribute("trip");
        String passenger = (String)session.getAttribute("passenger");
        String seat = (String)session.getAttribute("seat");

        System.out.println("the phone is"+phone+" and the passenger is "+ passenger);

        //Your username key
        String username = "&username=" + "bntechnology";// it was copied from the page
        String password = "&password=" + "BN41104012";
        String message = "&message=" + "Hi "+passenger+" Onboard is "+car+" Your Seat Number is "+seat+" And Your Trip Number is **"+trip+"** Powered By: BN Technology ";
        String senderId = "&senderId=" + "CALDRIVA";
        String msisdn = "&msisdn=" +phone; //also coming from jsp

        System.out.println(msisdn);

        //Prepare Url
        URLConnection myURLConnection=null;
        URL myURL=null;
        BufferedReader reader=null;

        //Base Endpoint

        //Prepare parameter string
        StringBuilder sbPostData= new StringBuilder(baseUrl);
        sbPostData.append("&username="+username);
        sbPostData.append("&password="+password);
        sbPostData.append("&senderId="+senderId);
        sbPostData.append("&msisdn="+msisdn);
        sbPostData.append("&message="+message);

        //final string
        baseUrl = sbPostData.toString();

        try
        {
            //prepare connection
            myURL = new URL(baseUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));

            //reading response
            String response1;
            while ((response1 = reader.readLine()) != null)
                //print response
                System.out.println(response1 +" "+phone);

            //finally close connection
            reader.close();

        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}
