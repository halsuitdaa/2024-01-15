<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
<style type="text/css">
     .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        list-style: none;
        padding: 0;
    }

    .pagination li {
        margin: 0 5px;
    }
</style>
</head>
<body>
    <h3 class="text-center">상품 목록</h3>
    <table class="table">
        <tr>
            <th class="text-center">상품 번호</th>
            <th class="text-center">상품명</th>
            <th class="text-center">상품이미지</th>
            <th class="text-center">상품가격</th>
        </tr>
        <c:forEach var="vo" items="${list}">
            <tr>
                <td class="text-center">${vo.gno}</td>
                <td>${vo.title}</td>
                <td class="text-center"><img src="${vo.poster}" style="width: 100px"></td>
                <td class="text-center">${vo.selling_price}원</td>
                <td class="text-center">
                 <a href="../adminpage/admin_goods_detail.do?cno=${vo.cno }&gno=${vo.gno}" class="btn btn-sm btn-primary">수정</a>
                 <a href="../adminpage/admin_goods_delete.do" class="btn btn-sm btn-primary">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="text-center">
            <ul class="pagination">
              <c:if test="${startPage>1 }">
                <li><a href="../adminpage/admin_goods.do?page=${startPage-1 }">&lt;</a></li>
              </c:if>
              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                 <li ${curpage==i?"class=active":"" }><a href="../adminpage/admin_goods.do?page=${i }">${i}</a></li>
              </c:forEach>
              <c:if test="${endPage<totalpage }">
                <li><a href="../adminpage/admin_goods.do?page=${endPage+1 }">&gt;</a></li>
              </c:if>
            </ul>
         </div>
</body>
</html>