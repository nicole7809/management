package team.elite.db;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataBaseConnection {
	public static Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context j = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) j.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
}
