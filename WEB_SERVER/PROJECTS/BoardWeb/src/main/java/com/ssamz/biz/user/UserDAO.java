package com.ssamz.biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssamz.biz.common.JDBCUtil;

//DAO(Data Access Object) 클래스
public class UserDAO {

	// JDBC 관련번수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// USERS 테이블 관련 SQL 명령어.
	private String USER_LIST = "SELECT * FROM USERS";
	private String USER_INSERT = "INSERT INTO USERS VALUES(?,?,?,?)";
	// CRUD

	// 회원 목록 조회
	public void getUserList() {
		try {
			conn = JDBCUtil.getConnection();

			stmt = conn.prepareStatement(USER_LIST);

			rs = stmt.executeQuery();

			System.out.println("[ USER 목록 ]");

			while (rs.next()) {
				System.out.print(rs.getString("ID") + " : ");
				System.out.print(rs.getString("PASSWORD") + " : ");
				System.out.print(rs.getString("NAME") + " : ");
				System.out.println(rs.getString("ROLE"));
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}

	// 회원 목록 조
	public void insertUser(String id, String password, String name, String role) {

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);

			
			stmt.setString(1, id);
			stmt.setString(1, password);
			stmt.setString(1, name);
			stmt.setString(1, role);
			
			stmt.executeLargeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		

	}

}
