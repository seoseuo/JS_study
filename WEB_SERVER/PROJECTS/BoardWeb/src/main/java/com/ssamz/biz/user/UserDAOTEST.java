package com.ssamz.biz.user;

import java.util.List;

public class UserDAOTEST {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDAO dao = new UserDAO();
		// 회원 정보 수
		List<UserVO> userList = dao.getUserList();

		// CASE-1
		System.out.println("전체 회원의 수 : " + userList.size());

		// CASE-2
		System.out.println("[ 회원 목록 ]");
		System.out.println("ID : PW : NAME : ROLE ");
		for (UserVO user : userList) {
			System.out.println(
					user.getId() + " : " + user.getPassword() + " : " + user.getName() + " : " + user.getRole());
		}
		// 회원 정보 추가
		// dao.insertUser("ssamz3", "ssamz/123", "샘즈", "ADMIN");

//		UserVO vo = new UserVO();
//		vo.setName("쌤즈");
//		vo.setRole("USER");
//		vo.setId("ssamz4");
//		vo.setPassword("ssamz123");
//
//		dao.insertUser(vo);

		// 회원 정보 수정
		// dao.updateUser("수정", "USER", "ssamz3");

//		UserVO vo = new UserVO();
//		vo.setName("수정");
//		vo.setRole("USER");
//		vo.setId("ssamz4");
//		dao.updateUser(vo);

		// 회원 정보 삭제
		// dao.deleteUser("ssamz");

		// 회원 정보 수
		dao.getUserList();
	}

}
