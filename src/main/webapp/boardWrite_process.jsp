<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>
<%--데이터를 받는거라 뷰는 없어도된다.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  String title = request.getParameter("title");
  String userId = request.getParameter("userId");
  String contents = request.getParameter("contents");

  PreparedStatement pstmt = null;

  try{
    String sql = "INSERT INTO board (title, contents, user_id, create_date) ";
    sql += "VALUES (?, ?, ?, now()) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, contents);
    pstmt.setString(3, userId);
    pstmt.executeUpdate();
  }
  catch (SQLException e){
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (pstmt != null) { pstmt.close(); }
    if (conn != null) { conn.close(); }
  }

  response.sendRedirect("boardList.jsp"); //  실행다 되면 첫페이지로 돌아간다.
%>

