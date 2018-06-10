<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("euc-kr");

String seq = request.getParameter("seq");
String pw = request.getParameter("pw");
 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null; 
try{
	String url = "jdbc:oracle:thin:@192.168.42.219:1521:ORCL";
    String user = "scott";
    String Pw = "tiger";
  
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, seq, pw);
  
    String sql = "select seq, pass from members where seq = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    rs = pstmt.executeQuery();
 
    if(rs.next()){
    	String Seq = rs.getString("seq");
        String passw = rs.getString("pass");
   
        if(seq.equals(seq) && pw.equals(passw)) {
        	sql = "delete from members where seq = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, seq);
            pstmt.executeUpdate();
            }
        else {
        	out.println("패스워드가 틀렸습니다.");
        	}
    }
     else {
     	out.println("아이디가 틀렸습니다.");
          }
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null ) try { conn.close(); } catch(SQLException sqle) {}
      }
      
%>

 
</body>
</html>