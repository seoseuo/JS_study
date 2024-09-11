package com.ssamz.biz.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssamz.biz.common.JDBCUtil;

// DAO(Data Access Object) 클래스
public class BoardDAO {
	
	// JDBC 관련 변수
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	// SQL 명령어
	private static String BOARD_LIST = "select * from board order by seq desc";
	
	
	// 글 목록 검색
	public List<BoardVO> getBoardList(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("---> 글 목록 검색 수행중...");
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		try {
			
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				
				boardList.add(board);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return boardList;
	}
	

}
