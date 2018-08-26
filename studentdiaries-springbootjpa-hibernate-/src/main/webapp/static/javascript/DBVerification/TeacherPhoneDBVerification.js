$(document).ready(function () {


    $('#phone').on('input', function () {

        var phone = $(this).val();
        var phoneregex = new RegExp(/^[0-9]{10}$/);

        if (phoneregex.test(phone))
        {
            $.ajax({
                url: "/teacher/phone/dbverification",
                data: {phone: phone},
                type: "POST",

                success: function (data) {


                        $('#phoneajax').html(data);

                },
                error: function (data) {
                    console.log(data);
                }


            });
        }
        else
        {
            $('#phoneajax').empty();
        }

    });

});


