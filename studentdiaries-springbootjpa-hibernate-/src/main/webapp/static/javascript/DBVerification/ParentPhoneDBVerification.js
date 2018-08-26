$(document).ready(function () {


    $('#parentphone').on('input', function () {

        var phone = $(this).val();
        var phoneregex = new RegExp(/^[0-9]{10}$/);

        if (phoneregex.test(phone))
        {
            $.ajax({
                url: "/student/parent/phone/dbverification",
                data: {phone: phone},
                type: "POST",

                success: function (data) {

                        $('#parentphoneajax').html(data);
                },
                error: function (data) {
                    console.log(data);
                }


            });

        }
        else
        {
            $('#parentphoneajax').empty();
        }

    });

});


