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


Connection con;
PreparedStatement pst;
ResultSet rs;


con = DBConnection.getConnection();
Statement stmt = con.createStatement();
String option= request.getParameter("option");
if(option.equals("adminM")){
JSONArray list = new JSONArray();
String totalT =null;
String mon = null;
String query1 = "select month, count(*)from trip group by month";
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
rs = stmt.executeQuery(query1);

				while(rs.next())
				{
				   
				    
					JSONObject obj = new JSONObject();
				    String total = rs.getString(1);
				    String month = rs.getString(2);
				    
				    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
					dataPoints = gsonObj.toJson(list1);
					
				    obj.put("dataPoints", dataPoints);
				    list.add(obj);
			             
			        } 
				    
				session.setAttribute("dataPoints", dataPoints);
				System.out.println(dataPoints);
				out.print(list.toJSONString());
				out.flush();
}else if(option.equals("adminIncome")){
	JSONArray list = new JSONArray();
	String totalT =null;
	String mon = null;
	String query1 = "select month, sum(fees)from trip group by month";
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
	String income = null;
	rs = stmt.executeQuery(query1);

					while(rs.next())
					{
					   
					    
						JSONObject obj = new JSONObject();
					    String total = rs.getString(1);
					    String month = rs.getString(2);
					    
					    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
						income = gsonObj.toJson(list1);
						
					    obj.put("income", income);
					    list.add(obj);
				             
				        } 
					    
					session.setAttribute("income", income);
					System.out.println(income);
					out.print(list.toJSONString());
					out.flush();
	}else if(option.equals("countU")){
		String query1 = "select count(*) from union1";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalU = rs.getString(1);
		   
		    
		    obj.put("totalU", totalU);
		    list.add(obj);
		    
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tBranch")){
		String query1 = "select count(*) from branch";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
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
		String query1 = "select count(*) from vehile";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalV = rs.getString(1);
		   
		    
		    obj.put("totalV", totalV);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}
	else if(option.equals("tDrivers")){
		String query1 = "select count(*) from driver";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalDri = rs.getString(1);
		   
		    
		    obj.put("totalDri", totalDri);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tStations")){
		String query1 = "select count(*) from branch";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalSta = rs.getString(1);
		    System.out.println("are stations "+totalSta);
		    obj.put("totalSta", totalSta);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}else if(option.equals("tUncompleted")){
		String query1 = "select count(*) from trip where status ='Incomplete'";
        
		rs = stmt.executeQuery(query1);
		JSONArray list = new JSONArray();
		
		while(rs.next())
		{
		    JSONObject obj = new JSONObject();
		    String totalUnc = rs.getString(1);
		   
		    obj.put("totalUnc", totalUnc);
		    list.add(obj);
		    
		   
		}

		out.print(list.toJSONString());
		out.flush();
	}

%>