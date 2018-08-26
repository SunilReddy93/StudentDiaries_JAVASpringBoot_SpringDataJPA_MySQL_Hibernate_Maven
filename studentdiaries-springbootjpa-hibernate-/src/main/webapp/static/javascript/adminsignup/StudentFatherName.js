$(document).ready(function(){
//for first name validation to disable/enable submit
    var fathernameValid ={ 
        fathername: false
    };

    function checkValidation(){ 
        // for first name validation to disable/enable submit

        if(fathernameValid.fathername)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }

    $('#fathername').on('input', function(){

        var fathername1 = $(this).val();
        
        if(fathername1.length < 1){
            $('#parafathername').text("Field is Required").show();
            fathernameValid.fathername = false;
            checkValidation();
        }
        else{
            $('#parafathername').hide();
                var testletters = new RegExp(/^[a-zA-Z]+$/);
                if(!testletters.test(fathername1)){
                $('#parafathername').text('Please enter only letters.').show();
                fathernameValid.fathername = false;
                checkValidation();
                }
                else{
                $('#parafathername').hide();
                fathernameValid.fathername = true;
                checkValidation();
        }
        }
        
    })

});