import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.tomcat.dbcp.dbcp.ConnectionFactory;
import org.apache.tomcat.dbcp.dbcp.DriverManagerConnectionFactory;
import org.apache.tomcat.dbcp.dbcp.PoolableConnectionFactory;
import org.apache.tomcat.dbcp.dbcp.PoolingDriver;
import org.apache.tomcat.dbcp.pool.impl.GenericObjectPool;
public class DBCPServlet extends HttpServlet {
   
    public void init(ServletConfig config) throws ServletException {
        
        
        try {
            // JDBC 드라이버 로딩
            Class.forName("org.apache.commons.dbcp.PoolingDriver");
            
            // Connection Pool 생성
            GenericObjectPool connectionPool = new GenericObjectPool(null);
            connectionPool.setMaxActive(5);  // 최대 5개 접속 지원
            connectionPool.setMaxIdle(2);    // 2개 대기중 설정
            
            // 실제 DB와의 커넥션을 연결해주는 팩토리 생성
            ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
            		"jdbc:mysql://54.69.198.243/webProTerm", // JDBC URL
                "root", // 사용자
                "dog26215");
            
            // Connection Pool이 PoolableConnection 객체를 생성할 때 사용할
            // PoolableConnectionFactory 생성
            PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(
                connectionFactory,
                connectionPool,
                null, // statement pool
                null, // 커넥션 테스트 쿼리: 커넥션이 유효한지 테스트할 때 사용되는 쿼리.
                false, // read only 여부
                true); // auto commit 여부
            
            // Pooling을 위한 JDBC 드라이버 생성 및 등록
            PoolingDriver driver = new PoolingDriver();
            
            // JDBC 드라이버에 커넥션 풀 등록
            // ora10g2는 Connection 연결 요구시 사용하게 됩니다.
            driver.registerPool("/webdb_pool", connectionPool);
            
            System.out.println("---------------------------------------");
            System.out.println("www_jsp2 dbcp Connection Pool loading..");
            System.out.println("---------------------------------------");
            
        } catch(Exception ex) {
            //throw new ServletException(ex);
            ex.printStackTrace();
        }
    }
}