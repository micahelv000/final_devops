<%@ page import="java.sql.*"%>
<%
	String fnam = request.getParameter("First_Name");
	String lnam = request.getParameter("Last_Name");
	String mail = request.getParameter("Email_Id");
	String phn = request.getParameter("Mobile_Number");
	String gen = request.getParameter("Gender");
	String cit = request.getParameter("City");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");
		PreparedStatement pst = con.prepareStatement("insert into forms(fname, lname, email, phno, gend, city) values(?,?,?,?,?,?)");
		
		pst.setString(1, fnam);
		pst.setString(2, lnam);
		pst.setString(3, mail);
		pst.setString(4, phn);
		pst.setString(5, gen);
		pst.setString(6, cit);
		
		int x = pst.executeUpdate();

		if(x>0) {
			response.sendRedirect("loginsample.html");
		}
		
		pst.close();
		con.close();
	
	} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		e.printStackTrace();
	}
%>