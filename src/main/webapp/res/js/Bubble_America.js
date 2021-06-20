var nationNm3 = "";
var natDefCnt3 = "";
var natDeathCnt3 = "";
var natDeathRate3 = "";

var arr_nationNm3 = [];
var arr_natDefCnt3 = [];
var arr_natDeathCnt3 = [];
var arr_natDeathRate3 = [];
var ___tmp = [];
var ___tmp2 = [];
var ___tmp3 = [];
var ___temp = 0;

    $.ajax({
            type:"GET",
            url: "/resource/res/xml/response.xml",
            dataType: "xml",
            success: function(xml){
                $(xml).find("item").each(function(){
                    if($(this).find("areaNm").text().toString() == '아메리카'){
                        ___temp += 1;      // 국가 수 체크
                        nationNm3 += $(this).find("nationNm").text().toString() + "/";
                        natDefCnt3 += $(this).find("natDefCnt").text()+ "/";
                        natDeathCnt3 += $(this).find("natDeathCnt").text()+ "/";
                        natDeathRate3 += $(this).find("natDeathRate").text()+ "/";
                    
                        arr_nationNm3 = nationNm3.split("/");
                        ___tmp = natDefCnt3.split("/");
                        ___tmp2 = natDeathCnt3.split("/");
                        ___tmp3 = natDeathRate3.split("/");

                        for(var i=0; i<___temp; i++){
                            arr_natDefCnt3[i] = Number(___tmp[i]);
                            arr_natDeathCnt3[i] = Number(___tmp2[i]);
                            arr_natDeathRate3[i] = Number(___tmp3[i]);
                        }
                    }
                });
        }
    });




    google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawTable);

    $(document).ready(function() {
        $("#America").on("click", function() {
            drawTable3();
        });
      });

    function drawTable3() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '국가명');
        data.addColumn('number', '확진자');
        data.addColumn('number', '사망자');
        data.addColumn('number', '확진률 대비 사망률(%)');
    
        for(var i=0; i<___temp; i++)
            data.addRow([arr_nationNm3[i], arr_natDefCnt3[i], arr_natDeathCnt3[i], arr_natDeathRate3[i]]);

        var options = {
            title: 'America Area COVID-19 Current State of Affairs',
            colorAxis: {colors: ['yellow', 'red']},
            hAxis: {
                viewWindow: {min: 0, max: 350000}
            },
            vAxis:{
                
            },
            bubble: {textStyle: {
                fontSize: 11
            }}
        };

            var table = new google.visualization.BubbleChart(document.getElementById('Bubble_America'));
            table.draw(data, options);
    }