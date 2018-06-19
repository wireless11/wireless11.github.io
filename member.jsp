<%-- member.jsp by J-H Ahn 2016 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<script>
function clearpwd(form)
{
   form.action='clearpwd.jsp';
   form.submit();
}
</script>
<%
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      out.println("conn = " + conn + "<br>");
      out.println("MySQL DB에 접속되었습니다.<br><br>");

      out.println("<table>");
      stmt = conn.createStatement();
      rs = stmt.executeQuery("select * from member");
      while (rs.next()) {
         String no = rs.getString("no");
         String id = rs.getString("id");
         String pw = rs.getString("pw");
         String grade = rs.getString("grade");
         out.println("<tr><td>");
         out.println("no=" + no + " id=" + id + " pw=" + pw + " grade=" + grade);
         out.println("</td><td>");
%>
<form method=post action=delmember.jsp>
  <input type=hidden name=id value='<%=id%>'>
  <input type=submit value='계정 삭제'>
  <input type=button value='암호 초기화' onClick='clearpwd(this.form)'>
</form>
<%
         out.println("</td></tr>");
      } out.println("</table>");

   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (rs != null) try { rs.close(); } catch (SQLException sqle) {}
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }
%>