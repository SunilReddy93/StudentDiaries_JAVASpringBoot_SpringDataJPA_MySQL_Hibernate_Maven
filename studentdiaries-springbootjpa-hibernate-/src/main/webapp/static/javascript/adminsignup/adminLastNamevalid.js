$(document).ready(function(){
    
    //for first name validation to disable/enable submit
    var formValid = { 
        lastname: false
    };
    //for first name validation to disable/enable submit
    function checkValidation()
    {
        if(formValid.lastname)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled',true);
        }
    }
    

    $('#lastname').on('input', function(){

        var lastname = $(this).val();
        
        if(lastname.length < 1){
            $('#paralastname').text("Field is Required").show();
            formValid.lastname = false;
            checkValidation();
        }
        else{
            $('#paralastname').hide();
                var testletters = new RegExp(/^[a-zA-Z]+$/);
                if(!testletters.test(lastname)){
                $('#paralastname').text('Please enter only letters.').show();
                formValid.lastname = false;
                checkValidation();
                }
                else{
                $('#paralastname').hide();
                formValid.lastname = true;
                checkValidation();
        }
        }
        
    })

});