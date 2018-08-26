$(document).ready(function(){

    //for parentphone validation to disable/enable submit
        var formValid = {
            parentphone: false
        };
    
    // for parentphone validation to disable/enable submit
        function checkValidation()
        {
            if(formValid.parentphone)
            {
                $('#signup').removeAttr('disabled');
            }
            else{
                $('#signup').attr('disabled', true);
            }
        }
    
    
    
        $('#parentphone').on('input', function(){
    
            var parentphone = $(this).val();       
            
            if(parentphone.length < 1){
                $('#paraparentphone').text("Field is Required").show();
                formValid.parentphone = false;
                checkValidation();
            }
            else{
                    $('#paraparentphone').hide(); 
    
                    var testdigits = new RegExp(/^[0-9]+$/);
                    if(!testdigits.test(parentphone)){
    
                        $('#paraparentphone').text('Please enter only numbers.').show();
                        formValid.parentphone = false;
                        checkValidation();
                    }
                    else{
                        $('#paraparentphone').hide();
    
                        if(parentphone.length != 10){
                            $('#paraparentphone').text('Phone No. must be of 10 digits.').show();
                            formValid.parentphone = false;
                            checkValidation();
                        }
                        else{
                            $('#paraparentphone').hide();
                            formValid.parentphone = true;
                            checkValidation(); 
                        }
                    }
                
                
                }
    
            
            
            })
    
    });