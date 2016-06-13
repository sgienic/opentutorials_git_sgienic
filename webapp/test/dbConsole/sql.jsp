<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>
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
	<%request.setCharacterEncoding("euc-kr");

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
	
	
	connectionUrl = "jdbc:oracle:thin:@121.172.211.31:1521/orcl";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Welcome to SQL</title>
<style type="text/css">
<!--
.list_sbj {text-align:left; padding:0; margin:0;}
.t_border { 
border-bottom:4px solid #E1F3FC;
border-top:4px solid #E1F3FC;
border-left:4px solid #E1F3FC;
border-right:4px solid #E1F3FC
}
.list_tahoma {
font-family:"tahoma";
font-size:10pt; 
text-decoration:none; 
color:#333333; 
text-align:center;}
-->
</style>	
</head>
<body>
	<form action="sql.jsp" method="post">
	<% 		
	if(dbsel.equals("1")){ //MSSQL		
		out.print("MSSQL 접속 ");		
		jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		connectionUrl = "jdbc:sqlserver://"+ip+":"+port+";databaseName="+dblist;		
		Class.forName(jdbcDriver);		
	}else if (dbsel.equals("2")){ //MYSQL
		out.print("MYSQL 접속 ");
		jdbcDriver = "com.mysql.jdbc.Driver";
		connectionUrl = "jdbc:mysql://"+ip+":"+port+"/"+dblist;			
		Class.forName(jdbcDriver);		    
		//return;		
	}else if (dbsel.equals("3")){ //ORACLE
		out.print("ORACLE 접속 ");		
	
		try {
	        // 드라이버를 로딩한다.
	        Class.forName("oracle.jdbc.driver.OracleDriver");
	    } catch (ClassNotFoundException e ) {
	    	e.printStackTrace();
	    	out.print("err : " + e);
	    	System.out.println("err : " + e); 
	    }			
		//return;
	}
	try{
	con = DriverManager.getConnection(connectionUrl,id,pw); 	

	out.print("con :  " + con);		
	
	//query = "SELECT table_name name , table_comment  FROM INFORMATION_SCHEMA.TABLES  where table_schema ='"+dblist+"'";
	//query2 = "select count(table_name) as count FROM INFORMATION_SCHEMA.TABLES  where table_schema ='"+dblist+"'";
	
	query = "select tname from tab";
	query2 = "select count(tname) as count from tab";
	 
	
	pstmt = con.prepareStatement(query); 			//mssql에서 db 목록 전체 내용을 가져오게 된다.
	pstmt2 = con.prepareStatement(query2); 			//mssql에서 db 목록 갯수를 가져오게 된다.
	
	rs = pstmt.executeQuery();						//실행한 결과를 담고 있다.
	rs2 = pstmt2.executeQuery();					
	
	rs2.next();							
	int count = rs2.getInt("count");				//디비 갯수 저장

	String[] list;									//list배열선언
	list = new String[count];						
	
	for(int i=0;i<count;i++){						//list에 서버 종류 저장
		rs.next();		
		list[i]=id + " " +  rs.getString("tname") ;				
	}
	%>
	사용자 : <%=id%> <br> 
	
	
	<%if(excute_query.length()>1) { %>
	<table width=200 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">  	
	<tr>
		<td height=30 bgcolor=#BCD7E6 align=center>
			<font color=#FFE69D size=20>-결과-</font>
		</td>
	</tr>
	</table>

		<table width=1200 align=center border=1 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">	
			<tr height=30 bgcolor=white>
				<td >
				<%				
				try{					
					con = DriverManager.getConnection(connectionUrl,id,pw); 
				
					query = excute_query;
					out.println("query : "+query);

					pstmt = con.prepareStatement(query); 			//mssql에서 db 목록 전체 내용을 가져오게 된다.

					if(seltype.equals("1")){
						rs = pstmt.executeQuery();						//실행한 결과를 담고 있다.
						
					}else if(seltype.equals("2")) {
						pstmt.executeUpdate();						
						pstmt.close();
						con.commit(); //커밋
					}				
					if(seltype.equals("1")){
						ResultSetMetaData rsmd = rs.getMetaData();
						
						int count1 = rsmd.getColumnCount();		
						int irowct =  Integer.parseInt(rowct);  
						%>						
						<table width=1200 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">
						<%
						int j =0;
						while(rs.next()) {
							if(j<1){
								out.println("<tr height='20'>");
								
								for(int i = 1 ; i <= count1 ; i++){
									out.println("<td bgcolor=white class='list_tahoma'>");	
									out.println(rsmd.getColumnName(i));
									out.println("</td>");
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
							<tr height="100">
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
					}else if(seltype.equals("2")) {
						out.println("요청하신 쿼리가 수행되었습니다. <br> sql : " + query);
					}
				} catch(SQLException e){
					out.println("오류 : " + e + "<br>");
					out.println("<br>query : " + query + "<br>");					
				}
		%>	
		<table width=300 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#777777>					
		</table>
		</td>
		</tr>
		</table>	
	<%}%>
	
	
	<input type="hidden" name ="dblist" value="<%=dblist%>">
	<table width=500 border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">	
		<tr height=30 bgcolor=white>
			<td width="70" height="30" bgcolor="white">table </td>
			<td width="220">
				<select name="table">
				<%
				String dbselected="";
				for(int i=0;i<count;i++){
					if(dblist.length()>1){
					}%>
					<option value=<%=list[i]%>> <%=list[i]%> </option>				 
				<%}%>
				<%=dblist%>	
				</select>			
			</td>
		</tr>	
	</table>	



	<table width=500 border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">	
		<tr height=30 bgcolor=white>
			<td width="70" height="30" bgcolor="white">SQL 종류 선택</td>
			<td width="220">
				<input name="seltype" type="radio" value="1" checked="checked">Select
				<input name="seltype" type="radio" value="2" >Create,Drop,Insert,Delete,Update
			</td>
		</tr>	
		<tr height=30 bgcolor=white class='list_tahoma'>
			<td width="100" height="30" bgcolor="white">row 제한</td>
			<td width="220">
				<input type="text" name="rowct" value="<%=rowct%>"> 100건이하로 셋팅해주세요.
			</td>
		</tr>		
	</table>
			
	<table width=500 border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">	
		<tr height=30 bgcolor=white class='list_tahoma'>
			<td width="70" height="30" bgcolor="white">SQL문</td>
			<td width="220">
				<textarea name=excute_query cols=45 rows=10><%=excute_query%></textarea>
			</td>
		</tr>	
	</table>
	
			
		
	<table  border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">
		<tr>
			<td height=30 bgcolor="white"> 
				<input type="submit" name="login" value="실행">
			</td>
			<td height=30 bgcolor="white"> 
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>
	
	
	

	
	<br><br><br>
	
<%
//앞에서 전달받은 pamameter 를 다시 전달합니다.
String str_param = new String("");
String p_name = new String();
String p_value = new String();
for (Enumeration e = request.getParameterNames() ;e.hasMoreElements();) {
    p_name = e.nextElement().toString();
    p_value = request.getParameter(p_name).trim();
    if(p_name.equals("nm") || p_name.equals("lc") || p_name.equals("em") || p_name.equals("tl")) continue;
    out.print("<input type='hidden' name='"+ p_name +"' value='"+ p_value +"'>");
}
%>	
	<input type="hidden" name="connectionUrl" value="<%=connectionUrl%>">
	<%} catch(SQLException e){
		e.printStackTrace();
    	out.print("err : " + e);
    	System.out.println("err : " + e); 		
    	System.out.println("query : " + query); 		
	%>
		<script language="JavaScript">		
		alert ("<%=e%>");
		location.href='./index.jsp';
		</script>
	<% }finally{
		try
		{
			if(rs != null)
				rs.close();
			}
			catch(SQLException sqle) { }
		try
		{
			if(pstmt != null)
				pstmt.close();
		}
		catch(SQLException sqle) { }		
		try
		{
			if(con != null)
				con.close();
		}
		catch(SQLException sqle) { }		
		//end();	
	}%>
</form>	

..
</body>
</html>
