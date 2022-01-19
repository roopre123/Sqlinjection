<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="injection.DBUtil"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>impossible login title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	Connection conn = DBUtil.getMYSQLConnection();
	
	String sql = "select * \n"
	+"from members \n"
	+"where id=? and pw=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	//System.out.print(pstmt);
	

	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){

		out.print(id);
		out.print("&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;");
		out.print(pw);
		out.print("<br>");
		}
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>

<input type="button" value="back" onclick="history.back();">
</body>
</html>