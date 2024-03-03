<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quotes</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <%
            String emo = request.getParameter("option");

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");
            PreparedStatement pst = con.prepareStatement("select quote, author from quotes where zenre='"+emo+"'");

            ResultSet rs = pst.executeQuery();

            %><h1><%out.print(emo);%></h1><%

            StringBuilder html = new StringBuilder();
            
            while (rs.next()) {
                String quote = rs.getString("quote");
                String author = rs.getString("author");

            html.append("<div class=\"quote\">");
            html.append("<blockquote><h3>").append(quote).append("  ~  ").append(author).append("</h3>");
            html.append("</div>");
        }

        out.println(html.toString());

    } catch(Exception e) {
        out.print(e);
    }
%>
    </body>
</html>
