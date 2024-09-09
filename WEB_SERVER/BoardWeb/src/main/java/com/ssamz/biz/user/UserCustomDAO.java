package com.ssamz.biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssamz.biz.common.JDBCUtil;

//DAO(Data Access Object) 클래스

public class UserCustomDAO {

	// JDBC 관련번수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	// USERS 테이블 관련 SQL 명령어.
	private String USER_LIST = "SELECT * FROM USERS";
	private String USER_INSERT = "INSERT INTO USERS VALUES(?,?,?,?)";
	private String USER_UPDATE = "UPDATE USERS SET NAME = ?, ROLE = ? WHERE ID = ?";
	private String USER_DELETE = "DELETE FROM USERS WHERE ID = ?";
	
	// 연결 담당 메서드 
	private void connection() {
		try {
			conn = JDBCUtil.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//CRUD

	// 회원 목록 조회
	public void getUserList() {
		try {
			connection();  // DB 연결
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
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);  // 자원 해제
		}
	}
	

	// 회원 등록
	public void insertUser(String id, String password, String name, String role) {
		try {
			connection();  // DB 연결
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, password);
			stmt.setString(3, name);
			stmt.setString(4, role);

			System.out.println("INSERT " + stmt.executeLargeUpdate() + "건 데이터 처리 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);  // 자원 해제
		}
	}

	// 회원 수정
	public void updateUser(String name, String role, String id) {
		try {
			connection();  // DB 연결
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, name);
			stmt.setString(2, role);
			stmt.setString(3, id);

			System.out.println("UPDATE " + stmt.executeLargeUpdate() + "건 데이터 처리 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);  // 자원 해제
		}
	}

	// 회원 삭제
	public void deleteUser(String id) {
		try {
			connection();  // DB 연결
			stmt = conn.prepareStatement(USER_DELETE);
			stmt.setString(1, id);

			System.out.println("DELETE " + stmt.executeLargeUpdate() + "건 데이터 처리 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);  // 자원 해제
		}
	}
}
