<%
    session.removeAttribute("mailid");
    session.removeAttribute("firstname");
    response.sendRedirect("index.jsp");
%>