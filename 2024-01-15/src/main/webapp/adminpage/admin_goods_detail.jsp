<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="row">
      <table class="table">
         <tr>
            <td width="35%" align="center" rowspan="9">
               <img src="${vo.poster }" id="image">
            </td>
            <td width="65%" align="center">
               <span id="title">
               ${vo.title }
               </span>
            </td>
         </tr>
         <tr>
            <td width="65%">
               <!-- <span id="percent">요청한 값이 없습니다%</span>&nbsp; -->
               <span id="price">${vo.selling_price }원</span>
               <p>
                  <del id="psub">${vo.original_price }원</del>
               </p>
            </td>
         </tr>
         <!-- <tr>
            <td width="65%">
               <span id="label">첫구매할인가</span>
               <span id="price2">요청한 값이 없습니다</span>
            </td>
         </tr> -->
         <tr>
            <td width="65%">
               <span id="star">★★★★★</span>&nbsp;
               <span id="bold">4.5</span>
               <span id="count">(299)</span>
            </td>
         </tr>
         <tr>
            <td width="65%">
               <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png">&nbsp;&nbsp;&nbsp;&nbsp;
               <span id="delivery">${vo.delivery_price }</span>
            </td>
         </tr>
         <tr>
            <td width="65%">
               <select id="sel">
                  <option>옵션 선택</option>
               </select>
            </td>
         </tr>
         <tr>
            <td width="65%">
               <input type="button" value="수정">
               <input type="button" value="취소">
               <a href="../adminpage/admin_goods.do" id="cart">목록</a>
            </td>
         </tr>
      </table>
   </div>
</body>
</html>