<%-- addmember.jsp by J-H Ahn 2016 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   Integer no = 0;
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      stmt = conn.createStatement();
      String sql = "select * from member where id='" + id + "'";
      rs = stmt.executeQuery(sql);
      if (rs.next()) {
         no = rs.getInt("no");
         out.println("<script>alert('" + id + "은(는) 이미 가입한 id입니다.')</script>");
         out.println("<form><input type=button value=Back onClick='history.back()'></form>");
      } else {
        sql = "insert into member (id, pw) values ('" + id + "', password('" + pw + "'))";
        stmt.executeUpdate(sql);
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }

   if (no == 0) response.sendRedirect("member.jsp");
%>
