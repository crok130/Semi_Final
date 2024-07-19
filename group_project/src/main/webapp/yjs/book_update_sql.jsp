<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utils.JDBCUtil" %>
<% 
	// book_update_form.jsp 에서 전달된 파라미터 값들	
	String book_id = request.getParameter("book_id");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	String stock = request.getParameter("stock");
	String book_memo = request.getParameter("book_memo");
	String category_age = request.getParameter("category_age");
	String category_overseas = request.getParameter("category_overseas");
	String book_fileName = request.getParameter("book_fileName");
	String param_book_no = request.getParameter("book_no");

	// String >>> int 변환
	int price_int = Integer.parseInt(price);
	int stock_int = Integer.parseInt(stock);
	int book_no_int = Integer.parseInt(param_book_no);
	
	// 전달된 파라미터 일치확인위해 전달된 데이터베이스의 정보를 가져온다
	Connection conn = null;
    PreparedStatement pstmt = null;
    String url = "jdbc:mysql://localhost:3306/baskin";
    String user = "root";
    String password = "1234";
	// 연결된 데이터베이스에 질의 작업을 수행하고 결과를 반환하는 객체
	
	try{
		// Driver class load
		// lib 폴더로 커넥터 파일 복사
		Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
		// 쿼리 실행 시 쿼리 실행에 필요한 데이터를 삽입
		String sql = "UPDATE books SET book_id = ?, title = ?, author = ?, publisher = ?, price = ?, stock = ?, book_memo = ?, category_age = ?, category_overseas = ?, book_fileName = ? WHERE book_no = ? ";   

		// 쿼리문 등록시켜주고 pstmt로 가지고와서..
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, book_id);
		pstmt.setString(2, title);
		pstmt.setString(3, author);
		pstmt.setString(4, publisher);
		pstmt.setInt(5, price_int);
		pstmt.setInt(6, stock_int);
		pstmt.setString(7, book_memo);
		pstmt.setString(8, category_age);
		pstmt.setString(9, category_overseas);
		pstmt.setString(10, book_fileName);
		pstmt.setInt(11, book_no_int);
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










