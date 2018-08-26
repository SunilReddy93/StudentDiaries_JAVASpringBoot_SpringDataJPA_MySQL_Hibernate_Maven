$(document).ready(function(){

    //for Password validation to disable/enable submit
    var formValid = {
        password: false
    };
    //for Password validation to disable/enable submit
    function checkValidation(){

        if(formValid.password)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }

    
    $('#password').on('input', function(){
        var password = $(this).val();

        if(password.length < 1){
            $('#parapassword').text("Field is Required").css('color', 'red').show();
            formValid.password = false;
            checkValidation();
        }
        else if(password.length < 6)
        {
            $('#parapassword').text('Weak. Must have atleast 6 characters').css('color', 'red').show();
            formValid.password = false;
            checkValidation();
        }
        else if(password.length < 8)
        {
            $('#parapassword').text('Medium').css('color', 'orange').show();
            formValid.password = true;
            checkValidation();
        }
        else if(password.length < 10)
        {
            $('#parapassword').text('Strong').css('color', '#27ae60').show();
            formValid.password = true;
            checkValidation();
        }
        else if(password.length > 15)
        {
            $('#parapassword').text('Too long. Password can be only 15 characters.').css('color', 'red').show();
            formValid.password = false;
            checkValidation();
        }
    })



});