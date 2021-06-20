google.charts.load('current', {'packages':['geochart'], 'mapsApiKey': '[API KEY]'}); // //AIzaSyApamVYeERHfba_-8fgyfsF3L7IdWGBAeY

    google.charts.setOnLoadCallback(drawChart);

    var createDt;

    function drawChart(){

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Country');
    data.addColumn('number', '확진자');
    data.addColumn('number', '사망자');
    $.ajax({
    type:"GET",
    url: "/resource/res/xml/response.xml",
    dataType: "xml",
    success: function (xml){
    $(xml).find("item").each(function(){
    var nationNmEn = $(this).find("nationNmEn").text();
    var temp = $(this).find("natDefCnt").text();
    var temp2 = $(this).find("natDeathCnt").text();
    const temp3 = $(this).find("createDt").text();
    var natDefCnt = parseInt(temp);
    var natDeathCnt = parseInt(temp2);
    createDt = temp3;
    data.addRow([nationNmEn, natDefCnt, natDeathCnt]);
    document.getElementById("update").innerHTML = createDt
});
}
});

    var options = {
        colorAxis: {colors: ['#eae8e8', '#999797', '#ab4332']}
    };
    var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
    chart.draw(data, options);
}
