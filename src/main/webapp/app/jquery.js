$(".white, .black").mouseenter(function () {
    if (!$(this).hasClass("selected")) {
        $(this).css("background", "#1c82dd");
    }
}).mouseleave(function () {
    $(this).css("background", "");
});


