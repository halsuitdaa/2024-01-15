<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유자료실</title>
<style type="text/css">
.row1{
  margin: 0px auto;
  /* width: 800px; */
}
.listcontent{

	margin-top: 200px;
}
</style>
</head>
<body>
 <div class="listcontent">
 <div class="wrapper row3">
  <main class="container clear"> 
  <h2 class="sectiontitle">공유 자료실</h2>
  <span>캠핑 관련 자료 업로드</span>
  <div class="row row1" style="height: 400px">
   <span><br><a href="../databoard/insert.do" 
         class="btn btn-sm btn-danger">작성하기</a></span>
    <table class="table">
      <tr>
       <th class="text-center" width=10%>번호</th>
       <th class="text-center" width=55%>제목</th>
       <th class="text-center" width=10%>이름</th>
       <th class="text-center" width=15%>작성일</th>
       <th class="text-center" width=10%>조회수</th>
      </tr>
      <c:set var="count" value="${count }"/>
      <c:forEach var="vo" items="${list }">
        <tr>
	       <td class="text-center" width=10%>${count }</td>
	       <td width=55%><a href="../databoard/detail.do?no=${vo.no }">${vo.subject }</a>
	        &nbsp; <c:if test="${today==vo.dbday }">
	          <sup><img src="../databoard/new.gif"></sup>
	        </c:if>
	       </td>
	       <td class="text-center" width=10%>${vo.name }</td>
	       <td class="text-center" width=15%>${vo.dbday }</td>
	       <td class="text-center" width=10%>${vo.hit }</td>
	      </tr>
	      <c:set var="count" value="${count-1 }"/>
      </c:forEach>
    
      <tr>
        <td colspan="5" class="text-center">
         <a href="#" class="btn btn-danger btn-sm">이전</a>
         ${curpage } page / ${totalpage } pages
         <a href="#" class="btn btn-danger btn-sm">다음</a>
         <br>
        </td>
      </tr>
    </table>
  </div>
  </main>
 </div>
 </div>
</body>
</html>