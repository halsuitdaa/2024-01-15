<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid py-5 mb-5">
		<div class="container py-5">
	  		<div class="row g-5 align-items-center">
	  			<div class="row g-5 align-items-center">
					<img src="${vo.poster }" style="height: 600px;"><p>
				</div>
				<div class="row">
					<i class="fas fa-user fa-2x col-md-4 text-center">${vo.serving }</i>
					<i class="fas fa-clock fa-2x col-md-4 text-center">${vo.timee }</i>
					<i class="fa fa-star fa-2x col-md-4 text-center">${vo.difficulty }</i>
				</div>
				<div class="container">
					<div class="row">
						<h5 class="text-right">재료</h5>
						<div class="text">
							<c:forTokens items="${vo.ingredient }" delims="|" var="t">
								<li>${t }</li>
						    </c:forTokens>
								
						</div>
					</div>
				</div>
				
				<div class="container">
					<div class="row-md-6">
						<h5 class="text-right">조리 순서</h5>
						<table class="table">
						
							<c:forEach var="ss" items="${list1 }" varStatus="s">
								<tr>
									<td width="80%">${s.count}.&nbsp;${ss}</td>
									<td width="20%"><img src="${list2[s.index] }" style="width: 100%; height: 200px;"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
