package servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ChangePwServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String current = request.getParameter("current");
        String newPw = request.getParameter("newPw");
        String newPwChk = request.getParameter("newPwChk");
        
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String userPw = (String) session.getAttribute("userPw");
        
        if(userId == null) {
        	response.sendRedirect("member/login.jsp");
        	return;
        }
        
        // 비밀번호 확인 및 변경 처리
        MemberDAO memberDAO = new MemberDAO();
        boolean isPwCheck = memberDAO.checkPassword(userId, current);
        
        if(isPwCheck) {
        	if(newPw.equals(newPwChk)) {
        		// 비밀번호 변경
        		memberDAO.updatePassword(userId, newPw);
        		// 비밀번호 변경 후 세션의 비밀번호 업데이트
        		session.setAttribute("userPw", newPw);
        		// 비밀번호 변경 완료 후 메인 페이지로 리다이렉트
        		response.sendRedirect("index.jsp");
        		} else {
        			// 새 비밀번호와 확인 비밀번호 불일치
        			response.sendRedirect("member/changePW.jsp?error=1");
        	}
        } else {
        	// 현재 비밀번호 불일치
        	response.sendRedirect("member/changePW.jsp?error=2");
        }
	}
}
