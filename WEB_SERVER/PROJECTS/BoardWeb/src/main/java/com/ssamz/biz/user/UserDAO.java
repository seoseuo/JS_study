package com.ssamz.biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssamz.biz.common.JDBCUtil;

//DAO(Data Access Object) 클래스 
//데이터 베이스와 연동하는 역할로 한정 

public class UserDAO {

	// JDBC 관련번수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// USERS 테이블 관련 SQL 명령어.
	private String USER_LIST = "SELECT * FROM USERS";
	private String USER_INSERT = "INSERT INTO USERS VALUES(?,?,?,?)";
	private String USER_UPDATE = "UPDATE USERS SET NAME = ?, ROLE = ? WHERE ID = ?";
	private String USER_DELETE = "DELETE FROM USERS WHERE ID = ?";
	private String USER_GET = "SELECT * FROM USERS WHERE ID = ?";

	// 회원 상세 조회
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);

			stmt.setString(1, vo.getId());
			rs = stmt.executeQuery();

			while (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
			}

		} catch (SQLException e) {
			// TODO: handle exception
		} finally {

		}
		return user;
	}

	// CRUD

	// 회원 목록 조회
	public List<UserVO> getUserList() {

		List<UserVO> userList = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();

			stmt = conn.prepareStatement(USER_LIST);

			rs = stmt.executeQuery();

			System.out.println("[ USER 목록 ]");

			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
				userList.add(user);
			}

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}

		return userList;
	}

	// 회원 목록 추가
	public void insertUser(UserVO vo) {

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);

			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getRole());

			System.out.println("INSERT" + stmt.executeLargeUpdate() + " 건 데이터 처리 성공!");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}

	}

	// 회원 정보 수정
	public void updateUser(UserVO vo) {
		try {

			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getRole());
			stmt.setString(3, vo.getId());

			stmt.executeUpdate();
			System.out.println("UPDATE" + stmt.executeLargeUpdate() + " 건 데이터 처리 성공!");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 회원 정보 삭제
	public void deleteUser(String id) {
		try {
			conn = JDBCUtil.getConnection();

			stmt = conn.prepareStatement(USER_DELETE);

			stmt.setString(1, id);
			stmt.executeUpdate();
			System.out.println("DELETE" + stmt.executeLargeUpdate() + " 건 데이터 처리 성공!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCUtil.close(stmt, conn);

		}
	}

}
