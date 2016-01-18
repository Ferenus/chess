$(".white, .black").mouseenter(function () {
    if (!$(this).hasClass("selected")) {
        $(this).addClass("mouseon");
    }
}).mouseleave(function () {
    $(this).removeClass("mouseon");
});


