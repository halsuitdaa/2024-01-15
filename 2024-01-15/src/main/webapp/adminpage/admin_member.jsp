<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
</head>
<body>
    <h3 class="text-center">회원 목록</h3>
    <table class="table">
        <tr>
            <th class="text-center">회원아이디</th>
            <th class="text-center">회원명</th>
            <th class="text-center">성별</th>
            <th class="text-center">생년월일</th>
            <th class="text-center">이메일</th>
            <th class="text-center">전화번호</th>
        </tr>
        <c:forEach var="vo" items="${list}">
            <tr>
                <td class="text-center">${vo.id}</td>
                <td>${vo.name}</td>
                <td class="text-center">${vo.sex}</td>
                <td class="text-center">${vo.birthday}</td>
                <td class="text-center">${vo.email}</td>
                <td class="text-center">${vo.phone}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>