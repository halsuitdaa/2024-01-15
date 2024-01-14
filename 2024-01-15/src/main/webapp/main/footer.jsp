<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바로캠핑 푸터</title>
</head>
<body>
	<!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-6 mt-6">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-6">
                                <h2 class="text-primary mb-0">COPYRIGHT (C) BOROCAMPING<br>ALL RIGHTS RESERVED.</h2>                           
                                <span>
                                바로캠핑 내 이미지, 게시글 등의 콘텐츠는 바로캠핑에 저작권이 있습니다.<br>
								이러한 콘텐츠는 출처를 밝히고 비상업적인 용도에서만 활용하실 수 있습니다.</span>
                        </div> <!-- s -->
                    </div>
                </div>
                <div class="row g-3">
                <div class="col-lg-4 col-md-6">
                        	<div class="footer-item">
                            <h4 class="text-light mb-4">바로캠핑 소개</h4>
                            <span> 사업자번호: 01234567890 <br>
                            사업장 주소: 대한민국 어딘가 <br>
                            메일 주소: barocamp@gmail.com
                           </span>
                        </div>
                        </div>
                	<div class="col-lg-4 col-md-6">
                        	<div class="d-flex flex-column text-start footer-item">
                        	<h4 class="text-light mb-4">고객센터 1234-8585</h4>
                        	<span>운영시간은 평일 오전 9시~오후 5시입니다
                        	<br>점심시간 13-14시, 주말, 공휴일은 운영하지 않으니
                        	<br>1:1문의를 남겨주세요
                        	</span>
                        	</div>
                        	</div>
                        	
                    <%--  <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3"></h4>
                            <c:forEach var="novo" items="${noList }">
                              <a class="btn-link" href="">[${novo.type }]&nbsp;${novo.subject}</a>
                            </c:forEach>
                            
                            
                        </div>
                    </div> --%>
                    <div class="col-lg-4 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-4">오늘의 뉴스</h4>                         
                            <c:forEach var="nvo" items="${nList }" varStatus="s">
						      <c:if test="${s.index<3 }">
						      	 <a class="btn-link" href="${nvo.link }">${nvo.title }</a>
						      </c:if>
						    </c:forEach> 
                        </div>
                        </div>                 
                        </div>
            			</div>
      			  		</div>
        <!-- Footer End -->
</body>
</html>