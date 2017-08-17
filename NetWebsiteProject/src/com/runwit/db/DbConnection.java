package com.runwit.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class DbConnection {
	private static DataSource ds = null;
	private static Logger logger = Logger.getLogger(DbConnection.class);

	static {
		try {
			logger.info("Load the DataSource...");
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/ConnectionPool");
			logger.info("Load the DataSource done.");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

}
