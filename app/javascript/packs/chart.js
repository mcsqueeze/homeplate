import Chart from "chart.js";

const canvas = document.getElementById("earningsChart");

new Chart(canvas, {
    type: 'bar',
    data: {
        labels: ["September", "October", "November", "December"],
        datasets: [{
            label: 'Dirhams',
            data: [1000, 1400, 1250, 1800],
            backgroundColor: [
                '#005792',
                '#005792',
                '#005792',
                '#005792',

            ],
            borderColor: [
                '#005792',
                '#005792',
               '#005792',
                '#005792',
            ],
            borderWidth: 1
        }]
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
