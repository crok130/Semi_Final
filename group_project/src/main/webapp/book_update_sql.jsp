<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<% 
	// book_update_form.jsp 에서 전달된 파라미터 값들	
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));	
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String image_path = request.getParameter("image_path");

	// String >>> int 변환
	
	// 전달된 파라미터 일치확인위해 전달된 데이터베이스의 정보를 가져온다.
	Connection conn = JDBCUtil.getConnection();
	
	// 연결된 데이터베이스에 질의 작업을 수행하고 결과를 반환하는 객체
	PreparedStatement pstmt = null;
	
	try{
		// Driver class load
		// lib 폴더로 커넥터 파일 복사
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/baskin",	// 연결할 db server schema
			"root",									// 권한있는 계정 id
			"1234"										// 비밀번호				
		);
		// 쿼리 실행 시 쿼리 실행에 필요한 데이터를 삽입
		String sql = "UPDATE books SET title = ?, author = ?, publisher = ?, price = ?, stock = ?, description = ?, category = ?, image_path = ? WHERE book_id = ? ";   

		// 쿼리문 등록시켜주고 pstmt로 가지고와서..
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, publisher);
		pstmt.setInt(4, price);
		pstmt.setInt(5, stock);
		pstmt.setString(6, description);
		pstmt.setString(7, category);
		pstmt.setString(8, image_path);
		pstmt.setInt(9, book_id);
		// ?? 
		int result = pstmt.executeUpdate();
%>
		<script>
		alert('재고 수정 업데이트를 완료했습니다.'); 
		location.href='book_update_form.jsp';
		</script>
<%
		out.println("");

	}catch(ClassNotFoundException e){
		out.println("Driver class를 찾을 수 없음<br/>");
	}catch(SQLException e){
		out.println("DB 연결 정보 오류 <br/>");
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
%>	










