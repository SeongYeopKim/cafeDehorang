

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class S_BBSDelete
 */
public class S_BBSDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("s_num");

		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://54.69.198.243/webProTerm", "root", "dog26215");
			if (conn == null)
				throw new Exception("데이터베이스를 연결할 수 없습니다. ");
			stmt = conn.createStatement();
			String command = String
					.format("DELETE FROM s_bbs WHERE s_seqNo = '%s' "
							,num);
			int rowNum = stmt.executeUpdate(command);
			if (rowNum < 1)
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");

		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {

			}
		}
		RequestDispatcher dp = request.getRequestDispatcher("S_BBSListServlet");
		dp.forward(request, response);
		
	
	}


}
