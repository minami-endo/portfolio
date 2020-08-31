
$(document).on('turbolinks:load', function() {

    $(".skippr-slider").skippr({
        transition : 'fade',
        speed : 2000,
        easing : 'easeOutQuart',
        navType : 'bubble',
        childrenElementType : 'div',
        arrows : false,
        autoPlay : true,
        autoPlayDuration : 5000,
        keyboardOnAlways : true,
        hidePrevious : false
    });
});

