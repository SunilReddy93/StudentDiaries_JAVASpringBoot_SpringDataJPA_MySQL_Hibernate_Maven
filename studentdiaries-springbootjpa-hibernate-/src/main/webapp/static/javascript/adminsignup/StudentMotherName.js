$(document).ready(function(){

    var mothernameValid ={ //for first name validation to disable/enable submit
        mothername: false
    };

    function checkValidation(){ 
        // for first name validation to disable/enable submit

        if(mothernameValid.mothername)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }

    $('#mothername').on('input', function(){

        var mothername1 = $(this).val();
        
        if(mothername1.length < 1){
            $('#paramothername').text("Field is Required").show();
            mothernameValid.mothername = false;
            checkValidation();
        }
        else{
            $('#paramothername').hide();
                var testletters = new RegExp(/^[a-zA-Z]+$/);
                if(!testletters.test(mothername1)){
                $('#paramothername').text('Please enter only letters.').show();
                mothernameValid.mothername = false;
                checkValidation();
                }
                else{
                $('#paramothername').hide();
                mothernameValid.mothername = true;
                checkValidation();
        }
        }
        
    })

});