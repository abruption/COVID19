var nationNm2 = "";
var natDefCnt2 = "";
var natDeathCnt2 = "";
var natDeathRate2 = "";

var arr_nationNm2 = [];
var arr_natDefCnt2 = [];
var arr_natDeathCnt2 = [];
var arr_natDeathRate2 = [];
var __tmp = [];
var __tmp2 = [];
var __tmp3 = [];
var __temp = 0;

    $.ajax({
            type:"GET",
            url: "/resource/res/xml/response.xml",
            dataType: "xml",
            success: function(xml){
                $(xml).find("item").each(function(){
                    if($(this).find("areaNm").text().toString() == '아시아'){
                        __temp += 1;      // 아시아 국가 수 체크
                        nationNm2 += $(this).find("nationNm").text().toString() + "/";
                        natDefCnt2 += $(this).find("natDefCnt").text()+ "/";
                        natDeathCnt2 += $(this).find("natDeathCnt").text()+ "/";
                        natDeathRate2 += $(this).find("natDeathRate").text()+ "/";
                    
                        arr_nationNm2 = nationNm2.split("/");
                        __tmp = natDefCnt2.split("/");
                        __tmp2 = natDeathCnt2.split("/");
                        __tmp3 = natDeathRate2.split("/");

                        for(var i=0; i<__temp; i++){
                            arr_natDefCnt2[i] = Number(__tmp[i]);
                            arr_natDeathCnt2[i] = Number(__tmp2[i]);
                            arr_natDeathRate2[i] = Number(__tmp3[i]);
                        }
                    }
                });
        }
    });




    google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawTable);

    $(document).ready(function() {
        $("#Asia").on("click", function() {
            drawTable2();
        });
      });

    function drawTable2() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '국가명');
        data.addColumn('number', '확진자');
        data.addColumn('number', '사망자');
        data.addColumn('number', '확진률 대비 사망률(%)');
    
        for(var i=0; i<__temp; i++)
            data.addRow([arr_nationNm2[i], arr_natDefCnt2[i], arr_natDeathCnt2[i], arr_natDeathRate2[i]]);

        var options = {
            title: 'Asia Area COVID-19  Current State of Affairs',
            colorAxis: {colors: ['yellow', 'red']},
            hAxis: {
                viewWindow: {min: 0, max: 1000000}
            },
            bubble: {textStyle: {
                fontSize: 11
            }}
        };

            var table = new google.visualization.BubbleChart(document.getElementById('Bubble_Asia'));
            table.draw(data, options);
    }