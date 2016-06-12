import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginAuthentication extends HttpServlet{

	private ServletConfig config;
	
	public void init(ServletConfig config)
	  throws ServletException{
		 this.config=config;
	   }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
			
		PrintWriter out = response.getWriter();
		String connectionURL = "jdbc:derby://localhost:1527/BrJavaP1";
		Connection connection=null;
		ResultSet rs;
		String userName=new String("");
		String passwrd=new String("");
		response.setContentType("text/html");
		try {
                    
                        System.out.println("testes d");
			 // Load the database driver
			//Class.forName("com.derby.jdbc.Driver");
			// Get a Connection to the database
			connection = DriverManager.getConnection(connectionURL, "root", "root"); 
			//Add the data into the database
                        
			String sql = "select usuario,senha from usuario";
			Statement s = connection.createStatement();
			s.executeQuery (sql);
			rs = s.getResultSet();
			while (rs.next ()){
                            	userName=rs.getString("usuario");
                                
				passwrd=rs.getString("senha");
			}
			rs.close ();
			s.close ();
			}catch(Exception e){
			System.out.println("Exception is ;"+e);
			}
			if(userName.equals(request.getParameter("user")) && passwrd.equals(request.getParameter("password"))){
				//out.println("WELCOME "+userName);
                            response.sendRedirect("ListaRobos.jsp");
			}
			else{
				out.println("Nome do usuário ou senha estão incorretos");
				out.println("<a href='AuthenticLogin.jsp'><br>Login again</a>");
			}
	}
}	