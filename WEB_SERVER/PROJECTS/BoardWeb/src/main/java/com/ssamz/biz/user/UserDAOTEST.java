package com.ssamz.biz.user;

public class UserDAOTEST {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserCustomDAO dao = new UserCustomDAO();
		//회원 정보 수
		dao.getUserList();

		//회원 정보 추가 
		//dao.insertUser("ssamz3", "ssamz/123", "샘즈", "ADMIN");
		
		//회원 정보 수정 
		//dao.updateUser("수정", "USER", "ssamz3");
		
		//회원 정보 삭제 
		dao.deleteUser("ssamz3");
		
		//회원 정보 수
		dao.getUserList();
		
	}

}
