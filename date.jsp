<%-- date.jsp by J-H Ahn 2018 (JSP 주석) --%>
<%@ page contentType = "text/html; charset=UTF-8" %> <%--page Directive--%>
<%@ page import = "java.util.Date, java.text.*" %>
<%! String title = "현재 시간 : "; %> <%-- Declaration --%>
<%
  Date date = new Date(); // 현재의 날짜와 시간을 얻어온다. (자바 언어의 주석)
%> <%-- Scriptlet (자바 코드는 임의의 위치에 삽입할 수 있다) --%>
<%=title%> <%=date.toLocaleString()%> <%-- Expression --%>