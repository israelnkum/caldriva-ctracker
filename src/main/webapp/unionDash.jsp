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
String union = (String)session.getAttribute("name");
//(String)session.getAttribute("login");
String totalT =null;
String mon = null;
String option= request.getParameter("option");

if(option.equals("unionDash")){
JSONArray list = new JSONArray();
String query1 = "select month, count(*)from trip where unions='"+union+"' group by month";
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
String dataPo = null;
rs = stmt.executeQuery(query1);

				while(rs.next())
				{
				   
				    
					JSONObject obj = new JSONObject();
				    String total = rs.getString(1);
				    String month = rs.getString(2);
				    
				    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
					dataPo = gsonObj.toJson(list1);
					
				    obj.put("dataPoints", dataPo);
				    list.add(obj);
			             
			        } 
				    
				session.setAttribute("dataPo", dataPo);
				System.out.println(dataPo);
				out.print(list.toJSONString());
				out.flush();


				
}	
				
				
				else if(option.equals("tBranch")){
					String query1 = "select count(*)from branch where unions='"+union+"'";
			        
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
				}

				else if(option.equals("tVehicles")){
					String query1 = "select count(*)from vehile where unions='"+union+"'";
			        
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

				else if(option.equals("tTrips")){
					String query1 = "select count(*)from trip where unions='"+union+"'";
			        
					rs = stmt.executeQuery(query1);
					JSONArray list = new JSONArray();
					
					while(rs.next())
					{
					    JSONObject obj = new JSONObject();
					    String totalTr = rs.getString(1);
					   
					    
					    obj.put("totalTr", totalTr);
					    list.add(obj);
					    
					   
					}

					out.print(list.toJSONString());
					out.flush();
				}else if(option.equals("tDrivers")){
					System.out.println(" Driving ...............");
					String query1 = "select count(*) from driver where unions='"+union+"'";
			        
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
				}else if(option.equals("tUncompleted")){
					String query1 = "select count(*) from trip where status ='Incomplete' and unions='"+union+"'";
			        
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
				}else if(option.equals("unionDash1")){
					JSONArray list = new JSONArray();
					String query1 = "select month, sum(fees)from trip where unions='"+union+"' group by month";
					Gson gsonObj = new Gson();
					Map<Object,Object> map = null;
					List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
					String dataPo1 = null;
					rs = stmt.executeQuery(query1);

									while(rs.next())
									{
									   
									    
										JSONObject obj = new JSONObject();
									    String total = rs.getString(1);
									    String month = rs.getString(2);
									    
									    map = new HashMap<Object,Object>(); map.put("x", total); map.put("y", month); list1.add(map);
										dataPo1 = gsonObj.toJson(list1);
										
									    obj.put("dataPoints", dataPo1);
									    list.add(obj);
								             
								        } 
									    
									session.setAttribute("dataPo1", dataPo1);
									System.out.println(dataPo1);
									out.print(list.toJSONString());
									out.flush();


									
					}
%>










