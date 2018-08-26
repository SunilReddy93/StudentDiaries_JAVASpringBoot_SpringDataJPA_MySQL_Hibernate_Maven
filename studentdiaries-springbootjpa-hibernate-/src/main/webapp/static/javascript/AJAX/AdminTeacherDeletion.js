$(document).ready(function () {


    $('#trash').click(function (event) {
        event.preventDefault();

        var id2 =$('.checkitem:checked').map(function () {
            return $(this).val();
        }).get().join();

        if(id2)
        {
            if (confirm("Are you sure you want to delete this?"))
            {
                $.ajax({
                    url: '/admin/teacher/delete',
                    type: 'POST',
                    data:{id2: id2.split(",")},
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