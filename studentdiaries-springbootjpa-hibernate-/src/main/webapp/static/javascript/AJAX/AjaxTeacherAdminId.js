$(document).ready(function(){


        $.ajax({

            type: 'GET',
            url: '/teacher/adminid',
            success: function (data) {

                /*$('#adminid').append(data).selectric();*/

                for (i=0; i<data.length; i++) {
                    $('#adminid').append('<option value="' + data[i] + '">' + data[i] + '</option>').selectric();
                }
            }

        })




});