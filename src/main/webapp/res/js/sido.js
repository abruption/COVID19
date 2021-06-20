google.charts.load('current', {'packages':['geochart'],  'mapsApiKey': '[API KEY]'});
google.charts.setOnLoadCallback(drawChart);


    function drawChart(){

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Country');
    data.addColumn('number', '확진자');
    data.addColumn('number', '사망자');
    $.ajax({
    type:"GET",
    url: "/resource/res/xml/sido.xml",
    dataType: "xml",
    success: function (xml){
    $(xml).find("item").each(function(){
    var gubun = $(this).find("gubun").text();
    var temp = $(this).find("isolClearCnt").text();
    var temp2 = $(this).find("deathCnt").text();
    var isolClearCnt = parseInt(temp);
    var deathCnt = parseInt(temp2);
    data.addRow([gubun, isolClearCnt, deathCnt]);
});
}
});

    var options = {
    region: 'KR',
    displayMode : 'regions',
    enableRegionInteractivity : 'true',
    resolution : 'provinces',
    colorAxis: {colors: ['#eae8e8', '#999797', '#ab4332']},
    backgroundColor: '#FFFFFF',
    datalessRegionColor : '#FFFFFF',
    defaultColor: '#f5f5f5'
};
    var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));
    chart.draw(data, options);
}
