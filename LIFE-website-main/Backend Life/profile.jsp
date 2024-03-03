<%@ page import="java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="profile.css">
</head>
<style>
    .container {
      display: flex;
      flex-wrap: wrap;
    }

    .box {
      width: 31%;
      height: 60%;
      border: 1px solid black;
      margin: 10px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
      
    }

    .box img {
      width: 100px;
      height: 100px;
      margin-bottom: 10px;
    }

    .box h2 {
      margin-top: 0;
    }

    h1 {
    border: 2px solid black;
    width: 150px;
}
  </style>
<body>
    <center><h1>Profile</h1></center>
    <div class="container">
        <div class="box">
    <%
        String first_name = (String)session.getAttribute("firstname");
        String mail_id = (String)session.getAttribute("mailid");

        if(mail_id==null) {
            response.sendRedirect("login.html");
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");
                
                PreparedStatement pst1 = con.prepareStatement("select * from forms where fname='"+first_name+"' and email='"+mail_id+"'");
                ResultSet rs1 = pst1.executeQuery();
                while(rs1.next()) { %>
                    
                    
                    <h1>User Details</h1>
                <h3><%out.print("First Name : "+rs1.getString(1));%></h3>
                    <h3><%out.print("Last Name : "+rs1.getString(2));%></h3>
                    <h3><%out.print("Email : "+rs1.getString(3));%></h3>
                    <h3><%out.print("Phone : "+rs1.getString(4));%></h3>
                    <h3><%out.print("Gender : "+rs1.getString(5));%></h3>
                    <h3><%out.print("City : "+rs1.getString(6));%></h3></li>
                      </div><%
                   
                }
    
               
    
                PreparedStatement pst2 = con.prepareStatement("select * from uploads where penname='"+first_name+"' and email='"+mail_id+"'");
                ResultSet rs2 = pst2.executeQuery();
                %><div class="box">
                    <h1>Uploads</h1><%
                while(rs2.next()) { %>
                    
                    <h3><%out.print(rs2.getString(3)+" ~ "+rs2.getString(1));%></h3>
                    <%                
                }%>
            
            </div>
        <div class="box">
            <h1>Favourites</h1><%

                

                PreparedStatement pst3 = con.prepareStatement("select * from favs where fname=? and email=?");
                pst3.setString(1, first_name);
                pst3.setString(2, mail_id);

                ResultSet rs3 = pst3.executeQuery();
                
                while(rs3.next()) {
                    PreparedStatement pst4 = con.prepareStatement("select * from songs where url='"+rs3.getString(3)+"'");
                    ResultSet rs4 = pst4.executeQuery();
                    while(rs4.next()) {%>
                        <h3><a style="color:red" href=<%=rs4.getString(1)%>><%= rs4.getString(2) %></a></h3> <%
                    }

                }%>
            </div>
            <%
                con.close();
            } catch(Exception e) {
                out.print(e);
            }
        }
    %>
</body>
</html>