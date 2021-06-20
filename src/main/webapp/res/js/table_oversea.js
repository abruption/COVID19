var nationNm = "";
var natDefCnt = "";
var natDeathCnt = "";
var natDeathRate = "";

var arr_nationNm = [];
var arr_natDefCnt = [];
var arr_natDeathCnt = [];
var arr_natDeathRate = [];
var tmp = [];
var tmp2 = [];
var tmp3 = [];
var temp;

$.ajax({
    type:"GET",
    url: "/resource/res/xml/response.xml",
    dataType: "xml",
    success: function(xml){
        $(xml).find("item").each(function(){
            temp = $(xml).find("item").length;
            nationNm += $(this).find("nationNm").text().toString() + "/";
            natDefCnt += $(this).find("natDefCnt").text()+ "/";
            natDeathCnt += $(this).find("natDeathCnt").text()+ "/";
            natDeathRate += $(this).find("natDeathRate").text()+ "/";

            arr_nationNm = nationNm.split("/");
            tmp = natDefCnt.split("/");
            tmp2 = natDeathCnt.split("/");
            tmp3 = natDeathRate.split("/");

            for(var i=0; i<temp; i++){
                arr_natDefCnt[i] = Number(tmp[i]);
                arr_natDeathCnt[i] = Number(tmp2[i]);
                arr_natDeathRate[i] = Number(tmp3[i]);
            }
        });
    }
});




google.charts.load('current', {'packages':['table']});
google.charts.setOnLoadCallback(drawTable);


function drawTable() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', '국가');
    data.addColumn('number', '확진자');
    data.addColumn('number', '사망자');
    data.addColumn('number', '확진률 대비 사망률(%)');

    for(var i=0; i<temp; i++)
        data.addRow([arr_nationNm[i], arr_natDefCnt[i], arr_natDeathCnt[i], arr_natDeathRate[i]]);

    var options = {
        sortColumn: 1,
        sortAscending: false,
        showRowNumber: true,
        page: 'enable',
        pageSize: 20,
        width: '100%',
        height: '100%'
    };

    var table = new google.visualization.Table(document.getElementById('table_div'));
    table.draw(data, options);
}