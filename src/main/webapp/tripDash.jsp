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
<%@ page import="control.DBConnection" %>

<%

JSONArray list = new JSONArray();
Connection con;
PreparedStatement pst;
ResultSet rs;


con = DBConnection.getConnection();
Statement stmt = con.createStatement();
String branch = (String)session.getAttribute("branch");
String option= request.getParameter("option");
//(String)session.getAttribute("login");
if(option.equals("adminM")){
String totalT =null;
String mon = null;

String query1 = "select month, count(*)from trip where branch='"+branch+"' group by month";
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
String dataP = null;
rs = stmt.executeQuery(query1);

				while(rs.next())
				{
				   
				    
					JSONObject obj = new JSONObject();
				    String total = rs.getString(1);
				    String month = rs.getString(2);
				    
				    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
					dataP = gsonObj.toJson(list1);
					
				    obj.put("dataP", dataP);
				    list.add(obj);
			             
			        } 
				    
				session.setAttribute("dataPt",dataP);
				System.out.println(dataP);
				out.print(list.toJSONString());
				out.flush();
}else if(option.equals("adminMp")){
	String totalT =null;
	String mon = null;

	String query1 = "select month, sum(fees)from trip where branch='"+branch+"' group by month";
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
	String dataP = null;
	rs = stmt.executeQuery(query1);

					while(rs.next())
					{
					   
					    
						JSONObject obj = new JSONObject();
					    String total = rs.getString(1);
					    String month = rs.getString(2);
					    
					    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
						dataP = gsonObj.toJson(list1);
						
					    obj.put("dataPo", dataP);
					    list.add(obj);
				             
				        } 
					    
					session.setAttribute("dataPto",dataP);
					System.out.println("branches....**** "+dataP);
					out.print(list.toJSONString());
					out.flush();
	}else if(option.equals("tBranch")){
		String query1 = "select count(*)from trip where branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalB = rs.getString(1);
		   
		    
		    obj.put("totalB", totalB);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tVehicles")){
		String query1 = "select count(*)from vehile where branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalV = rs.getString(1);
		   
		    
		    obj.put("totalV", totalV);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tUncompleted")){
		String query1 = "select count(*) from trip where status ='Incomplete' and branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalUnc = rs.getString(1);
		   
		    obj.put("totalUnc", totalUnc);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tDrivers")){
		System.out.println(" Driving ...............");
		String query1 = "select count(*) from driver where branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalDri = rs.getString(1);
		   
		    
		    obj.put("totalDri", totalDri);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tT")){
		System.out.println(" Driving ...............");
		String query1 = "select count(*) from trip where branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalT = rs.getString(1);
		   
		    
		    obj.put("totalT", totalT);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tC")){
		System.out.println(" Driving ...............");
		String query1 = "select sum(fees) from trip where branch='"+branch+"'";
        
		rs = stmt.executeQuery(query1);
		//JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalC = rs.getString(1);
		   
		    
		    obj.put("tCash", totalC);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}

%>