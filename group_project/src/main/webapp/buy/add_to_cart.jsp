<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
    String product = request.getParameter("product");
    String price = request.getParameter("price");

    ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    HashMap<String, String> item = new HashMap<>();
    item.put("product", product);
    item.put("price", price);

    cart.add(item);
    session.setAttribute("cart", cart);

    out.println(product + "이(가) " + price + "원에 장바구니에 추가되었습니다!");
%>
