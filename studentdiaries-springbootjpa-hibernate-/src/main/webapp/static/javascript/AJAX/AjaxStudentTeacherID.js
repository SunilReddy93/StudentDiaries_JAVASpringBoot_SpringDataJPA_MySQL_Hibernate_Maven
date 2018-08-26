$(document).ready(function(){


    $.ajax({

        type: 'GET',
        url: '/ajax/student/teacher/id',
        success: function (data) {
            /*$('#teacher').append(data).selectric();*/

            for (i=0; i<data.length; i++)
            {
                $('#teacher').append('<option value="' + data[i] + '">' + data[i] + '</option>').selectric();
            }
        }

    })





});