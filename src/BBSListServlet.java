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

public class BBSListServlet extends HttpServlet {

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
		System.out.print("type : " + type + "value : " + value);
		int pageNum, s_pageNum;
		String a, s_a;
		if (request.getParameter("pageNum") == null) {
			a = "0";
		} else
			a = request.getParameter("pageNum");

		pageNum = Integer.parseInt(a);
		if (pageNum < 0)
			pageNum = 0;
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
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
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
			String query_f = String.format("select COUNT(*) from bbs");
			ResultSet rs_f = stmt.executeQuery(query_f);
			rs_f.next();
			int Max = rs_f.getInt("COUNT(*)");

			if (Max / 5 < pageNum) {
				pageNum = Max / 5;
			}
			if (Max == pageNum * 5) {
				pageNum -= 1;
			}
			ResultSet rs;
			String query = String.format(
					"select * from bbs order by seqNo desc limit %d,5",
					pageNum * 5);
			if (!type.equals("") && !value.equals("")) {
				String search_query = "select * from bbs where " + type
						+ " like concat('%','" + value
						+ "','%') order by seqNo";

				System.out.print(search_query);
				rs = stmt.executeQuery(search_query);
			} else {
				rs = stmt.executeQuery(query);
			}
			for (int cnt = 0; cnt < 5; cnt++) {

				if (!rs.next())
					break;

				map = new HashMap<String, Object>();

				map.put("seqNo", rs.getInt("seqNo"));
				map.put("title", rs.getString("title"));
				map.put("writer", rs.getString("writer"));
				map.put("wdate", rs.getDate("wdate"));
				map.put("wtime", rs.getTime("wtime"));

				list.add(cnt, map);
			}
			if (!rs.next())
				isLastPage = true;
			System.out.print("listSize: " + list.size());

			// /////////////////
			String s_query_f = String.format("select COUNT(*) from s_bbs");
			ResultSet s_rs_f = stmt.executeQuery(s_query_f);
			s_rs_f.next();
			int s_Max = s_rs_f.getInt("COUNT(*)");

			if (s_Max / 5 < s_pageNum) {
				s_pageNum = s_Max / 5;
			}
			String s_query = String.format(
					"select * from s_bbs order by s_seqNo desc limit %d,5",
					s_pageNum * 5);
			rs = stmt.executeQuery(s_query);
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
		request.setAttribute("isLastPage", isLastPage);
		if (list.size() > 0)
			request.setAttribute("listSize", list.size() - 1);
		else
			request.setAttribute("listSize", 1);
		request.setAttribute("pageNum", pageNum);

		request.setAttribute("BBS_LIST", list);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("BBSListView.jsp");

		dispatcher.forward(request, response);

	}
}
