package com.ssamz.web.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssamz.web.controller.Controller;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("로그아웃 처리");
		
		// 1. 사용자 입력 정보 추출
		String seq = request.getParameter("seq");
		
		// 3. 화면 이동
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}

}
