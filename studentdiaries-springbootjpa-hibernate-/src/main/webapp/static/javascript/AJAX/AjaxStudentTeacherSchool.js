$(document).ready(function () {


    $('#teacher').change(function () {

        var id = $(this).val();

        $.ajax({

            type: 'GET',
            data:{id: id},
            url: '/ajax/student/teacher/school',
            success: function (data) {
                /*$('#school').empty().append(data).selectric();*/

                $('#school').empty().append('<option value="' + data + '">' + data + '</option>').selectric();
            }


        })



    })



});