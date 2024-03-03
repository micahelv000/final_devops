<%@ page import="java.sql.*"%>
<%
    String pen = request.getParameter("pen");
    String thou = request.getParameter("quote");

    String mail_id = (String)session.getAttribute("mailid");

    try {
        Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");
		PreparedStatement pst = con.prepareStatement("insert into uploads(penname,email,thought) values(?,?,?)");

        pst.setString(1, pen);
        pst.setString(2, mail_id);
        pst.setString(3, thou);

        pst.executeUpdate();

        if(pst!=null) {
            response.sendRedirect("life04-1.html");
        }

        con.close();
    } catch(Exception e) {
        out.print(e);
    }
%>