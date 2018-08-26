$(document).ready(function(){

    //to avoid spamming of submit button
    $('#myform').on('submit', function(e){

        if($(this).hasClass('form-submitted'))
        {
            e.preventDefault();
        }
        else{
            $(this).addClass('form-submitted');

            /*
            to disable the inputs and submit button while page is loading
            specially in slow internet
            */
            $('#firstname').attr('readonly', true);
            $('#lastname').attr('readonly', true);
            $('#email').attr('readonly', true);
            $('#phone').attr('readonly', true);
            $('#password').attr('readonly', true);
            $('#school').attr('readonly', true);
            $('#city').attr('readonly', true);
            $('#signup').attr('disabled', true);
        }

    })

    $('#myform2').on('submit', function(e){

        if($(this).hasClass('form-submitted'))
        {
            e.preventDefault();
        }
        else{
            $(this).addClass('form-submitted');
            $('#firstname').attr('readonly', true);
            $('#lastname').attr('readonly', true);
            $('#email').attr('readonly', true);
            $('#phone').attr('readonly', true);
            $('#password').attr('readonly', true);
            $('#adminid').attr('readonly', true);
            $('#course').attr('readonly', true);
            $('#school').attr('readonly', true);
            
            $('#signup').attr('disabled', true);
        }

    })


    $('#myform3').on('submit', function(e){

        if($(this).hasClass('form-submitted'))
        {
            e.preventDefault();
        }
        else{
            $(this).addClass('form-submitted');
            $('#firstname').attr('readonly', true);
            $('#lastname').attr('readonly', true);
            $('#fathername').attr('readonly', true);
            $('#mothername').attr('readonly', true);
            $('#email').attr('readonly', true);
            $('#parentemail').attr('readonly', true);
            $('#phone').attr('readonly', true);
            $('#parentphone').attr('readonly', true);
            $('#password').attr('readonly', true);
            $('#teacher').attr('readonly', true);
            $('#course').attr('readonly', true);
            $('#school').attr('readonly', true);
            $('#year').attr('readonly', true);
            $('#signup').attr('disabled', true);
        }

    })


});