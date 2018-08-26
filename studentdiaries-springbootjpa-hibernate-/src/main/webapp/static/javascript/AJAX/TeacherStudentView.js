$(document).ready(function () {
    $('#view').click(function (event) {
        event.preventDefault();

        var id =$('#table1 input:checkbox:checked').map(function () {
            return $(this).val();
        }).get().join();

        if(id)
        {
            if($('#table1 input:checkbox:checked').length === 1)
            {

                $.ajax({
                    url: '/teacher/student/profile',
                    type: 'POST',
                    data: {id: id},
                    success: function (result) {
                        $('#replaceteachers').html(result);
                    },
                    error: function () {
                        alert('Oops! Something went wrong.');
                    }
                })


            }
            else
            {
                alert("Please select only one user at a time.")
            }

        }
        else
        {
            alert("Please select the user first.");
        }



    })


});