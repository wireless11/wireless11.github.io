<%-- upload.jsp by J-H Ahn 2018 --%>
<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*, java.util.Date, java.util.*, java.io.*" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
//   request.setCharacterEncoding("UTF-8"); //request를 cos가 점유하여
//   String nicname = request.getParameter("nicname"); //파라미터를 받을 수 없다.
   String no = "0";
   String nicname = "unknown";
   String title = "test";
   String content = "test";
   String upFolder = "D:\tomcat\somin";
   String encType = "UTF-8"; // 엔코딩 타입
   int maxSize = 100*1024*1024;  // 최대 업로드 파일크기=100Mb

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      MultipartRequest multi = null;
      multi = new MultipartRequest(request, upFolder, maxSize, encType, new DefaultFileRenamePolicy());
      Enumeration params = multi.getParameterNames(); // form태그의 파라미터
      while (params.hasMoreElements()) { 		  // file속성 태그는 제외
         String name = (String)params.nextElement();
         String value = multi.getParameter(name);
         if (name.equals("nicname")) nicname = value;
         else if (name.equals("title")) title = value;
         else if (name.equals("content")) content = value;
         out.println(name + " = " + value + "<br>");
      }
      Date date = new Date();
      String wdate = date.toLocaleString();
      wdate=wdate.substring(0, wdate.indexOf(" 오"));

      Class.forName("com.mysql.jdbc.Driver");
      String jdbcURL = "jdbc:mysql://localhost:3306/db1";
      conn = DriverManager.getConnection(jdbcURL, "user1", "pass01");
//      out.println("MySQL DB에 접속되었습니다.<br><br>");
      stmt = conn.createStatement();
      String sql = "insert into board (name,title,content,wdate) values ('"+nicname+"','"+title+"','"+content+"','"+wdate+"')";
      stmt.executeUpdate(sql);
      rs = stmt.executeQuery("select no from board order by no desc limit 0,1");
      if (rs.next()) no = rs.getString("no");

      Enumeration files = multi.getFileNames(); // 전송한 파일의 메타 정보
      while (files.hasMoreElements()) {
         String name = (String)files.nextElement(); // file태그의 name 속성값
         String original = multi.getOriginalFileName(name); // 원래의 파일명
//         String filename = multi.getFilesystemName(name); // 업로드 파일명
         String mimetype = multi.getContentType(name);
         File file = multi.getFile(name); // 파일 객체 로드
         if (file != null) {
            Integer filesize = (int)file.length();
            String pathname = upFolder + "/" + no + "_" + name + "_" + original;
            file.renameTo(new File(pathname));
            out.println("file태그명 : " + name +"<br>");
            out.println("파일 이름 : " + original +"<br>");
            out.println("파일 타입 : " + mimetype +"<br>");
            out.println("파일 크기 : " + filesize + " bytes<br>");

            sql = "update board set " + name + "='" + original + "' where no=" + no;
            stmt.executeUpdate(sql);
         }  out.println("<br>");
      }
//   } catch(IOException ioe) {
//      System.out.println(ioe);
//   } catch(Exception ex) {
//      System.out.println(ex);
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      if (rs != null) try { rs.close(); } catch (SQLException sqle) {}
      if (stmt != null) try { stmt.close(); } catch (SQLException sqle) {}
      if (conn != null) try { conn.close(); } catch (SQLException sqle) {}
   }
%>