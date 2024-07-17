package servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 입력값 가져오기
        String userId = request.getParameter("uId");
        String userPw = request.getParameter("uPw");

        // DAO 객체 생성
        MemberDAO memberDAO = new MemberDAO();
        MemberVO member = memberDAO.getMember(userId);

        // 비밀번호 확인 및 로그인 처리
        if (member != null && member.getPassword().equals(userPw)) {
            // 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);

            // 로그인 성공 후 메인 페이지로 이동
            response.sendRedirect("index.jsp");
        } else {
            // 로그인 실패 시 다시 로그인 페이지로 이동 및 알림 메시지 표시
            response.getWriter().println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); window.location='login.jsp';</script>");
        }
    }
}
