<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mail.*, jakarta.mail.*, jakarta.mail.internet.*, java.util.*" %>

<%
	try {
		EmailAuthentic auth = new EmailAuthentic();
		
		Session ses = Session.getDefaultInstance(auth.getProp(), auth);
		
		// 메일 발송에 필요한 정보
		MimeMessage msg = new MimeMessage(ses);
		
		msg.setSentDate(new Date());
		
		msg.setHeader("Content-Type","text/html;charset=utf-8");
		
		// 수신자 지정
		InternetAddress to = new InternetAddress("request.getParameter(email)");
		msg.setRecipient(Message.RecipientType.TO, to);
		
		// 발신자 지정
		msg.setFrom(new InternetAddress("master@btc.ac.kr","MASTER"));
		
		// 제목 지정
		msg.setSubject("BASKINROBBINS 31.2 인증 번호 전송", "UTF-8");
		
		// 내용지정
		msg.setContent(
			"<h3>오늘은 무사히...</h3>",
			"text/html;charset=utf-8"
		);
		
		// 발송 성공 시 어케할지
	} catch (Exception e) {
		e.printStackTrace();
		// 발송 실패 시 어케 할지
	}
%>