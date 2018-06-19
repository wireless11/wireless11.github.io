<%-- download.jsp by J-H Ahn 2018 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.io.*" %>
<%
   String upFolder = "C:/Users/LGWin7x64/Documents/tomcat/jhahn/upload";
   request.setCharacterEncoding("UTF-8");
   String no = request.getParameter("no");
   String upfile = request.getParameter("upfile");

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
//      out.println("MySQL DB에 접속되었습니다.<br><br>");
      stmt = conn.createStatement();
      String sql = "select * from board where no=" + no;
      rs = stmt.executeQuery(sql);
      if (rs.next()) {
         String filename = rs.getString(upfile);
         if (filename != null && filename != "") {
            File file = new File(upFolder + "/" + no + "_" + upfile + "_" + filename);
            Integer filesize = (int)file.length();
            if (file.isFile() && filesize > 0) {	// 파일 크기가 0보다 커야 한다.
//               String mime = getServletContext().getMimeType(filename);
//               if (mime == null) mime = "application/octet-stream";
//               response.setContentType(mime + "; charset=utf-8"); 
//               response.setHeader("Content-Disposition", "inline; filename=" + java.net.URLEncoder.encode(filename, "UTF-8") + ";");
               response.setHeader("Content-Type", "application/octet-stream;");
               response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(filename, "UTF-8") + ";");
               response.setHeader("Content-Length", "" + filesize );
               BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
               BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
               int readBytes = 0;
               byte buff[] = new byte[2048];
               while ((readBytes = fin.read(buff)) != -1) {
                  outs.write(buff, 0, readBytes);
               }
               outs.close();
               fin.close();
            }
         }
      }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (rs != null) try { rs.close(); } catch (SQLException sqle) {}
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }
%>