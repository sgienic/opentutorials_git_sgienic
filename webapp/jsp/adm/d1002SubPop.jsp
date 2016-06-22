<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%
if(!true){ //전달받은 파라미터를 보여줍니다. TEST 
	String p_name = new String();
	String p_value = new String();
	out.print("파라미터<br>");
	out.print("<TABLE border=1 >");
	for (Enumeration e = request.getParameterNames() ;e.hasMoreElements();) {
	 p_name = e.nextElement().toString();
	 p_value = request.getParameter(p_name).trim();
	 p_value = (p_value.equals(""))?"&nbsp":p_value;
	 out.print("\r<TR>\r <TD>"+ p_name+"</TD>");
	 out.print("\r");
	 out.print(" <TD>"+ p_value+"</TD>");
	 out.print("\r</TR>");
	}
	out.print("</TABLE>");
	}
%> 



<%
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	ResultSet rs=null;
	ResultSet rs2=null;		

	String id = request.getParameter("tb_id")==null?"":request.getParameter("tb_id").trim();
	String pw = request.getParameter("tb_pw")==null?"":request.getParameter("tb_pw").trim();	
	String connectionUrl = request.getParameter("connectionUrl")==null?"":request.getParameter("connectionUrl").trim();
	String dblist = request.getParameter("dblist")==null?"":request.getParameter("dblist").trim();
	String dbsel = request.getParameter("dbselect")==null?"":request.getParameter("dbselect").trim();
	String seltype = request.getParameter("seltype")==null?"":request.getParameter("seltype").trim();
	String rowct = request.getParameter("rowct")==null?"50":request.getParameter("rowct").trim();//보여질 low 수
	String excute_query = request.getParameter("excute_query")==null?"":request.getParameter("excute_query").trim();
	
	
	String ip = request.getParameter("ip")==null?"":request.getParameter("ip").trim();
	String port = request.getParameter("port")==null?"":request.getParameter("port").trim();
	String td_id = id;
	String td_pw = pw;
	
	String query ="";
	String query2="";
		
	String jdbcDriver = "";
	

	String rowNum = request.getParameter("rowNum")==null?"":request.getParameter("rowNum").trim();
	String username =request.getParameter("username")==null?"":request.getParameter("username").trim();
	String tableName = request.getParameter("tableName")==null?"":request.getParameter("tableName").trim();
	
	
	
    try {
        // 드라이버를 로딩한다.
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e ) {
    	e.printStackTrace();
    	out.print("err : " + e);
    }	
%>
<!-- username : <%=username %> -->


	<link rel="stylesheet" href="/css/popup.css" />




<%
try{
	connectionUrl = "jdbc:oracle:thin:@121.172.211.31:1521/orcl";
	id="swg";
	pw="swg_5678";
	con = DriverManager.getConnection(connectionUrl,id,pw); 	
%>




	<%				
	try{					
		con = DriverManager.getConnection(connectionUrl,id,pw); 
		excute_query = "select * from "+username+"."+tableName;
		query = excute_query;

		pstmt = con.prepareStatement(query); 		
		rs = pstmt.executeQuery();	
		
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int count1 = rsmd.getColumnCount();		
			int irowct =  Integer.parseInt(rowct);  
			%>			
			<table border="1">
			<%
			int j =0;
			while(rs.next()) {
				if(j<1){
					out.println("<tr>");
					
					for(int i = 1 ; i <= count1 ; i++){
						out.println("<td bgcolor=white class='list_tahoma'> <b>");	
						out.println(rsmd.getColumnName(i));
						out.println("</b></td>");
					}								
					out.println("</tr>");
				}
				if(irowct < j) {
					%>
					<tr height= bgcolor=white class='list_tahoma'>
						<td height="30" bgcolor="white" colspan="<%=count1%>" > 결과값이 너무 많습니다. <%=irowct+1%> 건만 보여집니다. </td>
					</tr>
					<%
						break;
				}						
				j=j+1;
				%>
				<tr >
				<%
				for(int i=1;i<=count1;i++){	
					out.println("<td bgcolor=white class='list_tahoma'>");
					out.println(rs.getString(rsmd.getColumnName(i)));
				}						
				%>
				</tr>
			<%}%>
			</table>						
			검색결과 : <%=j%>개가 검색되었습니다.
			<%					
	} catch(SQLException e){
		out.println("오류 : " + e + "<br>");
		out.println("<br>query : " + query + "<br>");					
	}
%>	

<%

} catch(SQLException e){
	out.println("오류 : " + e + "<br>");
	out.println("<br>query : " + query + "<br>");					
}
%>