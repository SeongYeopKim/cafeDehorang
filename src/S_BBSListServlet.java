import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class S_BBSListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		String type, value;
		if (request.getParameter("type") != null) {
			type = request.getParameter("type");
		} else {
			type = "";
		}

		if (request.getParameter("value") != null) {
			value = request.getParameter("value");
		} else {
			value = "";
		}
		
		System.out.print("type"+type+"value"+value);
		int s_pageNum;
		String s_a;
		// s_
		if (request.getParameter("s_pageNum") == null) {
			s_a = "0";
		} else
			s_a = request.getParameter("s_pageNum");

		s_pageNum = Integer.parseInt(s_a);
		if (s_pageNum < 0)
			s_pageNum = 0;
		System.out.print("\n" + s_pageNum + "\n");

		Boolean isLastPage = false;
		ArrayList<HashMap<String, Object>> s_list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map;
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager
					.getConnection("jdbc:mysql://54.69.198.243/webProTerm",
							"root", "dog26215");
			if (conn == null)
				throw new Exception("데이터베이스를 연결할 수 없습니다. ");
			stmt = conn.createStatement();

			// /////////////////
			String s_query_f = String.format("select COUNT(*) from s_bbs");
			ResultSet s_rs_f = stmt.executeQuery(s_query_f);
			s_rs_f.next();
			int s_Max = s_rs_f.getInt("COUNT(*)");

			if (s_Max / 5 < s_pageNum) {
				s_pageNum = s_Max / 5;
			}
			if (s_Max == s_pageNum * 5) {
				s_pageNum -= 1;
			}
			ResultSet rs;
			String s_query = String.format(
					"select * from s_bbs order by s_seqNo desc limit %d,5",
					s_pageNum * 5);
			if (!type.equals("") && !value.equals("")) {
				String search_query = "select * from s_bbs where " + type
						+ " like concat('%','" + value
						+ "','%') order by s_seqNo";

				System.out.print(search_query);
				rs = stmt.executeQuery(search_query);
			} else {
				rs = stmt.executeQuery(s_query);
			}
			for (int cnt = 0; cnt < 5; cnt++) {

				if (!rs.next())
					break;

				map = new HashMap<String, Object>();

				map.put("s_seqNo", rs.getInt("s_seqNo"));
				map.put("s_title", rs.getString("s_title"));
				map.put("s_wdate", rs.getDate("s_wdate"));
				map.put("s_wtime", rs.getTime("s_wtime"));

				s_list.add(cnt, map);
			}
			if (!rs.next())
				isLastPage = true;

			// ////////////////

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
		if (s_list.size() > 0)
			request.setAttribute("s_listSize", s_list.size() - 1);
		else
			request.setAttribute("s_listSize", 1);
		request.setAttribute("s_pageNum", s_pageNum);

		request.setAttribute("S_BBS_LIST", s_list);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("Secret_BBSListView.jsp");

		dispatcher.forward(request, response);

	}

}
