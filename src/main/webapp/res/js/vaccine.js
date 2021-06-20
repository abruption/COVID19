google.charts.load('current', {'packages':['geochart'], 'mapsApiKey': '[API KEY]'});
google.charts.setOnLoadCallback(drawChart);

let today = new Date();
let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let day = today.getDate();  // 날짜

if (month < 10)
    month = "0" + month;
if (day < 10)
    day = "0" + day;

var result = year + '-' + month + '-' + day + ' 00:00:00';

console.log(result);

function drawChart(){
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Country');
    data.addColumn('number', '1차 접종자');
    data.addColumn('number', '2차 접종자');

    $.ajax({
        type:"GET",
        url: "/resource/res/xml/vaccine.json",
        dataType: "json",
        success: function (json){
            for(var i=0; i<json.currentCount; i++){
                if(json.data[i].baseDate == result){
                    data.addRow([json.data[i].sido, json.data[i].firstCnt, json.data[i].secondCnt]);
                    // alert("데이터 기준 일 : " + json.data[i].baseDate);
                    // alert("지역 : " + json.data[i].sido);
                    // alert("1차 접종자 수 : " + json.data[i].firstCnt);
                    // alert("2차 접종자 수 : " + json.data[i].secondCnt);
                }
            }
        },
        error:function() {
            alert('Error 발생');
        }
    });

    var options = {
        region: 'KR',
        displayMode : 'regions',
        enableRegionInteractivity : 'true',
        resolution : 'provinces',
        colorAxis: {colors: ['#fff7f7', '#b3eeb3', '#84ec3f']},
        backgroundColor: '#FFFFFF',
        datalessRegionColor : '#FFFFFF',
        defaultColor: '#f5f5f5'
    };
    var chart = new google.visualization.GeoChart(document.getElementById('vaccine_div'));
    chart.draw(data, options);
}