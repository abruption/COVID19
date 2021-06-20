var nationNm__ = "";
var natDefCnt__ = "";
var natDeathCnt__ = "";
var natDeathRate__ = "";

var arr_nationNm__ = [];
var arr_natDefCnt__ = [];
var arr_natDeathCnt__ = [];
var arr_natDeathRate__ = [];
var tmp__ = [];
var tmp2__ = [];
var tmp3__ = [];
var temp__ = 0;

$.ajax({
    type:"GET",
    url: "/resource/res/xml/response.xml",
    dataType: "xml",
    success: function(xml){
        $(xml).find("item").each(function(){
            if($(this).find("areaNm").text().toString() == '오세아니아'){
                temp__ += 1;      //  국가 수 체크
                nationNm__ += $(this).find("nationNm").text().toString() + "/";
                natDefCnt__ += $(this).find("natDefCnt").text()+ "/";
                natDeathCnt__ += $(this).find("natDeathCnt").text()+ "/";
                natDeathRate__ += $(this).find("natDeathRate").text()+ "/";

                arr_nationNm__ = nationNm__.split("/");
                tmp__ = natDefCnt__.split("/");
                tmp2__ = natDeathCnt__.split("/");
                tmp3__ = natDeathRate__.split("/");

                for(var i=0; i<temp__; i++){
                    arr_natDefCnt__[i] = Number(tmp__[i]);
                    arr_natDeathCnt__[i] = Number(tmp2__[i]);
                    arr_natDeathRate__[i] = Number(tmp3__[i]);
                }
            }
        });
    }
});




google.charts.load('current', {'packages':['corechart']});
// google.charts.setOnLoadCallback(drawTable);

$(document).ready(function() {
    $("#Oceania").on("click", function() {
        drawTable6();
    });
});

function drawTable6() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', '국가명');
    data.addColumn('number', '확진자');
    data.addColumn('number', '사망자');
    data.addColumn('number', '확진률 대비 사망률(%)');

    for(var i=0; i<temp_; i++)
        data.addRow([arr_nationNm__[i], arr_natDefCnt__[i], arr_natDeathCnt__[i], arr_natDeathRate__[i]]);

    var options = {
        title: 'Oceania Area COVID-19  Current State of Affairs',
        colorAxis: {colors: ['yellow', 'red']},
        hAxis: {

        },
        bubble: {textStyle: {
                fontSize: 11
            }}
    };

    var table = new google.visualization.BubbleChart(document.getElementById('Bubble_Oceania'));
    table.draw(data, options);
}
