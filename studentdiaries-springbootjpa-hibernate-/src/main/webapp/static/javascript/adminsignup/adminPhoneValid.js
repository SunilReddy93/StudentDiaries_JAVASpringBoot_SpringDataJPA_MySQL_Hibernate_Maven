$(document).ready(function(){

//for Phone validation to disable/enable submit
    var formValid = {
        phone: false
    };

// for Phone validation to disable/enable submit
    function checkValidation()
    {
        if(formValid.phone)
        {
            $('#signup').removeAttr('disabled');
        }
        else{
            $('#signup').attr('disabled', true);
        }
    }



    $('#phone').on('input', function(){

        var phone = $(this).val();       
        
        if(phone.length < 1){
            $('#paraphone').text("Field is Required").show();
            formValid.phone = false;
            checkValidation();
        }
        else{
                $('#paraphone').hide(); 

                var testdigits = new RegExp(/^[0-9]+$/);
                if(!testdigits.test(phone))
                {

                   $('#paraphone').text('Please enter only numbers.').show();

                    formValid.phone = false;
                    checkValidation();
                }
                else if(phone.length != 10)
                {
                    $('#paraphone').hide();


                    $('#paraphone').text('Phone No. must be of 10 digits.').show();
                    formValid.phone = false;
                    checkValidation();

                }
                else
                {
                        $('#paraphone').hide();
                        formValid.phone = true;
                        checkValidation();
                }

            
            
            }

        
        
        })

});