$(".black, .white").click(function () {
    if ($(".selected").length != 0) {
        var piece = $(".selected").html();
        $(".selected").empty().toggleClass("selected");
        $(this).text(piece);
    } else if ($(this).html().length != 0){
        $(this).toggleClass("selected");
        $(this).css("background", "");
    }
});
$(".white, .black").mouseenter(function () {
    if (!$(this).hasClass("selected")) {
        $(this).css("background", "#1c82dd");
    }
}).mouseleave(function () {
    $(this).css("background", "");
});


