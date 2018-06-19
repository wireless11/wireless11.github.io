<%-- delmember.jsp by J-H Ahn 2016 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");

   Connection conn = null;
   Statement stmt = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      stmt = conn.createStatement();
      String sql = "delete from member where id='" + id + "'";
      stmt.executeUpdate(sql);
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      if (stmt != null) try { stmt.close(); } catch(SQLException sqle){}
      if (conn != null) try { conn.close(); } catch(SQLException sqle){}
   }

   response.sendRedirect("member.jsp");
%>