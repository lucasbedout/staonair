var f = function() {
    /* Live notations filtering */
    $("#filter").keyup(function(){

        // Retrieve the input field text
        var filter = $(this).val();

        // Loop through the notation list
        $("#notations-table tr td.idbooster").each(function(){

            // If the list item does not contain the text phrase fade it out
            if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                $(this).parent().fadeOut();

                // Show the list item if the phrase matches
            } else {
                $(this).parent().show();
            }
        });

    });
}

$(document).ready(f);
$(document).on('page:load', f);

