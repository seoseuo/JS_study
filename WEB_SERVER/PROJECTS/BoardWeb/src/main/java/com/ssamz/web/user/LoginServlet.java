package com.ssamz.web.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssamz.biz.user.UserDAO;
import com.ssamz.biz.user.UserVO;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String encoding;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
//	public LoginServlet() {
//		// super();
//		// TODO Auto-generated constructor stub
//
//		System.out.println("===> LoginServlet 생성");
//
//	}

//	@Override
//	public void init() throws ServletException {
//		// TODO Auto-generated method stub
//		// super.init();
//		System.out.println("---> init() 메소드 호출");
//	}

	@Override
	// 로그인 서블릿
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.사용자 입력 정보 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 2. DB 연동 처리
		UserVO vo = new UserVO();
		vo.setId(id);

		UserDAO dao = new UserDAO();
		UserVO user = dao.getUser(vo); // ID를 조회하여 일치하는 객체

		// 3. 응답화면 구성
		// 응답 메시지에 대한 인코딩 설정
		response.setContentType("text/html;charset=UTF-8");

		// HTTP 응답 프로토콜 message-body와 연결된 출력 스트림 획득
		PrintWriter out = response.getWriter();

		if (user != null) {
			// 로그인 성공 경우
			if (user.getPassword().equals(password)) {

				out.println(user.getName() + "님 로그인 환영! <br>");
				out.println("<a href='/getBoardList.do'>글 목록 이동</a>");
			}
			// 비밀번호가 틀린 경우
			else {
				out.println("비밀번호 오류입니다.<br>");
				out.println("<a href='/'></a>");
			}
		} else { // 아이디가 틀린 경우
			out.println("아이디 오류입니다.<br>");
			out.println("<a href='/'>다시 로그인</a>");
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		// response.getWriter().append("Served at: ").append(request.getContextPath());
//		System.out.println("===>  GET 방식의 요청 처리");
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		// doGet(request, response);
//		System.out.println("===>  POST 방식의 요청 처리");
//	}
//
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		// super.destroy();
//		System.out.println("---> destroy() 호출");
//		
//	}

}
