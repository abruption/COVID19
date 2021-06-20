<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>코로나 인포 | 국내외 확진자 정보 제공</title>
    <meta charset="utf-8">
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

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


    <!-- 국내 확진자 수 차트 작성을 위한 DB 연동 -->
    <script>
        setInterval("go_time()", 1000);
        function go_time() {

            var now = new Date();

            var year = now.getFullYear(); //년
            var month = now.getMonth() + 1; //월
            var day = now.getDate();  //일
            var hour = now.getHours();  //시
            var min = now.getMinutes();  //분
            var sec = now.getSeconds();  //초

            if (month < 10)
                month = "0" + month;

            if (day < 10)
                day = "0" + day;

            if (hour < 10)
                hour = "0" + hour;

            if (min < 10)
                min = "0" + min;

            if (sec < 10)
                sec = "0" + sec;


            document.getElementById("clock").innerHTML = year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec
        }

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        var date = new Array();
        var decideCnt = new Array();
        var result = new Array();
        <c:forEach var="chart" items="${chart}" varStatus="status">
        date.push("${chart.Date}");
        decideCnt.push("${chart.decideCnt}");
        </c:forEach>

        var _date = date.slice(-5);
        var _decideCnt = decideCnt.slice(-5);

        for(var i=0; i<_date.length; i++){
            result[i] = _date[i].substring(4, 6) + '월 ' + _date[i].substring(6, 8) + '일';
        }
    </script>
    <!-- 국내 확진자 수 차트 작성을 위한 DB 연동 종료 -->
</head>



<!-- Header Area -->
<nav class="navbar navbar-default sticky-top bg-white flex-md-nowrap p-0">
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3 bg-light" style="text-align:center;" href="main.jsp"><b>CORONA-INFO</b></a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>
<!-- End of Header Area -->

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
                        <a class="nav-link active" href="main.jsp">
                            <!-- <span data-feather="home"></span> -->
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-graph-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5z"/>
                            </svg>
                            &nbsp;국내 상황판
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=14&ncvContSeq=&contSeq=&board_id=&gubun=">
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
                        <a class="nav-link" href="http://ncov.mohw.go.kr/baroView.do?brdId=4&brdGubun=41">
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
                        <a class="nav-link" href="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=">
                            <!-- <span data-feather="file-text"></span> -->
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-newspaper" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z"/>
                                <path d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z"/>
                            </svg>
                            &nbsp;질병관리청 보도자료
                        </a>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link" href="relationSite">
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


<c:forEach var="result" items="${subjectList}" varStatus="status">
<c:forEach var="result2" items="${subjectList2}" varStatus="status">
<!-- Main Content Area -->
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    <div class="sb-page-header pb-10 sb-page-header-dark bg-gradient-primary-to-secondary">
        <div class="container-fluid">
            <div class="sb-page-header-content py-5">
                <h1 class="sb-page-header-title">
                    <div class="sb-page-header-title"></div>
                    <span id="title">국내 종합상황판</span>
                </h1>
                <div class="sb-page-header-subtitle" id="content">'코로나19' 국내 종합상황판은 공공데이터 포털의 보건복지부 Open API를 기반으로 합니다.</div>
                <br>

                <div class="sb-page-header-subtitle">최종 업데이트 시간 : ${result.createDt }</div>
                <div class="sb-page-header-subtitle">실시간 시간 : <span id="clock"></span></div>
            </div>
        </div></div>


    <div class="card mb-4">
        <div class="card-header">일간 국내 코로나바이러스 현황표</div>
        <div class="card-body">
            <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                <canvas id="korAreaChart" width="374" height="240" class="chartjs-render-monitor" style="display: block; width: 374px; height: 240px;"></canvas></div>
            <div class="card-footer">해당 자료는 질병관리청의 오전 브리핑을 기준으로 합니다.</div>   </div> </div>

    <!-- 일간 국내 코로나바이러스 현황표 호출 -->
    <script>
        //Set new default font family and font color to mimic Bootstrap's default styling
        (Chart.defaults.global.defaultFontFamily = "Nunito Sans"),
            '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = "#858796";

        function number_format(number, decimals, dec_point, thousands_sep) {
            // *     example: number_format(1234.56, 2, ',', ' ');
            // *     return: '1 234,56'
            number = (number + "").replace(",", "").replace(" ", "");
            var n = !isFinite(+number) ? 0 : +number,
                prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                sep = typeof thousands_sep === "undefined" ? "," : thousands_sep,
                dec = typeof dec_point === "undefined" ? "." : dec_point,
                s = "",
                toFixedFix = function(n, prec) {
                    var k = Math.pow(10, prec);
                    return "" + Math.round(n * k) / k;
                };
            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
            s = (prec ? toFixedFix(n, prec) : "" + Math.round(n)).split(".");
            if (s[0].length > 3) {
                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
            }
            if ((s[1] || "").length < prec) {
                s[1] = s[1] || "";
                s[1] += new Array(prec - s[1].length + 1).join("0");
            }
            return s.join(dec);
        }

        // Area Chart Example
        var ctx = document.getElementById("korAreaChart");
        var myChart = new Chart(ctx, {
            type: "line",
            data: {
                labels: result,


                datasets: [{
                    label: "Earnings",
                    lineTension: 0.3,
                    backgroundColor: "rgba(0, 97, 242, 0.05)",
                    borderColor: "rgba(0, 97, 242, 1)",
                    pointRadius: 3,
                    pointBackgroundColor: "rgba(0, 97, 242, 1)",
                    pointBorderColor: "rgba(0, 97, 242, 1)",
                    pointHoverRadius: 3,
                    pointHoverBackgroundColor: "rgba(0, 97, 242, 1)",
                    pointHoverBorderColor: "rgba(0, 97, 242, 1)",
                    pointHitRadius: 10,
                    pointBorderWidth: 2,
                    data: _decideCnt
                }]
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: "date"
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 25
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 10000,
                            padding: 10
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }]
                },
                legend: {
                    display: false
                },
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    titleMarginBottom: 10,
                    titleFontColor: "#6e707e",
                    titleFontSize: 14,
                    borderColor: "#dddfeb",
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    intersect: false,
                    mode: "index",
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            var datasetLabel =
                                chart.datasets[tooltipItem.datasetIndex].label || "";
                            return "확진자 " +  number_format(tooltipItem.yLabel) +"명" ;
                        }
                    }
                }
            }
        });
    </script>
    <!-- 일간 국내 코로나바이러스 현황표 호출 -->

    <!-- Card Section -->
    <div class="row">
        <div class="col-lg-6 mb-4">
            <div class="card bg-primary text-white shadow">
                <div class="card-body" style="font-weight: bold; font-size:2.0em;">
                    국내 검사중
                    <div class="text-white-50 small"><b>${result.examCnt }명</b></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <div class="card bg-warning text-white shadow">
                <div class="card-body" style="font-weight: bold; font-size:2.0em;">
                    국내 확진환자
                    <div class="text-white-50 small"><b>${result.decideCnt }명(+${result.decideCnt-result2.decideCnt }명)</b></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 mb-4">
            <div class="card bg-info text-white shadow">
                <div class="card-body" style="font-weight: bold; font-size:2.0em;">
                    국내 격리해제
                    <div class="text-white-50 small"><b>${result.clearCnt }명(+${result.clearCnt-result2.clearCnt }명)</b></div>
                </div>
            </div>
        </div>



        <div class="col-lg-6 mb-4">
            <div class="card bg-danger text-white shadow">
                <div class="card-body" style="font-weight: bold; font-size:2.0em;">
                    국내 사망자
                    <div class="text-white-50 small"><b>${result.deathCnt }명(+${result.deathCnt-result2.deathCnt }명)</b></div>
                </div>
            </div>
        </div>
        <br>
    </div>
</c:forEach>
</c:forEach>
<!-- End of Card Section -->


<!-- 국내 확진자 수 차트 작성 시작 -->
    <div id="all">
        <hr /> <br />
        <h3 align="center">국내 총 확진자 수</h3>
        <canvas id="logChart" ></canvas>
        <script>
            var ctx = document.getElementById("logChart");
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: date,
                    datasets: [{
                        label: '확진환자',
                        data: decideCnt, //컨트롤러에서 모델로 받아온다.
                        backgroundColor: getRandomColor(),
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }]
                    }
                }
            });
        </script>
    </div>
<!-- 국내 확진자 수 차트 작성 종료 -->

    <br /><br />

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; LEE YEONGUK, Dept. of Computer Science</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->


<!-- Script File List -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script src="/resource/res/js/dashboard.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resource/res/js/moment.js"></script>
<script src="/resource/res/js/dark-mode-switch.min.js"></script>
<!-- End of Script File List -->


        </main>
    </body>
</html>