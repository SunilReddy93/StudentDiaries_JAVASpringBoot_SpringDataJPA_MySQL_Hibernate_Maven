$(document).ready(function () {


    $('#teacher').change(function () {

        var id = $(this).val();

        $.ajax({

            type: 'GET',
            data:{id: id},
            url: '/ajax/student/teacher/course',
            success: function (data) {
                /*$('#course').empty().append(data).selectric();*/

                $('#course').empty().append('<option value="' + data + '">' + data + '</option>').selectric();
            }


        })



    })



});