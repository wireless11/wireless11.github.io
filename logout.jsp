<%-- logout.jsp by J-H Ahn 2018 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
  session.removeAttribute("loginID");

  Cookie[] cookies = request.getCookies();
  if (cookies != null ) {
     for (int i=0; i<cookies.length; i++) {
        if (cookies[i].getName().equals("loginID")) {
           cookies[i].setMaxAge(0);	// 쿠키 즉시 삭제
           response.addCookie(cookies[i]);
           break;
        }
     }
  }

  response.sendRedirect("index.jsp");
%>
