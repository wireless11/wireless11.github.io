<%-- delboard.jsp by J-H Ahn 2015 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String no = request.getParameter("no");
//   out.println(no + "가 삭제됩니다.<br>");

   Connection conn = null;
   Statement stmt = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      out.println("MySQL DB에 접속되었습니다.<br><br>");

      stmt = conn.createStatement();
      String sql = "delete from board where no=" + no;
      stmt.executeUpdate(sql);
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      if (stmt != null) try { stmt.close(); } catch(SQLException sqle){}
      if (conn != null) try { conn.close(); } catch(SQLException sqle){}
   }

   response.sendRedirect("board.jsp");
%>