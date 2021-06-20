<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<script>
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
    <c:forEach var="result" items="${test}" varStatus="status">
    date.push("${result.Date}");
    decideCnt.push("${result.decideCnt}");
    </c:forEach>

    var _date = date.slice(-5);
    var _decideCnt = decideCnt.slice(-6);

    for(var i=0; i<6; i++){
        result[i] = _date[i].substring(4, 6) + '월 ' + _date[i].substring(6, 8) + '일';
    }
</script>

<script>
    const temp = decideCnt.slice(1);
    const compare1 = new Array();
    const compare2 = new Array();
    const compare3 = new Array();
    for(var j=0; j<temp.length; j++){
        compare2[j] = temp[j+1] - temp[j];
    }
    for(var m=0; m<date.length; m++){
        compare3[m] = date[m].substring(4, 6) + '월 ' + date[m].substring(6, 8) + '일';
    }


</script>
<body>
<c:forEach var="getVaccine" items="${vaccine}" varStatus="status">
<div class="card text-center">
    <div class="card-body">
        <div class="col">1차 접종자 (${getVaccine.baseDate} 기준)</div>
        <div class="col">2차 접종자 (${getVaccine.baseDate} 기준)</div>
        <div class="col">${getVaccine.totalFirstCnt}명(+${getVaccine.firstCnt}명)</div>
        <div class="col">${getVaccine.totalSecondCnt}명(+${getVaccine.secondCnt}명)</div>
    </div>
</div>
</c:forEach>

<br /> <hr />

<div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
    <canvas id="korAreaChart" width="374" height="240" class="chartjs-render-monitor" style="display: block; width: 374px; height: 240px;"></canvas></div>
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
            }
            ]
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

<canvas id="MixedChart"></canvas>
<script>
    var ctx = document.getElementById("MixedChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '국내 확진자 수',
                data: compare2,
                borderColor: "rgba(255, 201, 14, 0.5)",
                backgroundColor: "rgba(255, 201, 14, 1)",
                fill: false
                // Changes this dataset to become a line

            }],
            labels:compare3,
        },
        options:{
            reponsive: true,
            title: {
                display: true,
                text: 'Line + Bar 차트 테스트'
            },
            hover: {
                mode: 'nearset',
                intersect: false,
            }
        }
    });
</script>
</body>
</html>