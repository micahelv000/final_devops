<%@ page import="java.sql.*"%>
<%
    String mail = request.getParameter("username");
    String pswd = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");
        PreparedStatement pst = con.prepareStatement("select * from forms where email=? and fname=?");

        pst.setString(1, mail);
        pst.setString(2, pswd);

        ResultSet rs = pst.executeQuery();

        session.setAttribute("firstname", pswd);
        session.setAttribute("mailid", mail);

        if(rs.next()) {
            response.sendRedirect("index.jsp");
        }
        else {
            out.print("<br><br><br><center><h2>Incorrect email or password</h2></center>");
        }

        con.close();
    } catch(Exception e) {
        out.print(e);
    }
%>