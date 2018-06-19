<%-- loginOK.jsp by J-H Ahn 2016 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String autologin = request.getParameter("autologin");

   // id와 pw가 DB에 있는 내용과 일치하면, id를 세션에 등록한다.
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
      stmt = conn.createStatement();
      String sql = "select * from member where id='" + id + "' and pw=password('" + pw + "')";
      rs = stmt.executeQuery(sql);
      if (rs.next()) {
         session.setAttribute("loginID", id);
//        session.setMaxInactiveInterval(30*60); // 30분간 유지
//         out.println(id + " 님이 로그인 되었습니다.<br>");
         if (autologin.equals("on")) {
            Cookie cookie = new Cookie("loginID", id);
            cookie.setMaxAge(24*60*60);	// 1일간 유지한다.
            response.addCookie(cookie);
         }
      } else {
         out.println("<script>alert('id 또는 암호가 잘못되었습니다.')</script>");
         out.println("<form><input type=button value=Back onClick='history.back()'></form>");
      }
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      if (rs != null) try { rs.close(); } catch(SQLException sqle){}
      if (stmt != null) try { stmt.close(); } catch(SQLException sqle){}
      if (conn != null) try { conn.close(); } catch(SQLException sqle){}
   }

   id = (String)session.getAttribute("loginID");
   if (id != null) response.sendRedirect("index.jsp");
%>
</body>
</html>