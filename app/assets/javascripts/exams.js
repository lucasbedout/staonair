var f = function() {
    /* Loading state on validation button */
    $('#validate-button').on('click', function () {
        var $btn = $(this).button('loading')
    });
}

$(document).ready(f);
$(document).on('page:load', f);

