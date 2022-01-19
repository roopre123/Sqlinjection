<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="injection.DBUtil"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>high Level login title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id").replace("&", "&amp;").replace("'", "&quot;");;
	String pw = request.getParameter("pw").replace("&", "&amp;").replace("'", "&quot;");;
	
	Connection conn = DBUtil.getMYSQLConnection();
	
	String sql = "select * from members where id='"+id+"'and pw='"+pw+"'";

	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){

		out.print(rs.getString("id"));
		out.print("&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;");
		out.print(rs.getString("pw"));
		out.print("<br>");
		}
	
	DBUtil.close(stmt);
	DBUtil.close(conn);
	
%>
<input type="button" value="back" onclick="history.back();">


<h1></h1>
</body>
</html>