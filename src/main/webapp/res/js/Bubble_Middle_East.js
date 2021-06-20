var nationNm4 = "";
var natDefCnt4 = "";
var natDeathCnt4 = "";
var natDeathRate4 = "";

var arr_nationNm4 = [];
var arr_natDefCnt4 = [];
var arr_natDeathCnt4 = [];
var arr_natDeathRate4 = [];
var ____tmp = [];
var ____tmp2 = [];
var ____tmp3 = [];
var ____temp = 0;

    $.ajax({
            type:"GET",
            url: "/resource/res/xml/response.xml",
            dataType: "xml",
            success: function(xml){
                $(xml).find("item").each(function(){
                    if($(this).find("areaNm").text().toString() == '중동'){
                        ____temp += 1;      // 국가 수 체크
                        nationNm4 += $(this).find("nationNm").text().toString() + "/";
                        natDefCnt4 += $(this).find("natDefCnt").text()+ "/";
                        natDeathCnt4 += $(this).find("natDeathCnt").text()+ "/";
                        natDeathRate4 += $(this).find("natDeathRate").text()+ "/";
                    
                        arr_nationNm4 = nationNm4.split("/");
                        ____tmp = natDefCnt4.split("/");
                        ____tmp2 = natDeathCnt4.split("/");
                        ____tmp3 = natDeathRate4.split("/");

                        for(var i=0; i<____temp; i++){
                            arr_natDefCnt4[i] = Number(____tmp[i]);
                            arr_natDeathCnt4[i] = Number(____tmp2[i]);
                            arr_natDeathRate4[i] = Number(____tmp3[i]);
                        }
                    }
                });
        }
    });




    google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawTable);

    $(document).ready(function() {
        $("#MiddleEast").on("click", function() {
            drawTable4();
        });
      });

    function drawTable4() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '국가명');
        data.addColumn('number', '확진자');
        data.addColumn('number', '사망자');
        data.addColumn('number', '확진률 대비 사망률(%)');
    
        for(var i=0; i<____temp; i++)
            data.addRow([arr_nationNm4[i], arr_natDefCnt4[i], arr_natDeathCnt4[i], arr_natDeathRate4[i]]);

        var options = {
            title: 'Middle East Area COVID-19 Current State of Affairs',
            colorAxis: {colors: ['yellow', 'red']},
            hAxis: {
                viewWindow: {min: 0, max: 1000000}
            },
            bubble: {textStyle: {
                fontSize: 11
            }}
        };

            var table = new google.visualization.BubbleChart(document.getElementById('Bubble_Middle_East'));
            table.draw(data, options);
    }