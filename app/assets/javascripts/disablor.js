
jQuery(document).ready(function () {

// -------------------- A checkbox in a DIV with class="disablor" will disable and enable INPUT-boxes
// -------------------- in the following DIV with class="disableable"

    $(".disablor").each(function(){
        if ($(this).find("input").is(":checked")){
            $(this).next(".disableable").find("input").attr("readonly","readonly");
        }
    });
    $(document).on("click", ".disablor", function(){
        if ($(this).find("input").is(":checked")){
            $(this).next(".disableable").find("input").attr("readonly","readonly");
        } else {
            $(this).next(".disableable").find("input").removeAttr("readonly");
        }
    });

// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

});