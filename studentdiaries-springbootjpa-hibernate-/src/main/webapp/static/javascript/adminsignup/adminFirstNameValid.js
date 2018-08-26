$(document).ready(function(){

    var firstnameValid ={ //for first name validation to disable/enable submit
        firstname: false
    };

    function checkValidation(){ 
        // for first name validation to disable/enable submit

        if(firstnameValid.firstname)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }

    $('#firstname').on('input', function(){

        var firstname1 = $(this).val();
        
        if(firstname1.length < 1){
            $('#parafirstname').text("Field is Required").show();
            firstnameValid.firstname = false;
            checkValidation();
        }
        else{
            $('#parafirstname').hide();
                var testletters = new RegExp(/^[a-zA-Z]+$/);
                if(!testletters.test(firstname1)){
                $('#parafirstname').text('Please enter only letters.').show();
                firstnameValid.firstname = false;
                checkValidation();
                }
                else{
                $('#parafirstname').hide();
                firstnameValid.firstname = true;
                checkValidation();
        }
        }
        
    })

});