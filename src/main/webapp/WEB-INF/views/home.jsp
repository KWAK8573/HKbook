<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style >
  .imageDiv {
    z-index: 1;
  }
  .card:hover .imageDiv {
    z-index: 0;
    opacity: 0.3;

  }
  
</style>
</head>
<%@ include file="include/head.jsp" %>
<body class="sb-nav-fixed">
<!-- 상단메뉴(로고 있는 라인) -->
<%@ include file="include/main_header.jsp" %>
<div id="layoutSidenav">
	<!-- 왼쪽메뉴 -->
	<%@ include file="include/left_column.jsp" %>
	<div id="layoutSidenav_content">
	<main>
	
	<!-- 페이지 내용넣는 곳 -->
	<div class="row mt-3 m-0" style="width: 100%;">
	
	<!--  1  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv w-100 h-100">
            <img src="https://movie-phinf.pstatic.net/20210310_199/1615367075185E9pMt_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 w-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">고질라 VS. 콩</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">액션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">113분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  2  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210126_174/1611638248803840HH_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">극장판 귀멸의 칼날: 무한열차편</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애니메이션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">117분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  3  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210322_142/1616399817643EJ85O_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">미나리</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">115분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  4  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210215_30/1613366376318deAa1_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">리야와 마지막 드래곤</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애미메이션, 액선, 모험</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">114분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  5  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210315_6/1615776377782BBsNl_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">최면</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">공포, 스릴러</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">85분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  6  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210208_255/1612760227924x9jop_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute"  style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">중경삼림</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">102분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  7  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210208_255/1612760227924x9jop_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">소울</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">애니메이션</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">107분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  8  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210223_109/1614071286007hejv3_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">파이터</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">드라마</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">104분</div>
            
          </div>     
        </div>
      </div>
      <div id="bookmark"></div>
      <!--  9  -->
      <div class="col-6 col-md-4 mb-4" style="cursor:pointer;">
        <div class="card h-100 position-relative">
          <div class="imageDiv h-100">
            <img src="https://movie-phinf.pstatic.net/20210308_237/1615171952260dkz3u_JPEG/movie_image.jpg?type=m203_290_2" onerror="this.src='/static/img/no_photo.png'" class="h-100 card-img-top poster-img" alt="...">
          </div>
          <div class="desc position-absolute w-100 h-100 text-center">
            <div class="position-absolute" style="top: 0; bottom: 3.5rem; width: 100%;"></div>
            <div class="card-title text-truncate" style="background-color: rgba(86, 189, 190, 0.5); font-size:calc(12px + 1vw); padding: 3vw 0;">스파이의 아내</div>
            <div class="text-truncate" style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">서스펜스, 멜로/로맨스</div>
            <div style="font-size:calc(8px + 1vw); padding: 1vw 0 0;">116분</div>
            
          </div>     
        </div>
      </div>
    </div>
	<!-- 페이지 내용넣는 곳 끝-->
		
	</main>
	<%@ include file="include/main_footer.jsp" %>
	</div>
</div>
<!-- 부트스트랩 테마 플러그인 -->
<%@ include file="include/plugin_js.jsp" %>
</body>
</html>

