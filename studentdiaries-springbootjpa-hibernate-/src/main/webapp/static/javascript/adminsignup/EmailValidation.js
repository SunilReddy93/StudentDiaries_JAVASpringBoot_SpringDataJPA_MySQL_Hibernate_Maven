$(document).ready(function(){

    var formValid = {
        email: false
    }

    function checkValidation()
    {
        if(formValid.email)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }


    $('#email').on('input', function(){

        var email = $(this).val();

        if(email.length > 4)
        {
            formValid.email = true;
            checkValidation();

        }
        else
        {
            formValid.email = false;
            checkValidation();
        }

    });


});