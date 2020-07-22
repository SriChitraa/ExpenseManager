$(document).ready(function() {  
	var category = "All";
	var date = new Date();
	var startDate = new Date(date.getFullYear(), date.getMonth(), 1);
	var endDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	$("#startDate").val(formatDate(startDate));
	$("#endDate").val(formatDate(endDate));
	$("#category").val(category);
	loadDataTable(category,formatDate(startDate),formatDate(endDate));
	
	$("#search").click(function(e){
		e.preventDefault();
		search();
		return false;
	});

});
	
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
function search(){
	var userId = "1";
	var category = $('#category').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	loadDataTable(category,startDate,endDate);
}

function loadDataTable(category,startDate,endDate) {
	$('#example').DataTable({
        "ajax": "http://localhost:8081/ExpenseManager/expenses?category="+category+"&startDate="+startDate+"&endDate="+endDate+"",
        "columns": [
        	{ "data": "date" },
        	{ "data": "time" },
        	{ "data": "category" },
            { "data": "amount" },
            { "data": "content" }
        ],
        "bFilter": false,
        "bInfo": false,
        "destroy": true,
    });
}