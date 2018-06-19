<%-- viewboard.jsp by J-H Ahn 2015 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.lang.*, java.text.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String no = request.getParameter("no");

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   int hit = 0;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      out.println("MySQL DB에 접속되었습니다.<br><br>");

      out.println("<table border=1 cellspacing=0 cellpadding=5 color=gray>");
      out.println("  <caption><font size=+2><b>회원 게시판 글 보기</b></font></caption>");
      out.println("  <tr align=center><td>#</td><td>게시자</td><td>제목</a></td><td>날자</td><td>조회</td></tr>");
      stmt = conn.createStatement();
      rs = stmt.executeQuery("select * from board where no="+no);
      if (rs.next()) {
         String name = rs.getString("name");
         String title = rs.getString("title");
         String text = rs.getString("content");
         String wdate = rs.getString("wdate");
         hit = rs.getInt("hit") + 1;
         out.println("  <tr align=center><td>"+no+"</td><td>"+name+"</td><td>"+title+"</td><td>"+wdate+"</td><td>"+hit+"</td></tr>");
         out.println("  <tr><td align=center>게시 글</td><td colspan=4>"+text+"</td></tr>");
         out.println("  <tr><td align=center>첨부</td><td colspan=4></td></tr>");
      } out.println("</table><br>");
      out.println("<form method=post action='delboard.jsp'>");
      out.println("  <input type=button value='목록' onClick=location.assign('board.jsp')>");
      out.println("  <input type=hidden name=no value='" + no + "'>");
      out.println("  <input type=submit value='글 삭제'>");
      out.println("  <input type=button value='글 수정'>");
      out.println("</form>");

      String sql = "update board set hit=" + hit + " where no=" + no;
//      out.println("sql = " + sql);
      stmt.executeUpdate(sql);
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      if (stmt != null) try { stmt.close(); } catch(SQLException sqle){}
      if (conn != null) try { conn.close(); } catch(SQLException sqle){}
   }
%>