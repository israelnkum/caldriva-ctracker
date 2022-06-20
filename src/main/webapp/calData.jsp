<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import= "java.util.*"%>
<%@page import= "java.time.Month"%>
<%@page import= "java.time.LocalDate"%>
<%@page import= "java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat "%>
<%@page import="java.text.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.util.*,java.sql.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>


<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="control.DBConnection" %>
<%@ page import="control.Encrypt" %>

<%

String branch1 = (String)session.getAttribute("branch");
Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	//String m =new SimpleDateFormat("MMMMM").format(cal.getTime())+"-"+new SimpleDateFormat("yyyy").format(cal.getTime()); 
	
	String m4 =new SimpleDateFormat("dd").format(cal1.getTime())+"-"+new SimpleDateFormat("MMM").format(cal1.getTime())+"-"+new SimpleDateFormat("yy").format(cal1.getTime());
	String m5 =new SimpleDateFormat("MMMM").format(cal1.getTime())+"/"+new SimpleDateFormat("yyyy").format(cal1.getTime()); 
  
	 DateFormat formatter = new SimpleDateFormat("hh:mm");
     String endTime = formatter.format(new Date());
     System.out.println(endTime);

JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;



con = DBConnection.getConnection();
Statement stmt = con.createStatement();
int i=0;
String option= request.getParameter("option");
String ids= request.getParameter("myid");
String search= request.getParameter("search");
String tripName= request.getParameter("seat");
String branch = (String)session.getAttribute("branch");
String unions = (String)session.getAttribute("unions");

if(option.equals("getBranch")){
	String query = "select * from branch where unions='"+unions+"'";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String branchName = rs.getString("branchName");
    String location = rs.getString("location");
    String branchManager = rs.getString("branchManager");
    String branchPhone = rs.getString("branchPhone");

    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("branchName", branchName);
    obj.put("location", location);
    obj.put("branchManager", branchManager);
    obj.put("branchPhone", branchPhone);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
} else if(option.equals("getVehi")){
	String query = "select * from vehile where branch='"+branch+"'or unions='"+unions+"'";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String date = rs.getString("date");
    String driver = rs.getString("driver");
    String vehileType = rs.getString("vehileType");
    String model = rs.getString("model");
    String carNumber = rs.getString("carNumber");
    String seatRange = rs.getString("seatRange");
    String fees = rs.getString("fees");

    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("date", date);
    obj.put("driver", driver);
    obj.put("vehileType", vehileType);
    obj.put("model", model);
    obj.put("carNumber", carNumber);
    obj.put("seatRange", seatRange);
    obj.put("fees", fees);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}else if(option.equals("getDriver")){
	String query = "select * from driver where branch='"+branch+"' or unions='"+unions+"'";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String date = rs.getString("date");
    String name = rs.getString("name");
    String gender = rs.getString("gender");
    String station = rs.getString("station");
    String phone = rs.getString("phone");
    String emergencyPhone = rs.getString("emergencyPhone");


    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("date", date);
    obj.put("name", name);
    obj.put("gender", gender);
    obj.put("station", station);
    obj.put("phone", phone);
    obj.put("emergencyPhone", emergencyPhone);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}

else if(option.equals("getTrip")){
	String query = "select * from trip where branch='"+branch+"' or unions='"+unions+"'";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String date = rs.getString("date");
    String vehicle = rs.getString("vehicle");
    String status = rs.getString("status");
    String trip = rs.getString("trip");
    String ATT = rs.getString("ATT");
    String speedL = rs.getString("speedL");

    
    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("date", date);
    obj.put("vehicle", vehicle);
    obj.put("status", status);
    obj.put("trip", trip);
    obj.put("ATT", ATT);
    obj.put("speedL", speedL);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}

else if(option.equals("getUnion")){
	String query = "select * from union1";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String date = rs.getString("date");
    String unionName = rs.getString("unionName");
    String location = rs.getString("location");
    String unionManager = rs.getString("unionManager");
    String unionPhone = rs.getString("unionPhone");
    i+=1;
    String number= String.valueOf(i);
    

    obj.put("id", id);
    obj.put("date", date);
    obj.put("unionName", unionName);
    obj.put("location", location);
    obj.put("unionManager", unionManager);
    obj.put("unionPhone", unionPhone);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}

else if(option.equals("getBook")){
	String query = "select * from booking where branch='"+branch+"' or unions='"+unions+"'";
	rs = stmt.executeQuery(query);
while(rs.next())
{
    JSONObject obj = new JSONObject();
    String id = rs.getString("id");
    String date = rs.getString("date");
    String passengerName = rs.getString("passengerName");
    String passengerPhone = rs.getString("passengerPhone");
    String emergencyPhone = rs.getString("emergencyPhone");
    String trip = rs.getString("trip");
    String destination = rs.getString("destination");
    String seatNumber = rs.getString("seatNumber");
    
    i+=1;
    String number= String.valueOf(i);
    
    obj.put("id", id);
    obj.put("date", date);
    obj.put("passengerName", passengerName);
    obj.put("passengerPhone", passengerPhone);
    obj.put("emergencyPhone", emergencyPhone);
    obj.put("trip", trip);
    obj.put("destination", destination);
    obj.put("seatNumber", seatNumber);
    obj.put("number", number);
    list.add(obj);
}

out.print(list.toJSONString());
out.flush();
}

else if(option.equals("showBranch")){
	String query1 = "select * from branch where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String name = rs.getString("branchName");
	    String location = rs.getString("location");
	    String manager = rs.getString("branchManager");
	    String phone = rs.getString("branchPhone");
	    
	    
	    
	    
	    i+=1;
	    String number= String.valueOf(i);
	    
	    
	    obj.put("name", name);
	    obj.put("location", location);
	    obj.put("manager", manager);
	    obj.put("phone", phone);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("showV")){
	String query1 = "select * from vehile where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String driver = rs.getString("driver");
	    String vehileType = rs.getString("vehileType");
	    String model = rs.getString("model");
	    String carNumber = rs.getString("carNumber");
	    String seatRange = rs.getString("seatRange");
	    String fees = rs.getString("fees");
	    
	    
	    i+=1;
	    String number= String.valueOf(i);
	    
	    
	    obj.put("driver", driver);
	    obj.put("vehileType", vehileType);
	    obj.put("model", model);
	    obj.put("carNumber", carNumber);
	    obj.put("seatRange", seatRange);
	    obj.put("fees", fees);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("showDri")){
	String query1 = "select * from driver where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String name = rs.getString("name");
	    String gender = rs.getString("gender");
	    String station = rs.getString("station");
	    String phone = rs.getString("phone");
	    String emergencyPhone = rs.getString("emergencyPhone");
	   
	    obj.put("name", name);
	    obj.put("gender", gender);
	    obj.put("station", station);
	    obj.put("phone", phone);
	    obj.put("emergencyPhone", emergencyPhone);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("showTrip")){
	String query1 = "select * from trip where id='"+ids+"' and branch='"+branch+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String vehicle = rs.getString("vehicle");
	    String status = rs.getString("status");
	    String trip = rs.getString("trip");
	    String ATT = rs.getString("ATT");
	    String speedL = rs.getString("speedL");
	   
	    obj.put("vehicle", vehicle);
	    obj.put("status", status);
	    obj.put("trip", trip);
	    obj.put("ATT", ATT);
	    obj.put("speedL", speedL);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("showBook")){
	String query1 = "select * from booking where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String passengerName = rs.getString("passengerName");
	    String passengerPhone = rs.getString("passengerPhone");
	    String emergencyPhone = rs.getString("emergencyPhone");
	    String trip = rs.getString("trip");
	    String destination = rs.getString("destination");
	    String seatNumber = rs.getString("seatNumber");
	    obj.put("passengerName", passengerName);
	    obj.put("passengerPhone", passengerPhone);
	    obj.put("emergencyPhone", emergencyPhone);
	    obj.put("trip", trip);
	    obj.put("destination", destination);
	    obj.put("seatNumber", seatNumber);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("showUnion")){
	String query1 = "select * from union1 where id='"+ids+"'";

	rs = stmt.executeQuery(query1);
	
	
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String unionName = rs.getString("unionName");
	    String location = rs.getString("location");
	    String unionManager = rs.getString("unionManager");
	    String unionPhone = rs.getString("unionPhone");

	    obj.put("unionName", unionName);
	    obj.put("location", location);
	    obj.put("unionManager", unionManager);
	    obj.put("unionPhone", unionPhone);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("delete")){
	
}else if(option.equals("addBranch")){
	System.out.println("adding branch ................");
	String name = request.getParameter("Name");
    String location = request.getParameter("location");
    String manager = request.getParameter("manager");
    String phone = request.getParameter("phone");
    String union = unions;
    String date = m4;
    
  
    pst = con.prepareStatement("insert into branch(date,branchName,location,branchManager,branchPhone,unions)values(?,?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, name);
    pst.setString(3, location);
    pst.setString(4, manager);
    pst.setString(5, phone);
    pst.setString(6, union);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}else if(option.equals("addUnion")){
	System.out.println("adding branch ................");
	String name = request.getParameter("Name");
    String location = request.getParameter("location");
    String manager = request.getParameter("union");
    String phone = request.getParameter("phone");
    String date = m4;
    
  
    pst = con.prepareStatement("insert into union1(date,unionName,location,unionManager,unionPhone)values(?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, name);
    pst.setString(3, location);
    pst.setString(4, manager);
    pst.setString(5, phone);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("addDriver")){
	System.out.println("adding branch ................");
	String name = request.getParameter("Name");
    String gender = request.getParameter("gender");
    String bran = request.getParameter("branch");
    String phone = request.getParameter("phone");
    String ephone = request.getParameter("ephone");
    String union = unions;
    
    String date = m4;
    
  
    pst = con.prepareStatement("insert into driver(date,name,gender,station,phone,emergencyPhone,unions,branch)values(?,?,?,?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, name);
    pst.setString(3, gender);
    pst.setString(4, bran);
    pst.setString(5, phone);
    pst.setString(6, ephone);
    pst.setString(7, union);
    pst.setString(8, branch);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("addTrip")){
	
	String vehicle = request.getParameter("vehicle");
   
    String description = request.getParameter("description");
    String average = request.getParameter("average");
    String over = request.getParameter("over");
    String time = request.getParameter("time");
    String month = m5;
    String date = m4;
    String dt = description+" "+time;
    String fees =null;
    
    String ql = "Select fees from vehile where carNumber = '"+vehicle+"'";
    rs = stmt.executeQuery(ql);
    while(rs.next()){
    	fees = rs.getString(1);
    }
    pst = con.prepareStatement("insert into trip(date,vehicle,status,trip,ATT,speedL,branch,unions,month,fees)values(?,?,'Booking',?,?,?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, vehicle);
    
    pst.setString(3, dt);
    pst.setString(4, average);
    pst.setString(5, over);
    pst.setString(6, branch);
    pst.setString(7, unions);
    pst.setString(8, month);
    pst.setString(9, fees);
  
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", vehicle);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("addVehicle")){
	System.out.println("adding branch ................");
	String driver = request.getParameter("driver");
    String type = request.getParameter("type");
    String model = request.getParameter("model");
    String number = request.getParameter("number");
    String seat = request.getParameter("seat");
    String fees = request.getParameter("fees");
    String date = m4;
    
  
    pst = con.prepareStatement("insert into vehile(date,driver,vehileType,model,carNumber,seatRange,fees,branch,unions)values(?,?,?,?,?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, driver);
    pst.setString(3, type);
    pst.setString(4, model);
    pst.setString(5, number);
    pst.setString(6, seat);
    pst.setString(7, fees);
    pst.setString(8, branch);
    pst.setString(9, unions);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("bankShortCode", fees);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("addBook")){
	System.out.println("adding branch ................");
	String idNumber = request.getParameter("idNumber");
	String passenger = request.getParameter("passenger");
	session.setAttribute("passenger", passenger);
    String phone = request.getParameter("phone");
    String ephone = request.getParameter("ephone");
    String trip = request.getParameter("trip");
    session.setAttribute("trip", trip);
    String destination = request.getParameter("destination");
    String seat = request.getParameter("seat");
    session.setAttribute("seat", seat);
    String date = m4;
    
  
    pst = con.prepareStatement("insert into booking(date,passengerName,passengerPhone,emergencyPhone,trip,destination,seatNumber,idNumber,branch,unions)values(?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1, date);
    pst.setString(2, passenger);
    pst.setString(3, phone);
    pst.setString(4, ephone);
    pst.setString(5, trip);
    pst.setString(6, destination);
    pst.setString(7, seat);
    pst.setString(8, idNumber);
    pst.setString(9, branch);
    pst.setString(10, unions);
    pst.executeUpdate();
    //////////////////////////////////////**************   hellio txt msg  *****************************///////////////////////////////
    
    
    
//////////////////////////////////////**************   hellio txt msg  *****************************///////////////////////////////   
    JSONObject obj = new JSONObject();
    obj.put("phone", phone);

    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
	
	
}

else if(option.equals("editSta")){
	
	String name = request.getParameter("Name");
    String location = request.getParameter("location");
    String manager = request.getParameter("manager");
    String phone = request.getParameter("phone");
    
    String id = request.getParameter("myid");
    
  
    pst = con.prepareStatement("update branch set branchName=?,location=?,branchManager=?,branchPhone=? where id =?");
    pst.setString(1, name);
    pst.setString(2, location);
    pst.setString(3, manager);
    pst.setString(4, phone);
    pst.setString(5, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("editV")){
	
	String name = request.getParameter("Name");
    String type = request.getParameter("type");
    String model = request.getParameter("model");
    String number = request.getParameter("number");
    String seat = request.getParameter("seat");
    String fees = request.getParameter("fees");
    
    String id = request.getParameter("myid");
    
  
    pst = con.prepareStatement("update vehile set driver=?,vehileType=?,model=?,carNumber=?,seatRange=?,fees=? where id =?");
    pst.setString(1, name);
    pst.setString(2, type);
    pst.setString(3, model);
    pst.setString(4, number);
    pst.setString(5, seat);
    pst.setString(6, fees);
    pst.setString(7, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}


else if(option.equals("editDri")){
	
	String name = request.getParameter("Name");
    String gender = request.getParameter("gender");
    String branc = request.getParameter("branch");
    String phone = request.getParameter("phone");
    String ephone = request.getParameter("ephone");
    
    String id = request.getParameter("myid");
    
  
    pst = con.prepareStatement("update driver set name=?,gender=?,station=?,phone=?,emergencyPhone=? where id =?");
    pst.setString(1, name);
    pst.setString(2, gender);
    pst.setString(3, branc);
    pst.setString(4, phone);
    pst.setString(5, ephone);
    pst.setString(6, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("editTrip")){
	
	String vehicle = request.getParameter("vehicle");
    String status = request.getParameter("status");
    String description = request.getParameter("description");
    String average = request.getParameter("average");
    String over = request.getParameter("over");
    
    String id = request.getParameter("myid");
    
    pst = con.prepareStatement("update trip set vehicle=?,status=?,trip=?,ATT=?,speedL=? where id =?");
    pst.setString(1, vehicle);
    pst.setString(2, status);
    pst.setString(3, description);
    pst.setString(4, average);
    pst.setString(5, over);
    pst.setString(6, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", over);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("editBook")){
	
	String passenger = request.getParameter("passenger");
    String phone = request.getParameter("phone");
    String ephone = request.getParameter("ephone");
    String trip = request.getParameter("trip");
    String destination = request.getParameter("destination");
    String seat = request.getParameter("seat");
    String id = request.getParameter("myid");
    
    pst = con.prepareStatement("update booking set passengerName=?,passengerPhone=?,emergencyPhone=?,trip=?,destination=?,seatNumber=? where id =?");
    pst.setString(1, passenger);
    pst.setString(2, phone);
    pst.setString(3, ephone);
    pst.setString(4, trip);
    pst.setString(5, destination);
    pst.setString(6, seat);
    pst.setString(7, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", seat);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("editUnion")){
	
	String name = request.getParameter("Name");
    String location = request.getParameter("location");
    String union = request.getParameter("union");
    String phone = request.getParameter("phone");
    String id = request.getParameter("myid");
    
    pst = con.prepareStatement("update union1 set unionName=?,location=?,unionManager=?,unionPhone=? where id =?");
    pst.setString(1, name);
    pst.setString(2, location);
    pst.setString(3, union);
    pst.setString(4, phone);
    pst.setString(5, id);
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("name", name);
    list.add(obj);
	
    out.print(list.toJSONString());
	out.flush();
}

else if(option.equals("activate")){
	
	String id = request.getParameter("myid");
	pst = con.prepareStatement("update employee set bStatus='Not Active' where id=?");
	pst.setString(1, id);
	
    pst.executeUpdate();
    JSONObject obj = new JSONObject();
    obj.put("id", id);
    list.add(obj);
}



else if(option.equals("getA")){
	String query2 = "select * from employee where bStatus='Active'";


	rs = stmt.executeQuery(query2);
	int ii=0;
	while(rs.next())
	{
	    JSONObject obj = new JSONObject();
	    String id = rs.getString("id");
	    String name = rs.getString("Name");
	    String account = rs.getString("AccountNumber");
	    String bank = rs.getString("BankName");
	    String ssnit = rs.getString("ssnit");
	    String department = rs.getString("department");
	    String position = rs.getString("position");
	    String status = rs.getString("bStatus");
	    i+=1;
	    String number= String.valueOf(i);
	    

	    obj.put("id", id);
	    obj.put("name", name);
	    obj.put("account", account);
	    obj.put("bank", bank);
	    obj.put("ssnit", ssnit);
	    obj.put("department", department);
	    obj.put("position", position);
	    obj.put("status", status);
	    obj.put("number", number);
	    list.add(obj);
	}

	out.print(list.toJSONString());
	out.flush();
	}else if(option.equals("getD")){
		String query2 = "select * from employee where bStatus='Not Active'";


		rs = stmt.executeQuery(query2);
		int ii=1;
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String id = rs.getString("id");
		    String name = rs.getString("Name");
		    String account = rs.getString("AccountNumber");
		    String bank = rs.getString("BankName");
		    String ssnit = rs.getString("ssnit");
		    String department = rs.getString("department");
		    String position = rs.getString("position");
		    String status = rs.getString("bStatus");
		    i+=1;
		    String number= String.valueOf(ii);
		    

		    obj.put("id", id);
		    obj.put("name", name);
		    obj.put("account", account);
		    obj.put("bank", bank);
		    obj.put("ssnit", ssnit);
		    obj.put("department", department);
		    obj.put("position", position);
		    obj.put("status", status);
		    obj.put("number", number);
		    list.add(obj);
		}

		out.print(list.toJSONString());
		out.flush();
		}else if(option.equals("dActivate")){
			
			String id = request.getParameter("myid");
			pst = con.prepareStatement("update employee set bStatus='Active' where id=?");
			pst.setString(1, id);
			
		    pst.executeUpdate();
		    JSONObject obj = new JSONObject();
		    obj.put("id", id);
		    list.add(obj);
		    
		    out.print(list.toJSONString());
			out.flush();
		}else if(option.equals("getN")){
			String query2 = "select * from employee where bStatus='Active'";
           
			rs = stmt.executeQuery(query2);
			
			while(rs.next())
			{
			    
			    
			    String name = rs.getString("Name");
			    JSONObject obj = new JSONObject();
			    obj.put("name", name);
			    list.add(obj);
			}

			out.print(list.toJSONString());
			out.flush();
			}else if(option.equals("getL")){
				String query2 = "select * from empFile";


				rs = stmt.executeQuery(query2);
				int ii=0;
				while(rs.next())
				{
				    JSONObject obj = new JSONObject();
				    String id = rs.getString("ID");
				    String name = rs.getString("empName");
				    String date = rs.getString("Ldate");
				    String desc = rs.getString("description");
				    String phone = rs.getString("phone");
				    String company = rs.getString("company");
				    String position = rs.getString("position");
				    String depart = rs.getString("department");
				    String letter = rs.getString("letter");
				    ii+=1;
				    String number= String.valueOf(ii);
				    
				    obj.put("id", id);
				    obj.put("number", number);
				    obj.put("name", name);
				    obj.put("desc", desc);
				    obj.put("phone", phone);
				    obj.put("company", company);
				    obj.put("position", position);
				    obj.put("depart", depart);
				    obj.put("letter", letter);
				    obj.put("date", date);
				    
				    list.add(obj);
				}

				out.print(list.toJSONString());
				out.flush();
				
				}else if(option.equals("deleteVehi")){
					
                    System.out.println("deleting ..............");
					
					pst = con.prepareStatement("delete from vehile where id=?");
					pst.setString(1, ids);
					pst.executeUpdate();
					
					    JSONObject obj = new JSONObject();
					    
					    obj.put("id", ids);
					   
					    
					    list.add(obj);
					

					out.print(list.toJSONString());
					out.flush();
					}else if(option.equals("deletepass")){
						
	                    System.out.println("deleting ..............");
						
						pst = con.prepareStatement("delete from booking where id=?");
						pst.setString(1, ids);
						pst.executeUpdate();
						
						    JSONObject obj = new JSONObject();
						    
						    obj.put("id", ids);
						   
						    
						    list.add(obj);
						

						out.print(list.toJSONString());
						out.flush();
						}else if(option.equals("deleteT")){
							
		                    System.out.println("deleting ..............");
							
							pst = con.prepareStatement("delete from trip where id=?");
							pst.setString(1, ids);
							pst.executeUpdate();
							
							    JSONObject obj = new JSONObject();
							    
							    obj.put("id", ids);
							   
							    
							    list.add(obj);
							

							out.print(list.toJSONString());
							out.flush();
							}else if(option.equals("deleteDr")){
								
			                    System.out.println("deleting ..............");
								
								pst = con.prepareStatement("delete from union1 where id=?");
								pst.setString(1, ids);
								pst.executeUpdate();
								
								    JSONObject obj = new JSONObject();
								    
								    obj.put("id", ids);
								   
								    
								    list.add(obj);
								

								out.print(list.toJSONString());
								out.flush();
								}else if(option.equals("deleteSta")){
									
				                    //System.out.println("deleting ..............");
									
									pst = con.prepareStatement("delete from branch where id=?");
									pst.setString(1, ids);
									pst.executeUpdate();
									
									    JSONObject obj = new JSONObject();
									    
									    obj.put("id", ids);
									   
									    
									    list.add(obj);
									

									out.print(list.toJSONString());
									out.flush();
									}else if(option.equals("searchID")){
										String query = "select * from booking where idNumber='"+search+"'";
										rs = stmt.executeQuery(query);
										
									while(rs.next())
									{
									    JSONObject obj = new JSONObject();
									    
									    String passengerName = rs.getString("passengerName");
									    String passengerPhone = rs.getString("passengerPhone");
									    String emergencyPhone = rs.getString("emergencyPhone");
									    
									  
									    obj.put("passengerName", passengerName);
									    obj.put("passengerPhone", passengerPhone);
									    obj.put("emergencyPhone", emergencyPhone);
									    
									   
									    list.add(obj);
									}

									out.print(list.toJSONString());
									out.flush();
									}


									else if(option.equals("seat")){
										System.out.println("seat called..." +tripName);
										String query = "select * from trip where trip='"+tripName+"'";
										
										List<Integer> numbers=new ArrayList();
										
										rs = stmt.executeQuery(query);
										String seatR="";
									while(rs.next())
									{
									    JSONObject obj = new JSONObject();
									    String idt = rs.getString("id");
									    String vehicle = rs.getString("vehicle");
									    session.setAttribute("car", vehicle);
									    String query1 = "select * from vehile where carNumber='"+vehicle+"'";
									    rs = stmt.executeQuery(query1);
									    while(rs.next()){
									    	seatR=rs.getString("seatRange").replaceAll(" ", "");
									    	
									    	
									    }
									    String sub = seatR.length() >= 2 ? seatR.substring(seatR.length() - 2) : seatR;
									    int seats=Integer.parseInt(sub);
									    int sn = 0;
									 ///////////////////  things happen here ///////////////////////
									    int seatForU=0;
									    String query2 = "select * from booking where trip='"+tripName+"'";
									    rs = stmt.executeQuery(query2);
									    while(rs.next()){
									    	sn=rs.getInt("seatNumber");
									    	numbers.add(sn);
									    }
									    System.out.println("the size is = " + numbers);
									    Collections.sort(numbers);
									    int ii = 1;
									    while(ii< numbers.size()) {
									        if (numbers.get(ii) - numbers.get(ii-1) == 1) {

									        } else {
									        	int check;
									            System.out.println("Missing number is " + (numbers.get(ii-1) + 1));
									            numbers.add((numbers.get(ii-1)+1));
									            Collections.sort(numbers);
									            check = numbers.get(ii-1) + 1;
									            sn = check-1;
									            System.out.println(" missing seat for the range "+ sn);
									        }
									        ii++;
									    }

									    
									   
					                  ///////////////////  things happen here ///////////////////////
									    
									    if(sn == seats-1){
									    	System.out.println(seats-1 +" is the remainig seat");
									    	pst = con.prepareStatement("update trip set status='Started',sTime=? where id=?");
									    	pst.setString(1, endTime);
											pst.setString(2, idt);
										    pst.executeUpdate();
										    seatForU = seats-1;
									    	
									    }else if(sn == 0){
									    	seatForU = 1;
									    	System.out.println("take the first seat  " + seats);
									    }else if(sn != seats){
									    	
									    	seatForU = sn+1;
									    	System.out.println(seats);
									    }else{
									    	continue;
									    }
									    
									    obj.put("seatForU", seatForU);
									   
									    
									   
									    list.add(obj);
									}

									out.print(list.toJSONString());
									out.flush();
									}else if(option.equals("incomplete")){
										
										String id = request.getParameter("myid");
										String reason ="Incomplete : "+ request.getParameter("reason");
										pst = con.prepareStatement("update trip set status=? where id=?");
										pst.setString(1, reason);
										pst.setString(2, id);
										
									    pst.executeUpdate();
									    JSONObject obj = new JSONObject();
									    obj.put("id", id);
									    list.add(obj);
									}else if(option.equals("can")){
										
										String id = request.getParameter("myid");
										
										pst = con.prepareStatement("update trip set status='Cancelled' where id=?");
										pst.setString(1, id);
										
									    pst.executeUpdate();
									    JSONObject obj = new JSONObject();
									    obj.put("id", id);
									    list.add(obj);
									}else if(option.equals("end")){
										String id = request.getParameter("myid");
										String munites="";
										pst = con.prepareStatement("update trip set status='Ended',eTime=? where id=?");
										pst.setString(1, endTime);
										pst.setString(2, id);
									    pst.executeUpdate();
									    JSONObject obj = new JSONObject();
									    obj.put("id", id);
									    list.add(obj);
									    ///////////////***************   Calculate End Time  ****************/////////////////
									    String sTime = "";
									    String sql = "select sTime from trip where id='"+id+"'";
									    rs = stmt.executeQuery(sql);
									    while(rs.next()){
									    	sTime=rs.getString(1);
									    	String sql1 = "SELECT (TIME_TO_SEC('"+endTime+"') - TIME_TO_SEC('"+sTime+"'))/60";
									    	rs = stmt.executeQuery(sql1);
									    	while(rs.next()){
									    		munites= rs.getString(1);
									    		System.out.println("the driver used "+munites+" to reach his destination");
									    	}
									    }
									    
									    obj.put("id", id);
									    obj.put("munites", munites);
									    list.add(obj);
									    //////////////****************   Calculate End Time  ****************/////////////////
									    
									}else if(option.equals("showpass")){
										System.out.println("printing passengers..........");
										String query = "select trip from trip where id ='"+ids+"'";
										rs = stmt.executeQuery(query);
										while(rs.next()){
											String tripN=rs.getString(1);
											String query1 = "select * from booking where trip ='"+tripN+"'";
											rs = stmt.executeQuery(query1);
															while(rs.next())
															{
															    JSONObject obj = new JSONObject();
															    String id = rs.getString("id");
															    String date = rs.getString("date");
															    String passengerName = rs.getString("passengerName");
															    String passengerPhone = rs.getString("passengerPhone");
															    String emergencyPhone = rs.getString("emergencyPhone");
															    String trip = rs.getString("trip");
															    String destination = rs.getString("destination");
															    String seatNumber = rs.getString("seatNumber");
															    
															    i+=1;
															    String number= String.valueOf(i);
															    
															    obj.put("id", id);
															    obj.put("date", date);
															    obj.put("passengerName", passengerName);
															    obj.put("passengerPhone", passengerPhone);
															    obj.put("emergencyPhone", emergencyPhone);
															    obj.put("trip", trip);
															    obj.put("destination", destination);
															    obj.put("seatNumber", seatNumber);
															    obj.put("number", number);
															    list.add(obj);
															}
						
															out.print(list.toJSONString());
															out.flush();
															
										}
									}else if(option.equals("addunion")){
										
										String union = request.getParameter("union");
										String name = request.getParameter("name");
									    String pass = request.getParameter("pass");
									    
									    String date = m4;
									   
									  
									    pst = con.prepareStatement("insert into unionmanager(unionName,manager,date)values(?,?,?)");
									   
									    pst.setString(1, union);
									    pst.setString(2, name);
									    pst.setString(3, date);
									   
									    pst.executeUpdate();
									    
									    Encrypt.enc(pass,union);
									    
									    JSONObject obj = new JSONObject();
									    obj.put("passenger", union);
									    list.add(obj);
										
									    out.print(list.toJSONString());
										out.flush();
									}else if(option.equals("addbranchM")){
										
										String union = request.getParameter("union");
										String name = request.getParameter("name");
									    String pass = request.getParameter("pass");
									    String branches = request.getParameter("bBranch");
									    
									    System.out.println(union+" "+name+" "+pass+" "+branches);
									    
									    String date = m4;
									    
									  
									    pst = con.prepareStatement("insert into branchManager(unionName,manager,date)values(?,?,?)");
									   
									    pst.setString(1, union);
									    pst.setString(2, name);
									    pst.setString(3, date);
									   
									    pst.executeUpdate();
									    
									    pst = con.prepareStatement("insert into login(unions,branch,password,name)values(?,?,?,?)");
									    pst.setString(1, union);
									    pst.setString(2, branches+" Branch");
									    pst.setString(3, pass);
									    pst.setString(4, name);
									   
									    pst.executeUpdate();
									    JSONObject obj = new JSONObject();
									    obj.put("passenger", union);
									    list.add(obj);
										
									    out.print(list.toJSONString());
										out.flush();
									}else if(option.equals("addstaff")){
										
										String union = request.getParameter("union");
										String name = request.getParameter("name");
									    String pass = request.getParameter("pass");
									    String branches = request.getParameter("branch");
									    
									    String date = m4;									    
									    pst = con.prepareStatement("insert into login(unions,branch,password,name)values(?,?,?,?)");
									    pst.setString(1, union);
									    pst.setString(2, branches);
									    pst.setString(3, pass);
									    pst.setString(4, name);
									   
									    pst.executeUpdate();
									    JSONObject obj = new JSONObject();
									    obj.put("passenger", union);
									    list.add(obj);
										
									    out.print(list.toJSONString());
										out.flush();
									}else if(option.equals("adminM")){
										
											String totalT =null;
											String mon = null;
											String query1 = "select distinct o.month,count(o.trip) OVER(PARTITION BY o.month) as total from trip o";
											Gson gsonObj = new Gson();
										    
										    List<Object> m = new ArrayList<Object>();
										    List<Object> t = new ArrayList<Object>();
											rs = stmt.executeQuery(query1);
															while(rs.next())
															{
															    
															    
																HttpSession sess = request.getSession(false);
															    String total = rs.getString(2);
															    String month = rs.getString(1);
															    
															    m.add(month);
															    t.add(total);
															     mon = gsonObj.toJson(m);
															     totalT = gsonObj.toJson(t);
															     sess.setAttribute("mon", mon);
															     sess.setAttribute("totalT", totalT);
															     
															    
															}
															JSONObject obj = new JSONObject();
															obj.put("total", totalT);
														    obj.put("month", mon);
														    
														    list.add(obj);
															out.print(list.toJSONString());
															out.flush();
														
										
									}




                            


%>