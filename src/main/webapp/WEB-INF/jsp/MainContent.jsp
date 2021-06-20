<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>코로나 인포 | 국내외 확진자 정보 제공</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

<script>
setInterval("go_time()", 1000);
function go_time(){

	 var now = new Date();

	 var year = now.getFullYear(); //년
	 var month = now.getMonth()+1; //월
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

	 document.getElementById("clock").innerHTML
	 = year+"-"+ month+"-"+day+" "+hour+":"+min+":"+sec
}
</script>
<script>
	var date = new Array();
	var decideCnt = new Array();
	var result = new Array();
	<c:forEach var="result" items="${getCount}" varStatus="status">
	date.push("${result.Date}");
	decideCnt.push("${result.decideCnt}");
	</c:forEach>

	var _date = date.slice(-5);
	var _decideCnt = decideCnt.slice(-6);
	var __decideCnt = decideCnt.slice(-5);

	for(var i=0; i<6; i++){
		result[i] = _date[i].substring(4, 6) + '월 ' + _date[i].substring(6, 8) + '일';
	}

</script>

<script>
	const compare1 = new Array();
	const compare2 = new Array();
	for(var j=0; j<_decideCnt.length; j++){
		compare1[j] = _decideCnt[j+1] - _decideCnt[j];
	}
	for(var m=0; m<_date.length; m++){
		compare2[m] = _date[m].substring(4, 6) + '월 ' + _date[m].substring(6, 8) + '일';
	}
</script>

<c:forEach var="result" items="${TodayList}" varStatus="status">

<!-- Main Content Area -->
<body>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	<div class="sb-page-header pb-10 sb-page-header-dark bg-gradient-primary-to-secondary">
		<div class="container-fluid">
		<div class="sb-page-header-content py-5">
		<h1 class="sb-page-header-title">
		<div class="sb-page-header-title"></div>
		<span id="title">국내 종합상황판</span>
		</h1>
	<div class="sb-page-header-subtitle" id="content">'코로나19' 국내 종합상황판은 공공데이터활용지원센터_보건복지부 코로나19 감염 현황 Open API를 기반으로 합니다.</div>
	<br>
	
	<div class="sb-page-header-subtitle">최종 업데이트 시간 : ${result.createDt }</div>
	<div class="sb-page-header-subtitle">실시간 시간 : <span id="clock"></span></div>
	</div>
	</div></div>
	
	
	<div class="card mb-4">   
    <div class="card-header">국내 코로나 확진자 추이 현황</div>
     <div class="card-body">
      <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
      <canvas id="korAreaChart" width="374" height="240" class="chartjs-render-monitor" style="display: block; width: 374px; height: 240px;"></canvas></div>
       <div class="card-footer">해당 자료는 공공데이터활용지원센터_보건복지부 코로나19 감염 현황 Open API를 기반으로 합니다.</div>   </div> </div>

	<div class="card mb-4">
		<div class="card-header">국내 일간 신규 확진자 수</div>
		<div class="card-body">
	<div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
		<canvas id="decideCntChart" width="374" height="240" class="chartjs-render-monitor" style="display: block; width: 374px; height: 240px;"></canvas></div>
	<div class="card-footer">해당 자료는 공공데이터활용지원센터_보건복지부 코로나19 감염 현황 Open API를 기반으로 합니다.</div>   </div> </div>
	
		<!-- Chart.js Call -->
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
					data: __decideCnt
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
							maxTicksLimit: 3,
							padding: 10,
							// Include a dollar sign in the ticks
							callback: function(value, index, values) {
								return  number_format(value) +"명";
							}
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
	<script>
		var ctx = document.getElementById("decideCntChart");
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				datasets: [{
					type: 'bar',
					label: '국내 확진자 수',
					data: compare1,
					borderColor: "rgba(255, 201, 14, 0.5)",
					backgroundColor: "rgba(255, 201, 14, 1)",
					fill: false
					// Changes this dataset to become a line

				}],
				labels:compare2,
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
							maxTicksLimit: 5,
							padding: 10,
							// Include a dollar sign in the ticks
							callback: function(value, index, values) {
								return  number_format(value) +"명";
							}
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
						label: function (tooltipItem, chart) {
							var datasetLabel =
									chart.datasets[tooltipItem.datasetIndex].label || "";
							return "확진자 " + number_format(tooltipItem.yLabel) + "명";
						}
					}
				}
			}
		});
	</script>
		<!-- End of Chart.js -->

<c:forEach var="result2" items="${YesterdayList}" varStatus="status">
<!-- Card Section -->
<!-- <h2>Card Section</h2> -->
	<div class="row">
		<div class="col-lg-6 mb-4">
			<div class="card bg-secondary text-white shadow">
				<div class="card-body" style="font-weight: bold; font-size:2.0em;">
					국내 검사진행
					<div class="text-white-50 small"><b>${result.examCnt }명</b></div>
				</div>
			</div>
		</div>

		<div class="col-lg-6 mb-4">
			<div class="card bg-primary text-white shadow">
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


	<c:forEach var="getVaccine" items="${getVaccine}" varStatus="status">
	<div class="col-lg-6 mb-4">
		<div class="card bg-warning text-white shadow">
			<div class="card-body" style="font-weight: bold; font-size:2.0em;">
				백신 1차 접종자 수
				<div class="text-white-50 small"><b>${getVaccine.totalFirstCnt}명(+${getVaccine.firstCnt}명)</b></div>
			</div>
		</div>
	</div>
	<br>


	<div class="col-lg-6 mb-4">
		<div class="card bg-success text-white shadow">
			<div class="card-body" style="font-weight: bold; font-size:2.0em;">
				백신 2차 접종자 수
				<div class="text-white-50 small"><b>${getVaccine.totalSecondCnt}명(+${getVaccine.secondCnt}명)</b></div>
			</div>
		</div>
	</div>
	</div>
	<br>

	<hr/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['geochart'],
			'mapsApiKey': '[API KEY]'
		});
		google.charts.setOnLoadCallback(drawChart);


		function drawChart(){

			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Country');
			data.addColumn('number', '확진자');
			data.addColumn('number', '사망자');
			$.ajax({
				type:"GET",
				url: "/resource/res/xml/sido.xml",
				dataType: "xml",
				success: function (xml){
					$(xml).find("item").each(function(){
						var gubun = $(this).find("gubun").text();
						var temp = $(this).find("isolClearCnt").text();
						var temp2 = $(this).find("deathCnt").text();
						var isolClearCnt = parseInt(temp);
						var deathCnt = parseInt(temp2);
						data.addRow([gubun, isolClearCnt, deathCnt]);
					});
				}
			});

			var options = {
				region: 'KR',
				displayMode : 'regions',
				enableRegionInteractivity : 'true',
				resolution : 'provinces',
				colorAxis: {colors: ['#eae8e8', '#999797', '#ab4332']},
				backgroundColor: '#FFFFFF',
				datalessRegionColor : '#FFFFFF',
				defaultColor: '#f5f5f5'
			};
			var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
			chart.draw(data, options);
		}
	</script>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new Date()) + " 00:00:00";
%>

	<div class="slide" align="center">
		<h3>대한민국 시/도별 현황</h3> <br />
		<div style="color: lightslategray">총 확진자 : ${result.decideCnt}명, 사망 : ${result.deathCnt}명, 격리해제 : ${result.clearCnt}명</div>
		<div style="color: lightslategray">질병관리청 <%=today%> 집계 기준</div> <br/><br/>
		<div id="regions_div" style="width: 900px; height: 500px;"></div> <br /><br />
	</div>
	<br /><br /><hr />


	<div class="slide" align="center">
		<h3>대한민국 시/도별 백신 접종 현황</h3> <br />
		<div style="color: lightslategray">백신 1차 총 접종자 수 : ${getVaccine.totalFirstCnt}명, 백신 2차 총 접종자 수 : ${getVaccine.totalSecondCnt}명</div>
		<div style="color: lightslategray">질병관리청 <%=today%> 집계 기준</div> <br/><br/>
		<div id="vaccine_div" style="width: 900px; height: 500px;"></div> <br /><br />
		<script src="/resource/res/js/vaccine.js" />
	</div>
	<br /><br />


	</c:forEach>
	</c:forEach>
	</c:forEach>
<!-- End of Card Section -->


</body>
</html>