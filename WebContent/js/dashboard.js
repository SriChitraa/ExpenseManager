$(document).ready(function() {

    $.getJSON("expense-summary", function(dataPoints) {
        var chart = new CanvasJS.Chart("chartContainer", {
            theme: "light2",
            animationEnabled: true,
            exportFileName: "Expense by category",
            exportEnabled: true,
            title: {
                text: "Categories"
            },
            data: [{
                type: "pie",
                showInLegend: true,
                legendText: "{category}",
                toolTipContent: "{category}: <strong>{y}</strong>",
                indexLabel: "{category} {y}",
                dataPoints: dataPoints
            }]
        });
        chart.render();
    });
});