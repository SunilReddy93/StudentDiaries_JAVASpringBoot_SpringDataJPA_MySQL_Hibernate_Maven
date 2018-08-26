$(document).ready(function () {
    $('#trash').click(function (event) {
        event.preventDefault();

        var id =$('.checkitem:checked').map(function () {
            return $(this).val();
        }).get().join();

        if(id)
        {
            if (confirm("Are you sure you want to delete this?"))
            {
                $.ajax({
                    url: '/admin/student/delete',
                    type: 'POST',
                    data:{id: id.split(",")},
                    traditional: true,
                    success: function (result) {
                        $('tbody').html(result);
                    },
                    error: function () {
                        alert('Error while deletion. Please try again.');
                    }
                })

            }
            else
            {
                return false;
            }

        }
        else
        {
            alert("Please select the user first.");
        }



    })


});