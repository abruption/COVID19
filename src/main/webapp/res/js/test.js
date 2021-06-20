var ctx = document.getElementById("logChart");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['111', '222'],
        datasets: [{
            data: [123, 456], //컨트롤러에서 모델로 받아온다.
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)'

            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)'

            ],
            borderWidth: 1
        }
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});