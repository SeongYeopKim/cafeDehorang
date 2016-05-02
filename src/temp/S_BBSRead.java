package temp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BBSRead
 */
public class S_BBSRead extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String pageNum = request.getParameter("num");
		System.out.print(pageNum);
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
					.format("SELECT * FROM bbs WHERE seqNo = '%s'" ,pageNum);
			
			ResultSet rs = stmt.executeQuery(command);
			rs.next();
			HashMap<String,Object> map = new HashMap<String, Object>();

			map.put("s_seqNo", rs.getInt("s_seqNo"));
			map.put("s_title", rs.getString("s_title"));
			map.put("s_content", rs.getString("s_content"));
			map.put("s_wdate", rs.getDate("s_wdate"));
			map.put("s_wtime", rs.getTime("s_wtime"));
			request.setAttribute("Read", map);
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
		RequestDispatcher dp = request.getRequestDispatcher("Secret_BBSRead.jsp");
		dp.forward(request, response);

	}
}
