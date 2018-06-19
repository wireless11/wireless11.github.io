<%-- addboard.jsp by J-H Ahn 2018 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.util.Date, java.text.*, java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String name = (String)session.getAttribute("loginID");
   if (name == null) System.exit(0);
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   Date date = new Date();
   String wdate = date.toLocaleString();

   Connection conn = null;
   Statement stmt = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      out.println("MySQL DB에 접속되었습니다.<br><br>");

      stmt = conn.createStatement();
      String sql = "insert into board (name,title,content,wdate) values ('"+name+"','"+title+"','"+content+"','"+wdate+"')";
      out.println("sql = " + sql + "<br>");
      stmt.executeUpdate(sql);
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }
   response.sendRedirect("board.jsp");
%>
