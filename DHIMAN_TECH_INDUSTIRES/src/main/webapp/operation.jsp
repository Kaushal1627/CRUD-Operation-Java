<%@ page import="javax.swing.*, java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD OPERATION|| PERFORM BY DHIMAN TECH</title>
<link rel="stylesheet" href="backend.css">
</head>
<body>
	<% 
	 
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String option = request.getParameter("button");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD","root","root");
			Statement st = con.createStatement();
			
			if(option.equals("Insert")){
				int result = st.executeUpdate("insert into emp values('"+id+"','"+name+"' ,'"+password+"','"+email+"','"+mobile+"','"+address+"')");
				JOptionPane.showMessageDialog(null, "Records are inserted Successfully ");
			}
			
			if(option.equals("Delete")){
				int result = st.executeUpdate("delete from emp where id='"+id+"'and name='"+name+"'and password='"+password+"'and email='"+email+"' and mobile='"+mobile+"'and address='"+address+"'");
				JOptionPane.showMessageDialog(null, "Records are Delete Successfully ");
			}
			
			if(option.equals("Update")){
				String newname = request.getParameter("newname");
				String newpassword = request.getParameter("newpassword");
				String newemail = request.getParameter("newemail");
				String newmobile = request.getParameter("newmobile");
				String newaddress = request.getParameter("newaddress");
				int result = st.executeUpdate("update emp set name='"+newname+"',password='"+newpassword+"',email='"+newemail+"',mobile='"+newmobile+"',address='"+newaddress+"' where id='"+id+"'");
				JOptionPane.showMessageDialog(null, "Records are update Successfully ");
			}
			if(option.equals("Display")){
				ResultSet rs = st.executeQuery("Select * from emp");
				out.println("<h1>Emplpye Login Details </h1>");
				out.println("<div>");
				out.println("<table>");
				out.println("<th>Id</th> <th>Name</th> <th>Password</th> <th>E-mail</th> <th>Mobile</th> <th>Address</th>");
				while(rs.next()){
					out.println("<tr>");
					out.println("<td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				out.println("</div>");
				out.println("<footer>Design by Kaushal kumar</footer>");
			}
		}catch(Exception e){
			out.println(e);
		}

	%>
</body>
</html>