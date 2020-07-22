$(document).ready(function() {

    $("#submit").click(function(e) {

        var date = $("input[name=date]").val();
        var time = $("input[name=time]").val();
        var category = $("select[name=category]").val();
        var amount = $("input[name=amount]").val();
        var content = $("input[name=content]").val();

        if (date == "" || time == "" || category == "Select" || amount == "" || content == "") {
            alert("All Fields are Required");
            return false;
        }
        e.preventDefault();
        $.post("expenses", {
            "date": $("input[name=date]").val(),
            "time": $("input[name=time]").val(),
            "category": $("select[name=category]").val(),
            "amount": $("input[name=amount]").val(),
            "content": $("input[name=content]").val(),
        }, function(data) {
            if (data["success"]) {
                $("#success-message").removeClass("hide");
                $("#success-message").addClass("show");
                resetForm();
            } else {
                $("#error-message").removeClass("hide");
                $("#error-message").addClass("show");
            }

        });

    });
});

function resetForm() {
    $("#reset").click();
}
