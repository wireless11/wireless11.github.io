<%-- login.jsp by J-H Ahn 2018 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
   String id = (String)session.getAttribute("loginID");
   if (id == null) {
      Cookie[] cookies = request.getCookies();
      if (cookies != null ) {
         for (int i=0; i<cookies.length; i++) {
            if (cookies[i].getName().equals("loginID")) {
               id = (String)cookies[i].getValue();
               break;
            }
         }
      }
   }
   if (id == null || id.equals("")) {
%>

<%@ include file="login.html" %>

<% } else { %>

<form name=logout method=post action="logout.jsp">
   <%=id%> 회원님이 로그인하셨습니다. <input type=submit value="logout">
&nbsp; <input type=button value="회원탈퇴"  onClick="document.logout.action='delmember.jsp'; document.logout.submit();">
&nbsp; <input type=button value="암호변경" onClick="document.logout.action='alterpwd.html'; document.logout.submit();">
</form>

<% } %>