$(document).ready(function(){

    //for rollno validation to disable/enable submit
        var formValid = {
            rollno: false
        };
    
    // for rollno validation to disable/enable submit
        function checkValidation()
        {
            if(formValid.rollno)
            {
                $('#signup').removeAttr('disabled');
            }
            else{
                $('#signup').attr('disabled', true);
            }
        }
    
    
    
        $('#rollno').on('input', function(){
    
            var rollno = $(this).val();       
            
            if(rollno.length < 1){
                $('#pararollno').text("Field is Required").show();
                formValid.rollno = false;
                checkValidation();
            }
            else{
                    $('#pararollno').hide(); 
    
                    var testdigits = new RegExp(/^[0-9]+$/);
                    if(!testdigits.test(rollno)){
    
                        $('#pararollno').text('Please enter only numbers.').show();
                        formValid.rollno = false;
                        checkValidation();
                    }
                    else{
                        $('#pararollno').hide();
    
                        if(rollno.length > 3){
                            $('#pararollno').text('Rollno No. can be of max 3 digits.').show();
                            formValid.rollno = false;
                            checkValidation();
                        }
                        else{
                            $('#pararollno').hide();
                            formValid.rollno = true;
                            checkValidation(); 
                        }
                    }
                
                
                }
    
            
            
            })
    
    });