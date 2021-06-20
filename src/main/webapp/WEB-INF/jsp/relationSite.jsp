<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>코로나 인포 | 국내외 확진자 정보 제공</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <!-- Bootstrap core CSS -->
	<link href="/resource/res/css/bootstrap.min.css" rel="stylesheet">
	<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
	
	<!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	 <!-- Custom styles for this template -->
    <link href="/resource/res/css/dashboard.css" rel="stylesheet">
    <link href="/resource/res/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="/resource/res/css/stylesheet" href="dark-mode.css">
    
</head>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
	    }
	

   
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
	[data-theme="dark"] {
  		background-color: #111 !important;
  		color: #eee;
		}

	[data-theme="dark"] .bg-light {
	  background-color: #333 !important;
	}

	[data-theme="dark"] .bg-white {
  	background-color: #000 !important;
	}

	[data-theme="dark"] .bg-black {
 		 background-color: #eee !important;
	}
      
    </style>

<body>



<!-- Header Area  -->
<%@ include file="Header.jsp"%>
<!-- End of Header Area  -->

<!-- Side Bar Area  -->
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2
     d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>종합 상황판</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
          </a>
        </h6>

        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="index.do">
              <!-- <span data-feather="home"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-graph-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5z"/>
              </svg>
              &nbsp;국내 상황판
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Overseas">
              <!-- <span data-feather="file"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-graph-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5z"/>
              </svg>
              &nbsp;해외 상황판
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>코로나-19 관련 자료</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="http://ncov.mohw.go.kr/baroView.do?brdId=4&brdGubun=41" target="'_blank">
              <!-- <span data-feather="file-text"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
                <circle cx="8" cy="4.5" r="1"/>
              </svg>
              &nbsp;코로나-19란?
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=" target="'_blank">
              <!-- <span data-feather="file-text"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-newspaper" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z"/>
                <path d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z"/>
              </svg>
              &nbsp;질병관리청 보도자료
            </a>
          </li>
          <li class="nav-item">

            <a class="nav-link active" href="relationSite">
              <!-- <span data-feather="file-text"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-link-45deg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
                <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
              </svg>
              &nbsp;관련 사이트
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>기타</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="Developer">
              <!-- <span data-feather="users"></span> -->
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-tools" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 1l1-1 3.081 2.2a1 1 0 0 1 .419.815v.07a1 1 0 0 0 .293.708L10.5 9.5l.914-.305a1 1 0 0 1 1.023.242l3.356 3.356a1 1 0 0 1 0 1.414l-1.586 1.586a1 1 0 0 1-1.414 0l-3.356-3.356a1 1 0 0 1-.242-1.023L9.5 10.5 3.793 4.793a1 1 0 0 0-.707-.293h-.071a1 1 0 0 1-.814-.419L0 1zm11.354 9.646a.5.5 0 0 0-.708.708l3 3a.5.5 0 0 0 .708-.708l-3-3z"/>
                <path fill-rule="evenodd" d="M15.898 2.223a3.003 3.003 0 0 1-3.679 3.674L5.878 12.15a3 3 0 1 1-2.027-2.027l6.252-6.341A3 3 0 0 1 13.778.1l-2.142 2.142L12 4l1.757.364 2.141-2.141zm-13.37 9.019L3.001 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026z"/>
              </svg>
              &nbsp;&nbsp;개발자
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</div>
<!-- End of SideBar Area -->

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

<br>
<h1><span class="badge bg-success text-light">관련 사이트</span></h1>
<br>


<div class="card">
  <div class="card-header">
    <h6>사이트 종류</h6>
  </div>
  <div class="card-body">
    <blockquote class="blockquote mb-0">
    <p>국가별 코로나-19 바이러스 감염증 정보 주소</p>
      <footer class="blockquote-footer"><a href="https://www.cdc.gov" target="'_blank">미국 질병통제예방센터(Center for Disease Control)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.canada.ca/en/health-canada.html" target="'_blank">캐나다 공중보건국(Public Health Agency of Canada)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.ecdc.europa.eu/en" target="'_blank">유럽 질병통제 예방센터(European Centre for disease Prevention and Control)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.moh.gov.sg/" target="'_blank">싱가포르 보건부(Ministry of Health)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.health.gov.au/news/health-alerts/novel-coronavirus-2019-ncov-health-alert" target="'_blank">오스트레일리아 연방 정보 보건부(Australia Government Department of Health)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.infektionsschutz.de/coronavirus-sars-cov-2.html" target="'_blank">독일 연방 보건 교육 센터(Federal Center of Health Education)</a></footer>
      <footer class="blockquote-footer"><a href="https://www.chp.gov.hk/tc/index.html" target="'_blank">홍콩 건강 보호 센터(Center for Health Protection)</a></footer><br>
    
      <p>실시간 감염정보</p>
      <footer class="blockquote-footer"><a href="https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6" target="'_blank">전세계 실시간 감염 지도 (By. Johns Hopkins)</a></footer>
      <footer class="blockquote-footer"><a href="http://ncov.mohw.go.kr/" target="'_blank">한국 내 코로나바이러스 정보 (질병관리청)</a></footer><br>
      
      <p>데이터베이스</p>
      <footer class="blockquote-footer"><a href="https://www.ncbi.nlm.nih.gov/labs/virus/vssi/#/virus?SeqType_s=Nucleotide&VirusLineage_ss=Wuhan%20seafood%20market%20pneumonia%20virus,%20taxid:2697049" target="'_blank">NCBI Virus</a> : 미국 NCBI(National Center for Biotechnology information)에서 운영하는 바이러스 유전자 데이터 베이스</footer>
      <footer class="blockquote-footer"><a href="https://pubmed.ncbi.nlm.nih.gov/?term=2019-Ncov" target="'_blank">PubMed</a> : 신종코로나바이러스 논문 검색 결과</footer>
      <footer class="blockquote-footer"><a href="https://www.cdc.gov/coronavirus/2019-ncov/publications.html" target="'_blank">CDC</a> : 신종코로나바이러스 관련 자료</footer><br>
      
      <p>WHO</p>
      <footer class="blockquote-footer"><a href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019" target="'_blank">예방수칙, 의료 기술적 가이드라인, 최신 레포드 등 제공</a></footer>
      <footer class="blockquote-footer"><a href="https://www.who.int/health-topics/coronavirus" target="'_blank">코로나-19 바이러스 현황</a></footer>
      <footer class="blockquote-footer"><a href="https://www.who.int/news-room/q-a-detail/q-a-coronaviruses" target="'_blank">코로나-19 바이러스 Q&A</a></footer><br>
    </blockquote>
  </div>
</div>


<br>
<%@include file="Footer.jsp"%>

</main>      


<!-- Script File List -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="/resource/res/js/dashboard.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resource/res/js/moment.js"></script>
<script src="/resource/res/js/dark-mode-switch.min.js"></script>
<!-- End of Script File List -->

</body>
</html>