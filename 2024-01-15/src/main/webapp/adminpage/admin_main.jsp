<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .listcontent {
            margin-top: 200px;
        }

        
    </style>
</head>
<body>
    <div class="listcontent">
        <div class="container">
         <table>
          <tr>
           <td>
            <div class="menu-container">
                <%-- 뷰메뉴 --%>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            <i class="glyphicon glyphicon-leaf"></i>
                            <span>관리자페이지</span>
                        </h3>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../adminpage/admin_member.do">회원관리</a></li>
                        <li class="list-group-item"><a href="#">공지관리</a></li>
                        <li class="list-group-item"><a href="#">예약관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/admin_goods.do">상품관리</a></li>
                        <li class="list-group-item"><a href="#">캠핑장관리</a></li>
                        <li class="list-group-item"><a href="#">판매관리</a></li>
                    </ul>
                </div>
       
            </div>
            </td>
            <td>
            <div class="content-container">
                <%-- 화면 출력 --%>
                <jsp:include page="${admin_member_jsp }"></jsp:include>
                <jsp:include page="${admin_goods_jsp }"></jsp:include>
            </div>
            </td>
            </tr>
           </table>
        </div>
    </div>
</body>
</html>