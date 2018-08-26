$(document).ready(function () {


        $('#adminid').change(function () {

            var id = $(this).val();


            $.ajax({

                type: 'GET',
                data: {adminId: id},
                url: '/teacher/adminschool',
                success: function (result) {
                    $('#school').empty().append('<option value="' + result + '">' + result + '</option>').selectric();

                }
            })

        })




});