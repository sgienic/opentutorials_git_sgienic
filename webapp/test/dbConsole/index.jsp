<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*"%>  
<%@page import="java.util.*"%>
<%
//request.setCharacterEncoding("euc-kr");
//String connectionUrl = "jdbc:sqlserver://localhost:1433";
String id ="";
String pw ="";
String ip ="";;
String port = "";
String dblist = "";

//jdbc:mysql://192.168.0.18:3306/trans
boolean debug = true; //debug test 입니다.
 if(debug){ 
	id="swg";//id 값
	pw="swg_5678";//id 값
	//ip="192.168.0.18";
	ip="127.0.0.1";
	port="1521";
	dblist="";
} 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<style type="text/css">
	<!--
	.list {text-align:left; padding:0; margin:0;}
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
	color:#333333;}
	-->
	</style>
	
<script>
function reset(){//초기화
	document.frm.ip.value="";	
	document.frm.port.value="";
	document.frm.tb_id.value="";
	document.frm.tb_pw.value="";
 } 

</script>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그인</title>
</head>
<body>	
	<form action="./sql.jsp" method="post" name="frm">	
	<br><br><br><br><br><br><br>
	
	<table width=500 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#BCD7E6 >
		<tr>  		
			<td height=30 bgcolor=#BCD7E6>
				<font color=black>Login</font>
			</td>
		</tr>
	</table>
	
	<table width=500 align=center border=0 cellpadding=2 cellspacing=1 bgcolor="BCD7E6" class="t_border">	
		<tr height=30 bgcolor=white>	
			<td width="50" height="30" bgcolor="white">Server</td>
		    <td width="50" height="30" bgcolor="white">
				<!--  <input name="dbselect" type="radio" value="1" checked="checked">MSSQL-->
				<input name="dbselect" type="radio" value="2" >MYSQL
				<input name="dbselect" type="radio" value="3" >oracle
			</td>
  		</tr>  		
  		<tr height=30 bgcolor=white>
			<td width="30" height="30" bgcolor="white">IP</td>
			<td width="40" height="30" bgcolor="white"><input  type="text" name="ip" size="20" value="<%=ip%>"></td>
		</tr>	
		<tr height=30 bgcolor=white>
			<td width="30" height="30" bgcolor="white">Port</td>
			<td width="40" height="30" bgcolor="white"><input  type="text" name="port" size="10" value="<%=port%>"></td>
		</tr>		
		<tr height=30 bgcolor=white>
			<td width="30" height="30" bgcolor="white">ID</td>
			<td width="40" height="30" bgcolor="white"><input  type="text" name="tb_id" size="10" value="<%=id%>"></td>
		</tr>	
		<tr height=30 bgcolor=white>	
			<td width="30" height="30" bgcolor="white">PW</td>
			<td width="30" height="30" bgcolor="white"><input  type="password" name="tb_pw" size="10" value="<%=pw%>"></td>
		</tr>
		<tr height=30 bgcolor=white>	
			<td width="30" height="30" bgcolor="white">dblist</td>
			<td width="30" height="30" bgcolor="white"><input  type="text" name="dblist" size="10" value="<%=dblist%>"></td>
		</tr>
	</table>		
	<table width=500 align=center border=0 cellpadding=2 cellspacing=1 bgcolor=#BCD7E6>
		<tr>
			<td height=30 bgcolor=white ><center> 
			<a href="javascript:frm.submit()">전송</a> 　 |　 <a href="javascript:reset();">초기화</a>
			</center></td>
		</tr>
	</table>
	</form>
</body>
</html>