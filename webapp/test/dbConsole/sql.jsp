<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>
<%
if(!true){ //���޹��� �Ķ���͸� �����ݴϴ�. TEST 
	String p_name = new String();
	String p_value = new String();
	out.print("�Ķ����<br>");
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
	String rowct = request.getParameter("rowct")==null?"50":request.getParameter("rowct").trim();//������ low ��
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
		out.print("MSSQL ���� ");		
		jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		connectionUrl = "jdbc:sqlserver://"+ip+":"+port+";databaseName="+dblist;		
		Class.forName(jdbcDriver);		
	}else if (dbsel.equals("2")){ //MYSQL
		out.print("MYSQL ���� ");
		jdbcDriver = "com.mysql.jdbc.Driver";
		connectionUrl = "jdbc:mysql://"+ip+":"+port+"/"+dblist;			
		Class.forName(jdbcDriver);		    
		//return;		
	}else if (dbsel.equals("3")){ //ORACLE
		out.print("ORACLE ���� ");		
	
		try {
	        // ����̹��� �ε��Ѵ�.
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
	 
	
	pstmt = con.prepareStatement(query); 			//mssql���� db ��� ��ü ������ �������� �ȴ�.
	pstmt2 = con.prepareStatement(query2); 			//mssql���� db ��� ������ �������� �ȴ�.
	
	rs = pstmt.executeQuery();						//������ ����� ��� �ִ�.
	rs2 = pstmt2.executeQuery();					
	
	rs2.next();							
	int count = rs2.getInt("count");				//��� ���� ����

	String[] list;									//list�迭����
	list = new String[count];						
	
	for(int i=0;i<count;i++){						//list�� ���� ���� ����
		rs.next();		
		list[i]=id + " " +  rs.getString("tname") ;				
	}
	%>
	����� : <%=id%> <br> 
	
	
	<%if(excute_query.length()>1) { %>
	<table width=200 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">  	
	<tr>
		<td height=30 bgcolor=#BCD7E6 align=center>
			<font color=#FFE69D size=20>-���-</font>
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

					pstmt = con.prepareStatement(query); 			//mssql���� db ��� ��ü ������ �������� �ȴ�.

					if(seltype.equals("1")){
						rs = pstmt.executeQuery();						//������ ����� ��� �ִ�.
						
					}else if(seltype.equals("2")) {
						pstmt.executeUpdate();						
						pstmt.close();
						con.commit(); //Ŀ��
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
									<td height="30" bgcolor="white" colspan="<%=count1%>" > ������� �ʹ� �����ϴ�. <%=irowct+1%> �Ǹ� �������ϴ�. </td>
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
						�˻���� : <%=j%>���� �˻��Ǿ����ϴ�.
						<%					
					}else if(seltype.equals("2")) {
						out.println("��û�Ͻ� ������ ����Ǿ����ϴ�. <br> sql : " + query);
					}
				} catch(SQLException e){
					out.println("���� : " + e + "<br>");
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
			<td width="70" height="30" bgcolor="white">SQL ���� ����</td>
			<td width="220">
				<input name="seltype" type="radio" value="1" checked="checked">Select
				<input name="seltype" type="radio" value="2" >Create,Drop,Insert,Delete,Update
			</td>
		</tr>	
		<tr height=30 bgcolor=white class='list_tahoma'>
			<td width="100" height="30" bgcolor="white">row ����</td>
			<td width="220">
				<input type="text" name="rowct" value="<%=rowct%>"> 100�����Ϸ� �������ּ���.
			</td>
		</tr>		
	</table>
			
	<table width=500 border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">	
		<tr height=30 bgcolor=white class='list_tahoma'>
			<td width="70" height="30" bgcolor="white">SQL��</td>
			<td width="220">
				<textarea name=excute_query cols=45 rows=10><%=excute_query%></textarea>
			</td>
		</tr>	
	</table>
	
			
		
	<table  border=0 cellpadding=2 cellspacing=1 bgcolor=#777777 class="t_border">
		<tr>
			<td height=30 bgcolor="white"> 
				<input type="submit" name="login" value="����">
			</td>
			<td height=30 bgcolor="white"> 
				<input type="reset" value="�ٽþ���">
			</td>
		</tr>
	</table>
	
	
	

	
	<br><br><br>
	
<%
//�տ��� ���޹��� pamameter �� �ٽ� �����մϴ�.
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
