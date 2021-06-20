var nationNm_ = "";
var natDefCnt_ = "";
var natDeathCnt_ = "";
var natDeathRate_ = "";

var arr_nationNm_ = [];
var arr_natDefCnt_ = [];
var arr_natDeathCnt_ = [];
var arr_natDeathRate_ = [];
var tmp_ = [];
var tmp2_ = [];
var tmp3_ = [];
var temp_ = 0;

    $.ajax({
            type:"GET",
            url: "/resource/res/xml/response.xml",
            dataType: "xml",
            success: function(xml){
                $(xml).find("item").each(function(){
                    if($(this).find("areaNm").text().toString() == '아프리카'){
                        temp_ += 1;      // 아시아 국가 수 체크
                        nationNm_ += $(this).find("nationNm").text().toString() + "/";
                        natDefCnt_ += $(this).find("natDefCnt").text()+ "/";
                        natDeathCnt_ += $(this).find("natDeathCnt").text()+ "/";
                        natDeathRate_ += $(this).find("natDeathRate").text()+ "/";
                    
                        arr_nationNm_ = nationNm_.split("/");
                        tmp_ = natDefCnt_.split("/");
                        tmp2_ = natDeathCnt_.split("/");
                        tmp3_ = natDeathRate_.split("/");

                        for(var i=0; i<temp_; i++){
                            arr_natDefCnt_[i] = Number(tmp_[i]);
                            arr_natDeathCnt_[i] = Number(tmp2_[i]);
                            arr_natDeathRate_[i] = Number(tmp3_[i]);
                        }
                    }
                });
        }
    });




    google.charts.load('current', {'packages':['corechart']});
    // google.charts.setOnLoadCallback(drawTable);

    $(document).ready(function() {
        $("#Africa").on("click", function() {
            drawTable5();
        });
      });

    function drawTable5() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '국가명');
        data.addColumn('number', '확진자');
        data.addColumn('number', '사망자');
        data.addColumn('number', '확진률 대비 사망률(%)');
    
        for(var i=0; i<temp_; i++)
            data.addRow([arr_nationNm_[i], arr_natDefCnt_[i], arr_natDeathCnt_[i], arr_natDeathRate_[i]]);

        var options = {
            title: 'Africa Area COVID-19  Current State of Affairs',
            colorAxis: {colors: ['yellow', 'red']},
            hAxis: {
                viewWindow: {min: 0, max: 300000}
            },
            bubble: {textStyle: {
                fontSize: 11
            }}
        };

            var table = new google.visualization.BubbleChart(document.getElementById('Bubble_Africa'));
            table.draw(data, options);
    }
