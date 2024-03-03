<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%
    String first_name = (String)session.getAttribute("firstname");
    String mail_id = (String)session.getAttribute("mailid");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebackend", "root", "sairam04@P");

        String[] options = request.getParameterValues("opt[]");

        if(options.length!=0) {
            PreparedStatement pst1 = con.prepareStatement("select * from favs where fname=? and email=?");
            pst1.setString(1, first_name);
            pst1.setString(2, mail_id);

            ResultSet rs = pst1.executeQuery();
            String[] arr = new String[20];

            int i=0;
            while(rs.next()) {
                arr[i] = rs.getString(3);
                i++;
            }

            HashSet<String> set = new HashSet<>(Arrays.asList(arr));
            String[] userArray = set.toArray(new String[0]);

            ArrayList<String> arrayList = new ArrayList<>(Arrays.asList(userArray));
            ArrayList<String> result = new ArrayList<>();
            for (String element : options) {
                if (!arrayList.contains(element)) {
                    result.add(element);
                }
            }
            String[] finArray = result.toArray(new String[0]);

            PreparedStatement pst2 = con.prepareStatement("insert into favs values(?,?,?)");
            for(String a: finArray) {
                pst2.setString(1, first_name);
                pst2.setString(2, mail_id);
                pst2.setString(3, a);
                pst2.executeUpdate();
            }
            response.sendRedirect("profile.jsp");
        } 
        else {
            response.sendRedirect("life02-1.html");
        }

        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>