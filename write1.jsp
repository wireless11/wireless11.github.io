<%-- board.jsp by J-H Ahn 2015 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      out.println("MySQL DB에 접속되었습니다.<br><br>");

      out.println("<table border=0 cellspacing=0 cellpadding=5>");
      out.println("  <caption><font size=+2><b>회원 게시판</b></font></caption>");
      out.println("  <tr><td colspan=6><hr></td></tr>");
      out.println("  <tr align=center><td>#</td><td>게시자</td><td width=200>제목</a></td><td>첨부</td><td>날자</td><td>조회</td></tr>");
      out.println("  <tr><td colspan=6><hr></td></tr>");
      stmt = conn.createStatement();
      rs = stmt.executeQuery("select * from board order by no desc limit 0,10");
      while (rs.next()) {
         String no = rs.getString("no");
         String name = rs.getString("name");
         String title = rs.getString("title");
         String wdate = rs.getString("wdate");
         String hit = rs.getString("hit");
         wdate=wdate.substring(0, wdate.indexOf(" 오"));
         out.println("  <tr align=center><td>"+no+"</td><td>"+name+"</td><td><a href='viewboard.jsp?no="+no+"'>"+title+"</a></td><td></td><td>"+wdate+"</td><td>"+hit+"</td></tr>");
      } out.println("</table><br>");
     out.println("<input type=button value='글 쓰기' onClick=location.assign('addboard.html')>");

   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (rs != null) try { rs.close(); } catch (SQLException sqle) {}
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }
%>