<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../css/font.css'>
</head>
<body>
</html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style type=text/css>
.container{
   position: relative;
   overflow: hidden;
   /* margin:10px 10px 10px 10px 
            top right bottom left */
 }
.detail-left
{
   margin-top : 168px;
   margin-left : 11px;
   float: left;
}
.detail-right
{
   margin-top : 180px;
   float: right;
}
.detailcontent{
   margin-top:140px;
}
a{
   margin-left:5px
}
.img-button:hover {
    cursor: pointer;
    opacity: 0.8;
}

#food-popup:hover{
   cursor: pointer;
    opacity: 0.8;
}
.table img:hover{
     cursor: pointer;
    opacity: 0.8;
  }
.roominfomationbigbox img:hover{
   cursor: pointer;
    opacity: 0.8;
}
.calendar{
   top:480px;
   right: 200px;
   width: 400px;
   height: 500px;
   margin-left: 20px;
} 
#partialContent{
   overflow: hidden;
}
.overflow-hide {
   overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.popup {
   display: none;
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   padding: 20px;
   background-color: white;
   border: 1px solid #ccc;
   z-index: 1000;
}
.detailhidenavbar {
  display: none;
  justify-content: space-between; /* 탭 사이의 간격을 조절하려면 필요에 따라 수정하세요 */
  background-color: #81c408;
  color:white;
  width: 1100px;
  height:50px;
  z-index: 1000;
  transition:0.5s;  
}
.navbar2 {
  list-style: none;
  padding: 0;
  margin-left:30px;
  display: flex;
}

.navbar2 a{
   color: white;
   z-index: 1001;
}

.navbar2 li {
  margin-right: 10px; /* 각 탭 사이의 간격을 조절하려면 필요에 따라 수정하세요 */
}

.roominformationbox,.roominfomationbigbox {
        border: 1px solid #ddd; /* 테두리 스타일 및 색상 설정 */
        border-radius: 20px; /* 테두리를 둥글게 만듭니다. 값은 상황에 맞게 조절하세요. */
        padding: 10px; /* 텍스트와 테두리 간격 조절을 위한 내부 여백 */
    }
.camping-review img{
   width: 200px;
}
.foodImg:hover{
   cursor: pointer
}

#campingreview {
    scroll-margin-top: -1200px; /* 원하는 만큼의 여백을 설정하세요 */
}
.table-container {
    max-height: 800px; /* 원하는 높이로 조절하세요 */
  }
  

</style>
</head>
<body> <!-- // 화면 UI -->
   <div class=container>
   <div class="detail-left">
      <div class="toppics">
      <div class="row"> 
        <table class="table" style="border-collapse: collapse;">
          
          <tr>
            <td rowspan="2">
               <!-- <a href="../gocamping/detail_picture.do"> -->
              <img src="${vo.poster}" style="width:600px;height:400px;border-radius: 20px;" onclick="showpicPopup()" class="img-rounded">
            </td>
            
            <td>
            <!--    <a href="../gocamping/detail_picture.do"> -->
              <img src="https://gocamping.or.kr/${vo.pic1}" style="width:200px;height:190px;border-radius: 20px;" onclick="showpicPopup()" class="img-rounded">
            </td>
            
            <td>
               <!-- <a href="../gocamping/detail_picture.do"> -->
              <img src="https://gocamping.or.kr/${vo.pic2}" style="width:200px;height:190px;border-radius: 20px;" onclick="showpicPopup()" class="img-rounded">
            </td>
          </tr>
          
          <tr>
            <td>
               <!-- <a href="../gocamping/detail_picture.do"> -->
              <img src="https://gocamping.or.kr/${vo.pic3}" style="width:200px;height:190px;border-radius: 20px;" onclick="showpicPopup()" class="img-rounded" id="toppicleft">
            </td>
            
            <td>
               <div style="position: relative;"><!-- 버튼을 이미지 위에 위치시키기 위해 position: absolute; 사용 -->
                  <!-- <a href="../gocamping/detail_picture.do"> -->
                 <img src="${vo.picc5}" style="width:200px;height:190px;border-radius: 20px;" onclick="showpicPopup()" class="img-rounded">
              <!--    <a href="../gocamping/detail_picture.do"> -->                                                                  
                  <img src="../img/plus.png" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:50px;height:50px;opacity: 0.8;" onclick="showpicPopup()" class="img-button">
              </div>
            </td>
          </tr>

        </table>
      </div>
      </div>



	<div id="popuppic" class="popuppic" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px; height:750px; ;width: 100%; max-width: 1000px;">
	    <div class="table-container">
	        <table class="table">
	            <tr>
	                <td class="text-center">
	                    <img src="${vo.picc1}" style="width: 900px; height: 500px;" id="piccmain">
	                </td>
	            </tr>
	            <tr>
	                <td style="height: 120px; width: 900px;">
	                    <div class="image-container" style="white-space: nowrap; overflow-x: auto; position: fixed; height: 140px; max-width: 950px;">
	                        <img src="${vo.picc2}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc3}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc4}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc5}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc6}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc7}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc8}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc9}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc10}" style="width: 100px; height: 70px;" class="piccdetail">
	                        <img src="${vo.picc11}" style="width: 100px; height: 70px;" class="piccdetail">
	                    </div>
	                </td>
	            </tr>
	        </table>
	    </div>
	    <button onclick="hidepicPopup()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
	</div>



   
   
      
      
          
          
<!-- 맨 위 사진 배치 끝 ###################################################################################################################################  -->   
          
      <nav class="detailhidenavbar">
         <ul role="tablist" class="navbar2">
            <li>
               <a href="#camping-info"><p style="margin-top: -8px;margin-right: 10px;">숙소이용정보</p></a>
            </li>
            <li>
               <a href="#campingroom"><p style="margin-top: -8px;margin-right: 10px;">객실</p></a>
            </li>
            <li>
               <a href="#campingroom-info"><p style="margin-top: -8px;margin-right: 10px;">객실정보</p><a>
            </li>
            <li>
               <a href="#campingreview"><p style="margin-top: -8px;margin-right: 10px;">후기</p></a>
            </li>
         </ul>
      </nav>
<!--  밑에 내용 시작 ############################################################################################################################# -->

      
       <div class="row">
         <div class=col-sm-8 style="width:600px;">
            <div class="campingtitle">
               <table style="width: 600px;">
                  <tr>
                     <td>
                        <p style="font-size: 30px;color:black;">${vo.title }&nbsp;<span style="color:orange"></span></p>
                     </td>
                     <td style="text-align: right;">
                        <a href=# class="btn btn-xs btn-danger" style="width: 75px;height: 28px;">
                        <p style="margin-top: -5px;">좋아요♡</p></a>
                        <a href=# class="btn btn-xs btn-success" style="width: 75px;height: 28px;">
                        <p style="margin-top: -5px;">찜하기</p></a>
                        <a href="../gocamping/list.do?page=${listcurpage }" class="btn btn-xs btn-primary" style="color:white;width: 75px;height: 28px;">
                        <p style="margin-top: -5px;">목록</p></a>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">   
                        <h5><span style="color:orange">${vo.subtitle }&nbsp;<span style="color:black"></span></h5>
                     </td>
                  </tr>
               </table>
            </div>  
            <hr>

            <div class="content-container" id="contentContainer">
            <!-- 
            <p style="font-size: 12px; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
               <script>
                  document.write("${kvo.loc}".length > 12 ? "${kvo.loc}".substring(0, 12) + '...' : "${kvo.loc}");
               </script>
            </p>

             -->
               <div class="explain" >
                  <br>
                    <p id="partialContent">
                    <script>
                     document.write("${vo.explain}".length > 200 ? "${vo.explain}".substring(0, 200) + '...' : "${vo.explain}");
                  </script>
                    
                    </p>
                    <p id="fullContent" style="display:none">${vo.explain}</p>
               </div>   
               <button onclick="showPopup()">더보기</button>
                 
               <div id="popup" class="popup">
                     ${vo.explain}
                  <button onclick="hidePopup()">닫기</button>
               </div>
            </div>
            
            <br>
            <hr>
            
            <table class=table style="width:600px;">
               <tr>
                  <th width=30%>주소</th>
                  <td width=70%>${vo.loc }</td>
                  <p style="margin-top:-12px">
                   <em class="link">
                       <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
                           혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
                       </a>
                   </em>
               </p>
               <div id="map" style="width:100%;height:350px;"></div>

               </tr>
               <tr>
                  <th width=30%>문의처</th>
                  <td width=70%>${vo.num }</td>
               </tr>
               <tr>
                  <th width=30%>캠핑장 환경</th>
                  <td width=70%>${vo.envir }</td>
               </tr>
               <tr>
                  <th width=30%>캠핑장 유형</th>
                  <td width=70%>${vo.category }</td>
               </tr>
               <tr>
                  <th width=30%>운영기간</th>
                  <td width=70%>${vo.season }</td>
               </tr>
               <tr>
                  <th width=30%>운영일</th>
                  <td width=70%>${vo.openclose }</td>
               </tr>
            
               <tr>
                  <th width=30%>홈페이지</th>
                  <td width=70%>${vo.homepage }</td>
               </tr>
               <tr id="camping-info">
                  <th width=30%>예약방법</th>
                  <td width=70%>${vo.reserve }</td>
               </tr>
               <tr>
                  <th width=30%>주변이용가능시설</th>
                  <td width=70%>${vo.facility }</td>
               </tr>
            </table>
         
       <!-- ====================================================================================== -->
            <%-- <div class=AAA  id="camping-info">
               <img src="${vo.poster }" style="width:600px;height:400px" class=img-rounded>
            </div> --%>
      <!-- ====================================================================================== -->      
      <div class="food-store">
         <table>
            <tr>
               <p>주변 음식점 추천</p>
            </tr>
         <tr>
         <c:forEach var="food" items="${foodlist}" varStatus="loop" begin="0" end="3">
           <c:if test="${loop.index < fn:length(foodlist)}">
          <td>
              <img src="${food.poster}" style="width: 120px; border-radius: 20px;" 
                  onclick="showPopup${loop.index + 1}()" id="food-popup">
              <p class="text-center" style="font-size: 13px;">
             <script>
               document.write("${food.name}".length > 6 ? "${food.name}".substring(0, 6) + '...' : "${food.name}");
            </script>
              </p>
          </td>
          </c:if>
         </c:forEach>
         </tr>      
         </table>

             <div id="popup1" class="popup1" style="display: none;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);padding: 20px;background-color: white;border: 1px solid #ccc;z-index: 1000;">
                <table class="table">
              <tr>
                <td width=40% class="text-center" rowspan="8">
                 <img src="${foodpopup1.poster}" style="width:260px;height: 350px">
                </td>
                <td colspan="2">
                 <h3 id="name">${foodpopup1.name }</h3>
                </td>
              </tr>
              <tr>
                <th width=15% class="text-left">업종</th>
                <td width=45% id="type">${foodpopup1.type}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">전화</th>
                <td width=45% id="phone">${foodpopup1.phone}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">주소</th>
                <td width=45% id="address">${foodpopup1.address}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">테마</th>
                <td width=45% id="theme">${foodpopup1.theme}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">영업시간</th>
                <td width=45% id="time">${foodpopup1.time}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">가격대</th>
                <td width=45% id="price">${foodpopup1.price}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">좌석</th>
                <td width=45% id="seat">${foodpopup1.seat}</td>
              </tr>
              <tr>
                <td colspan="3" id="content">${foodpopup1.content}</td>
              </tr>
             </table>
            <button onclick="hidePopup1()">닫기</button>
            </div>
            
            <div id="popup2" class="popup2" style="display: none;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);padding: 20px;background-color: white;border: 1px solid #ccc;z-index: 1000;">
                <table class="table">
              <tr>
                <td width=40% class="text-center" rowspan="8">
                 <img src="${foodpopup2.poster}" style="width:260px;height: 350px">
                </td>
                <td colspan="2">
                 <h3 id="name">${foodpopup2.name }</h3>
                </td>
              </tr>
              <tr>
                <th width=15% class="text-left">업종</th>
                <td width=45% id="type">${foodpopup2.type}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">전화</th>
                <td width=45% id="phone">${foodpopup2.phone}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">주소</th>
                <td width=45% id="address">${foodpopup2.address}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">테마</th>
                <td width=45% id="theme">${foodpopup2.theme}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">영업시간</th>
                <td width=45% id="time">${foodpopup2.time}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">가격대</th>
                <td width=45% id="price">${foodpopup2.price}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">좌석</th>
                <td width=45% id="seat">${foodpopup2.seat}</td>
              </tr>
              <tr>
                <td colspan="3" id="content">${foodpopup2.content}</td>
              </tr>
             </table>
            <button onclick="hidePopup2()">닫기</button>
            </div>
            
            <div id="popup3" class="popup3" style="display: none;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);padding: 20px;background-color: white;border: 1px solid #ccc;z-index: 1000;">
                <table class="table">
              <tr>
                <td width=40% class="text-center" rowspan="8">
                 <img src="${foodpopup3.poster}" style="width:260px;height: 350px">
                </td>
                <td colspan="2">
                 <h3 id="name">${foodpopup3.name }</h3>
                </td>
              </tr>
              <tr>
                <th width=15% class="text-left">업종</th>
                <td width=45% id="type">${foodpopup3.type}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">전화</th>
                <td width=45% id="phone">${foodpopup3.phone}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">주소</th>
                <td width=45% id="address">${foodpopup3.address}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">테마</th>
                <td width=45% id="theme">${foodpopup3.theme}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">영업시간</th>
                <td width=45% id="time">${foodpopup3.time}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">가격대</th>
                <td width=45% id="price">${foodpopup3.price}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">좌석</th>
                <td width=45% id="seat">${foodpopu3.seat}</td>
              </tr>
              <tr>
                <td colspan="3" id="content">${foodpopup3.content}</td>
              </tr>
             </table>
            <button onclick="hidePopup3()">닫기</button>
            </div>
            
            
            
            <div id="popup4" class="popup4" style="display: none;position: fixed;top: 50%;left: 50%;transform: translate(-50%, -50%);padding: 20px;background-color: white;border: 1px solid #ccc;z-index: 1000;">
                <table class="table">
              <tr>
                <td width=40% class="text-center" rowspan="8">
                 <img src="${foodpopup4.poster}" style="width:260px;height: 350px">
                </td>
                <td colspan="2">
                 <h3 id="name">${foodpopup4.name }</h3>
                </td>
              </tr>
              <tr>
                <th width=15% class="text-left">업종</th>
                <td width=45% id="type">${foodpopup4.type}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">전화</th>
                <td width=45% id="phone">${foodpopup4.phone}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">주소</th>
                <td width=45% id="address">${foodpopup4.address}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">테마</th>
                <td width=45% id="theme">${foodpopup4.theme}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">영업시간</th>
                <td width=45% id="time">${foodpopup4.time}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">가격대</th>
                <td width=45% id="price">${foodpopup4.price}</td>
              </tr>
              <tr>
                <th width=15% class="text-left">좌석</th>
                <td width=45% id="seat">${foodpopup4.seat}</td>
              </tr>
              <tr>
                <td colspan="3" id="content">${foodpopup4.content}</td>
              </tr>
             </table>
            <button onclick="hidePopup4()">닫기</button>
            </div>
            
            
      
         
      </div>
<!-- ====================================================================================== -->      
            <br>
            <hr>
            <br>
                  
            <p style="font-size: 20px; font:bold; color:black;">숙소 이용 정보</p>
            <br>
            <p style="font-size: 17px;">공지사항</p>
            <div class="infoo">
               <ul id="noticeList">
                  <script>
                     // infovo.etc 내용 가져오기
                     var etcContent = "${infovo.notice}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                     // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("noticeList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  <br>
                  
                  <p style="font-size: 17px;">기본정보</p>
                  <div class="infoo">
                    <ul id="infoList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.info}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                     // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("infoList").appendChild(listItem);
                      }
                    </script>
                    </ul>
                  </div>
                  
                  <br>
                  
                  <p style="font-size: 17px;">공지사항</p>
                  <div class="infoo" id="campingroom">
                    <ul id="roominfoList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.roominfo}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                     // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("roominfoList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  
                  <br>
                  <hr>
                  <br>
<!-- 객실 ######################################################################################## -->
            <div class="container3">
            <p style="font-size: 20px; font:bold; color:black;">객실</p>
            <table class="roominfomationbigbox" style="width: 617px;">
            <tr>
               <td rowspan="5" style="padding-right: 20px;width: 310px; height: 185px;">
                  <img src="${roomvo1.room1 }" style="width: 310px; height: 185px; margin-left: 10px;" onclick="showroompicPopup1()" class="img-rounded">
               </td>
               <td class="roominformationbox" style="width: 617px;">
                  <p>${roomvo1.roomname}</p><p style="font-size: 12px;">${roomvo1.roompersonnel}(${roomvo1.roommaxpersonnel})</p>
                  <p style="font-size: 12px;">${roomvo1.checkin}</p>
                  <p style="font-size: 12px;">${roomvo1.checkout}</p>
                  <p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo1.roomprice}</p>
                  <%-- <a href="../gocamping/reserve.do?gcrnoo=${roomvo1.gcrnoo }&gocampingno=${roomvo1.gocampingno }&roomno=${roomvo1.roomno}">
                  <div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
                  </a> --%>
               </td>   
            </tr>
            </table>
            
            <table class="roominfomationbigbox" style="width: 617px;">
            <tr>
               <td rowspan="5" style="padding-right: 20px;width: 310px; height: 185px;">
                  <img src="${roomvo2.room1 }" style="width: 310px; height: 185px; margin-left: 10px;" onclick="showroompicPopup2()">
               </td>
               <td class="roominformationbox">
                  <p>${roomvo2.roomname}</p><p style="font-size: 12px;">${roomvo2.roompersonnel}(${roomvo2.roommaxpersonnel})</p>
                  <p style="font-size: 12px;">${roomvo2.checkin}</p>
                  <p style="font-size: 12px;">${roomvo2.checkout}</p>
                  <p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo2.roomprice}</p>
                  <%-- <a href="../gocamping/reserve.do?gcrnoo=${roomvo2.gcrnoo }&gocampingno=${roomvo2.gocampingno }&roomno=${roomvo2.roomno}">
                  <div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
                  </a> --%>
               </td>   
            </tr>
            </table>
            
            
            <table class="roominfomationbigbox" style="width: 617px;">
            <tr>
               <td rowspan="5" style="padding-right: 20px; width: 310px; height: 185px;">
                  <img src="${roomvo3.room1 }" style="width: 310px; height: 185px; margin-left: 10px;" onclick="showroompicPopup3()">
               </td>
               <td class="roominformationbox">
                  <p>${roomvo3.roomname}</p><p style="font-size: 12px;">${roomvo3.roompersonnel}(${roomvo3.roommaxpersonnel})</p>
                  <p style="font-size: 12px;">${roomvo3.checkin}</p>
                  <p style="font-size: 12px;">${roomvo3.checkout}</p>
                  <p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo3.roomprice}</p>
                  <%-- <a href="../gocamping/reserve.do?gcrnoo=${roomvo3.gcrnoo }&gocampingno=${roomvo3.gocampingno }&roomno=${roomvo3.roomno}">
                  <div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
                  </a> --%>
               </td>   
            </tr>
            </table>
            
            <table class="roominfomationbigbox" style="width: 617px;">
            <tr>
               <td rowspan="5" style="padding-right: 20px;width: 310px; height: 185px;">
                  <img src="${roomvo4.room1 }" style="width: 310px; height: 185px; margin-left: 10px;" onclick="showroompicPopup4()">
               </td>
               <td class="roominformationbox" >
                  <p>${roomvo4.roomname}</p><p style="font-size: 12px;">${roomvo4.roompersonnel}(${roomvo4.roommaxpersonnel})</p>
                  <p style="font-size: 12px;">${roomvo4.checkin}</p>
                  <p style="font-size: 12px;">${roomvo4.checkout}</p>
                  <p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo4.roomprice}</p>
                  <%-- <a href="../gocamping/reserve.do?gcrnoo=${roomvo4.gcrnoo }&gocampingno=${roomvo4.gocampingno }&roomno=${roomvo4.roomno}">
                  <div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
                  </a> --%>
               </td>   
            </tr>
            </table>
            
            <table class="roominfomationbigbox" id="campingroom-info" style="width: 617px;">
            <tr>
               <td rowspan="5" style="padding-right: 20px;width: 310px; height: 185px;">
                  <img src="${roomvo5.room1 }" style="width: 310px; height: 185px; margin-left: 10px;" onclick="showroompicPopup5()">
               </td>
               <td class="roominformationbox">
                  <p>${roomvo5.roomname}</p><p style="font-size: 12px;">${roomvo5.roompersonnel}(${roomvo5.roommaxpersonnel})</p>
                  <p style="font-size: 12px;">${roomvo5.checkin}</p>
                  <p style="font-size: 12px;">${roomvo5.checkout}</p>
                  <p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo5.roomprice}</p>
                  <%-- <a href="../gocamping/reserve.do?gcrnoo=${roomvo5.gcrnoo }&gocampingno=${roomvo5.gocampingno }&roomno=${roomvo5.roomno}">
                  <div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
                  </a> --%>
               </td>   
            </tr>
            </table>
            
            </div>
         <br>
         <hr>
         <br>
         
         
         <div id="popuproompic1" class="popuproompic1" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px; width: 100%; max-width: 1000px;">
          <div class="table-container" >
              <table class="table">
                  <tr>
                      <td colspan="10" class="text-center">
                          <img src="${roomvo1.room1}" style="width: 900px; height: 500px;" id="roompicmain">
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 100px; width: 100%; max-width: 1000px;">
                      <div style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%; max-width: 950px;">
                          <img src="${roomvo1.room2}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room3}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room4}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room5}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room6}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room7}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room8}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room9}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo1.room10}" style="width: 100px; height: 70px;" class="roompicdetail">
                       </div>
                      </td>
                  </tr>
              </table>
          </div>
          <button onclick="hideroompicPopup1()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
      </div>
      
      <div id="popuproompic2" class="popuproompic2" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px;width:1000px;">
          <div class="table-container" >
              <table class="table">
                  <tr>
                      <td colspan="10" class="text-center">
                          <img src="${roomvo2.room1}" style="width: 900px; height: 500px;" id="roompicmain">
                      </td>
                  </tr>
                  <tr>
                       <td style="height: 100px; width: 100%; max-width: 1000px;">
                      <div style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%; max-width: 950px;">
                          <img src="${roomvo2.room2}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room3}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room4}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room5}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room6}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room7}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room8}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room9}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo2.room10}" style="width: 100px; height: 70px;" class="roompicdetail">
                          </div>
                      </td>
                  </tr>
              </table>
          </div>
          <button onclick="hideroompicPopup2()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
      </div>
      
      <div id="popuproompic3" class="popuproompic3" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px;width:1000px;">
          <div class="table-container" >
              <table class="table">
                  <tr>
                      <td colspan="10" class="text-center">
                          <img src="${roomvo3.room1}" style="width: 900px; height: 500px;" id="roompicmain">
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 100px; width: 100%; max-width: 1000px;">
                      <div style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%; max-width: 950px;">
                          <img src="${roomvo3.room2}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room3}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room4}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room5}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room6}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room7}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room8}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room9}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo3.room10}" style="width: 100px; height: 70px;" class="roompicdetail">
                          </div>
                      </td>
                  </tr>
              </table>
          </div>
          <button onclick="hideroompicPopup3()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
      </div>
      
      <div id="popuproompic4" class="popuproompic4" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px;width:1000px;">
          <div class="table-container" >
              <table class="table">
                  <tr>
                      <td colspan="10" class="text-center">
                          <img src="${roomvo4.room1}" style="width: 900px; height: 500px;" id="roompicmain">
                      </td>
                  </tr>
                  <tr>
                  	<td style="height: 100px; width: 100%; max-width: 1000px;">
                      <div style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%; max-width: 950px;">
                          <img src="${roomvo4.room2}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room3}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room4}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room5}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room6}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room7}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room8}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room9}" style="width: 100px; height: 70px;" class="roompicdetail">
                          <img src="${roomvo4.room10}" style="width: 100px; height: 70px;" class="roompicdetail">
                      </div>
                  	</td>
                  </tr>
              </table>
          </div>
          <button onclick="hideroompicPopup4()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
      </div>
      
      <div id="popuproompic5" class="popuproompic5" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px;width:1000px;">
          <div class="table-container" >
              <table class="table">
                  <tr>
                      <td colspan="10" class="text-center">
                          <img src="${roomvo5.room1}" style="width: 900px; height: 500px;" id="roompicmain">
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 100px; width: 100%; max-width: 1000px;">
	                      <div style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%; max-width: 950px;">
	                          <img src="${roomvo5.room2}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room3}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room4}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room5}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room6}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room7}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room8}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room9}" style="width: 100px; height: 70px;" class="roompicdetail">
	                          <img src="${roomvo5.room10}" style="width: 100px; height: 70px;" class="roompicdetail">
                          </div>
                      </td>
                  </tr>
              </table>
          </div>
          <button onclick="hideroompicPopup5()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
      </div>
      
      
   <!-- ######################################################################################## -->            
            <p style="font-size: 20px; font:bold; color:black;">객실 정보</p>
            <br>
            <p style="font-size: 17px;">인원 추가 정보</p>
            <div class="infoo">
               <ul id="personnelList"></ul>
               <script>
                  // infovo.etc 내용 가져오기
                  var etcContent = "${infovo.personnel}";
                     
                  // ||로 구분된 내용을 배열로 분할
                  var etcArray = etcContent.split("||");
                     
                  // 각 내용을 <li> 태그로 생성하여 추가
                  for (var i = 0; i < etcArray.length; i++) 
                  {
                     var listItem = document.createElement("li");
                     listItem.innerHTML = etcArray[i];
                        
                     // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                     listItem.style.marginBottom = "12px";
                              
                     // 생성한 <li> 태그를 ul#etcList에 추가
                     document.getElementById("personnelList").appendChild(listItem);
                  }
               </script>
            </div>
            
            <br>
                  
            <p style="font-size: 17px;">캠핑 서비스</p>
               <div class="infoo">
                  <ul id="serviceList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.service}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) 
                      {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                        // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("serviceList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  <br> 
                  
                  <p style="font-size: 17px;">바베큐 시설</p>
                  <div class="infoo">
                    <ul id="bbqList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.bbq}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) 
                      {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                          // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("bbqList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  <br> 
                  
                  <p style="font-size: 17px;">취소 및 환불 규정</p>
                  <div class="infoo">
                    <ul id="cancleList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.cancle}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) 
                      {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                        // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("cancleList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  <br> 
                  
                  <p style="font-size: 17px;">확인사항 및 기타</p>
                  <div class="infoo" id="campingreview">
                    <ul id="etcList"></ul>
                    <script>
                      // infovo.etc 내용 가져오기
                      var etcContent = "${infovo.etc}";
                  
                      // ||로 구분된 내용을 배열로 분할
                      var etcArray = etcContent.split("||");
                  
                      // 각 내용을 <li> 태그로 생성하여 추가
                      for (var i = 0; i < etcArray.length; i++) 
                      {
                        var listItem = document.createElement("li");
                        listItem.innerHTML = etcArray[i];
                  
                        // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
                        listItem.style.marginBottom = "12px";
                        
                        // 생성한 <li> 태그를 ul#etcList에 추가
                        document.getElementById("etcList").appendChild(listItem);
                      }
                    </script>
                  </div>
                  <br>    
            </div>
            
<!-- 오른쪽 달력 부분 ################################################################################################ -->         
               
         <div class=col-sm-4>
         <div calss=reserve>
         <div class=calendar>
            <jsp:include page="${reserve_jsp }"></jsp:include>
            
            <%-- <tr>
                  <td>
                     <a href=# class="btn btn-xs btn-danger">좋아요♡</a>
                     <a href=# class="btn btn-xs btn-success">찜하기</a>
                     <a href="../gocamping/list.do?page=${listcurpage }" class="btn btn-xs btn-primary">목록</a>
                  </td>
               </tr>    --%>
         </div>
         </div> 
         </div>
            
      </div> <!-- row 끝 -->
      <div class="row">
      <div class="camping-review">
   
         <p style="font-size: 20px; font:bold; color:black;">후기</p>
            
            <hr>
            
            <table>
               <div class="review-photo">
                  <tr>
                     <td>
                        <img src="../img/campingreview.png" style="border-radius: 15px; border-collapse: separate;margin-right: 5px;">
                     </td>
                     <td>
                        <img src="../img/campingreview.png" style="border-radius: 15px; border-collapse: separate;margin-right: 5px;">
                     </td>
                     <td>
                        <img src="../img/campingreview.png" style="border-radius: 15px; border-collapse: separate;margin-right: 5px;">
                     </td>
                     <td>
                        <img src="../img/campingreview.png" style="border-radius: 15px; border-collapse: separate;margin-right: 5px;">
                     </td>
                     <td>
                        <img src="../img/campingreview.png" style="border-radius: 15px; border-collapse: separate;margin-right: 5px;">
                     </td>
                  </tr>
               </div>
               </table>
               
               <hr>
               
               
               <div class="review-text">
               <table>   
                  <tr>
                     <td colspan="5">
                        <p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="5">
                        <p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="5">
                        <p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="5">
                        <p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="5">
                        <p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
                     </td>
                  </tr>
               </table>
         </div>
      </div>
      </div>

<!--row 끝 ########################################################################################### -->
   
   </div> <!-- detail-left 끝 -->

<div class="detail-right">
    <table style="border-collapse: collapse;margin:0px auto;">
        <tr>
            <td>
                <p class="text-center" style="color: black;">최근 본 캠핑장</p>
            </td>
        </tr>
        <tr>
         <c:forEach var="kvo" items="${kList }" varStatus="s">
             <c:if test="${s.index<3}">
                <tr>
                   <td class="text-center">
                   <a href="../gocamping/detail.do?no=${kvo.mno }">
                 <img src="${kvo.poster }" style="width: 120px;height: 120px;border-radius: 10px;" class="img-rounded"><!-- title="${kvo.title }" ==> 커서 갖다대면 이름 뜸 -->
                 </a>
                   </td>
                </tr>
                <tr>
                   <td>
                      <p class="text-center">${kvo.title }</p>
                   </td>
                </tr>
          </c:if>
         </c:forEach>
       </tr>
    </table>
</div>

</div> <!-- container 끝-->
<!-- 오른쪽 #################################################################################### -->

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${addr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    



  // JavaScript 함수 정의
  function redirectToPage(url) {
    window.location.href = url;
  }
  // #####################################################################캘린더
window.addEventListener('scroll', function() {
    var menu = document.querySelector('.detailhidenavbar');
    var calendar = document.querySelector('.calendar');
    var review = document.querySelector('.camping-review');
    var scrollY = window.scrollY || window.pageYOffset;
    var row = document.querySelector('.row');
    var toppics = document.querySelector('.toppics');
    var toppicleft = document.querySelector('#toppicleft');
    var colsm = document.querySelector('.col-sm-4');
   
    // 스크롤 위치에 따라 .detailhidenavbar 표시/숨김
    if (scrollY > 450) {
        menu.style.position = 'fixed';
        menu.style.display = 'block';
        menu.style.top = '86px';
        menu.style.marginLeft = row.offsetLeft - 25 + 'px';

        calendar.style.position = 'static'; // .detailhidenavbar가 나타날 때 calendar는 static으로 설정
    } else {
        menu.style.display = 'none';
    }

    // 스크롤 위치에 따라 .calendar 표시/숨김
    if (scrollY > 450) {
        // .review 엘리먼트가 화면에 나타날 때까지 calendar의 위치를 고정시킴
        //이 코드에서 review.offsetTop은 .review 엘리먼트의 문서 맨 위에서의 세로 위치를 나타냅니다. 
        //window.innerHeight는 현재 브라우저 창의 높이를 나타냅니다. 
        //따라서 scrollY > (review.offsetTop - window.innerHeight)은 .review 엘리먼트가 화면에 나타나는 순간을 감지합니다.
        if (scrollY < (review.offsetTop - window.innerHeight)) {
            calendar.style.position = 'fixed';
            calendar.style.top = '143px';  // .review가 나타나기 전까지 고정된 위치로 설정
            calendar.style.left = colsm.getBoundingClientRect().left + 10 + 'px';
        } else {
            // .review 엘리먼트가 화면에 나타난 경우, calendar의 위치를 absolute로 변경하여 .review에 겹치지 않도록 함
            calendar.style.position = 'absolute';
            calendar.style.top = (review.offsetTop - calendar.clientHeight) - 190 + 'px';
            calendar.style.left = colsm.getBoundingClientRect().left - 300 + 'px';
        }
    } 
    else 
    {
        calendar.style.position = 'static';
    }
});

// 페이지 로딩 시 초기 위치 설정
window.addEventListener('load', function() {
    var menu = document.querySelector('.detailhidenavbar');
    menu.style.display = 'none';
});

// 캘린더 끝  ####################################################### 











//============================================================================
// 캠핑장 사진
function showpicPopup() {
    document.getElementById('popuppic').style.display = 'block';
}

function hidepicPopup() {
    document.getElementById('popuppic').style.display = 'none';
}

function showPopup() {
    document.getElementById('popup').style.display = 'block';
}

function hidePopup() {
    document.getElementById('popup').style.display = 'none';
}

//음식점 팝업창 열기
for (var i = 1; i <= 4; i++) {
    (function(index) {
        window['showPopup' + index] = function() {
            document.getElementById('popup' + index).style.display = 'block';
        };

        window['hidePopup' + index] = function() {
            document.getElementById('popup' + index).style.display = 'none';
        };
    })(i);
 }   


//객실 팝업창 열기
for (var i = 1; i <= 5; i++) {
    (function(index) {
        window['showroompicPopup' + index] = function() {
            document.getElementById('popuproompic' + index).style.display = 'block';
        };

        window['hideroompicPopup' + index] = function() {
            document.getElementById('popuproompic' + index).style.display = 'none';
        };
    })(i);
}
    


$(function(){
   $('.piccdetail').hover(function(){
      /* $(this).css('border','2px solid red')
             .css('cursor','pointer'); */
      let src=$(this).attr("src");
      $('#piccmain').attr("src",src);
   });
});

// 객실 팝업
$(function(){
   $('.roompicdetail').hover(function(){
      /* $(this).css('border','2px solid red')
             .css('cursor','pointer'); */
      let src=$(this).attr("src");
      $('#roompicmain').attr("src",src);
   });
});

$(function(){
   $('.foodImg').click(function(){
      let fno=$(this).attr("data-fno");
      $.ajax({
         type:'post',
         url:'../gocamping/food_detail.do',
         data:{"fno":fno},
         success:function(res){
            let json=JSON.parse(res);
            
            $('#name').html(json.name+'<span style="color:orange">'+json.score+'</span>')
            $('#type').text(json.type)
            let temp=json.theme;
            let theme=temp.split(",")
            let html='<ul>'
            for(let t of theme)
               {
               html+='<li>'+t+'</li>'
               }
            html+='</ul>'
            $('#theme').html(html)
            $('#phone').text(json.phone)
            $('#address').text(json.address);
            $('#time').text(json.time)
            $('#seat').text(json.seat)
            $('#price').text(json.price)
            $('#content').text(json.content);
            $('#poster').attr("src",json.poster)
            //$('#dialog').attr("title",json.name+" 상세보기") // 창 띄웠을 떄 제목인데 안바뀜
            
            $('#dialog').dialog({
               autoOpen:false,
               width:650,
               height:700,
               modal:true
            }).dialog("open")
         }
      })
   })
})

    
    
</script>
</body>
</html>