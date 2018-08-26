$(document).ready(function(){


    $('#parentemail').on('input', function(){

        var email = $(this).val();

        if(email.length > 3)
        {
            $.ajax({

                url: '/student/parent/email/dbverification',
                data: {email: email},
                type: 'POST',
                success: function (result) {

                    $('#paraparentemail').html(result);

                }

            })
        }else if(email.length < 1)
        {
            $('#paraparentemail').html("Field is required");

        }

    });


});