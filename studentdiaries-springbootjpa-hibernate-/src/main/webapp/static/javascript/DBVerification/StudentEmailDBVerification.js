$(document).ready(function(){


    $('#email').on('input', function(){

        var email = $(this).val();

        if(email.length > 2)
        {
            $.ajax({

                url: '/student/email/dbverification',
                data: {email: email},
                type: 'POST',
                success: function (result) {

                    $('#paraemail').html(result);

                }

            })
        }else if(email.length < 1)
        {
            $('#paraemail').html("Field is required");

        }

    });


});