<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-28
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js     "></script>
</head>
<body>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");


    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try{
//    PreparedStatement를 사용하여 sql 쿼리문이 변경됨
        String sql = "SELECT id, passwd from member ";
        sql += "WHERE id = ?";

//    PreparedStatement 객체 생성 시 사용할 SQL 문을 적용
        pstmt = conn.prepareStatement(sql);
//    필요한 위치의 데이터를 변경
        pstmt.setString(1, userId);

        rs = pstmt.executeQuery();

        if (rs.next()){
            String rid = rs.getString("id");
            String rpw = rs.getString("passwd");

            if (userId.equals(rid) && userPw.equals(rpw)){
                sql = "DELETE FROM member ";
                sql += "WHERE id = ? and passwd = ? ";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                pstmt.setString(2, userPw);
                pstmt.executeUpdate();

                out.println("member 테이블을 삭제했습니다.");
            }
            else {
                out.println("일치하는 비밀번호가 아닙니다.");
            }
        }
        else {
            out.println("지정한 사용자가 없습니다");
        }
    }
    catch (SQLException e){
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }

%>

</body>
</html>

</body>
</html>
