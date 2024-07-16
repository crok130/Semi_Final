<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 결제 내역</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center">결제 내역</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>이름</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>결제상품</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String filePath = application.getRealPath("/") + "WEB-INF/purchase_data.txt";
                    try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
                        String line;
                        while ((line = br.readLine()) != null) {
                            if (line.startsWith("이름")) {
                                out.println("<tr>");
                                out.println("<td>" + line.split(": ")[1] + "</td>");
                                out.println("<td>" + br.readLine().split(": ")[1] + "</td>");
                                out.println("<td>" + br.readLine().split(": ")[1] + "</td>");
                                out.println("<td>" + br.readLine().split(": ")[1] + "</td>");
                                out.println("<td>" + br.readLine().split(": ")[1] + "</td>");
                                out.println("</tr>");
                                br.readLine(); // Skip the "----------" line
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
