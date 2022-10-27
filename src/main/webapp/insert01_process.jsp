<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 사용하기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js     "></script>
</head>
<body>
  <%
    Connection conn = null;
    Statement stmt = null;

    try{
      String url = "jdbc:mysql://localhost:3306/javadb";
      String user = "test1";
      String passwd = "java505";

      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, passwd);

      request.setCharacterEncoding("utf-8");

      String userId = request.getParameter("userId");
      String userPw = request.getParameter("userPw");
      String userName = request.getParameter("userName");

      String sql = "INSERT INTO member (id, passwd, name)";
      sql += "VALUES ('" + userId + "','" + userPw + "','" + userName + "')";

      stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      out.println("Member 테이블에 데이터 추가가 성공했습니다.");

    }
    catch (SQLException e){
      out.println("Member 테이블 추가가 실패했습니다.");
      out.println("SQLException: " + e.getMessage());
    }
    finally {
      if (stmt != null){
        stmt.close();
      }
      if (conn != null){
        stmt.close();
      }
    }

  %>

</body>
</html>
