var nationNm1 = "";
var natDefCnt1 = "";
var natDeathCnt1 = "";
var natDeathRate1 = "";

var arr_nationNm1 = [];
var arr_natDefCnt1 = [];
var arr_natDeathCnt1 = [];
var arr_natDeathRate1 = [];
var _tmp = [];
var _tmp2 = [];
var _tmp3 = [];
var _temp = 0;

    $.ajax({
            type:"GET",
            url: "/resource/res/xml/response.xml",
            dataType: "xml",
            success: function(xml){
                $(xml).find("item").each(function(){
                    if($(this).find("areaNm").text().toString() == '유럽'){
                        _temp += 1;      // 아시아 국가 수 체크
                        nationNm1 += $(this).find("nationNm").text().toString() + "/";
                        natDefCnt1 += $(this).find("natDefCnt").text()+ "/";
                        natDeathCnt1 += $(this).find("natDeathCnt").text()+ "/";
                        natDeathRate1 += $(this).find("natDeathRate").text()+ "/";
                    
                        arr_nationNm1 = nationNm1.split("/");
                        _tmp = natDefCnt1.split("/");
                        _tmp2 = natDeathCnt1.split("/");
                        _tmp3 = natDeathRate1.split("/");

                        for(var i=0; i<_temp; i++){
                            arr_natDefCnt1[i] = Number(_tmp[i]);
                            arr_natDeathCnt1[i] = Number(_tmp2[i]);
                            arr_natDeathRate1[i] = Number(_tmp3[i]);
                        }
                    }
                });
        }
    });




    google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawTable);

    $(document).ready(function() {
        $("#Europe").on("click", function() {
            drawTable1();
        });
      });

    function drawTable1() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '국가명');
        data.addColumn('number', '확진자');
        data.addColumn('number', '사망자');
        data.addColumn('number', '확진률 대비 사망률(%)');
    
        for(var i=0; i<_temp; i++)
            data.addRow([arr_nationNm1[i], arr_natDefCnt1[i], arr_natDeathCnt1[i], arr_natDeathRate1[i]]);

        var options = {
            title: 'Europe Area COVID-19  Current State of Affairs',
            colorAxis: {colors: ['yellow', 'red']},
            hAxis: {
                viewWindow: {min: 0, max: 1000000}
            },
            bubble: {textStyle: {
                fontSize: 11
            }}
        };

            var table = new google.visualization.BubbleChart(document.getElementById('Bubble_Europe'));
            table.draw(data, options);
    }