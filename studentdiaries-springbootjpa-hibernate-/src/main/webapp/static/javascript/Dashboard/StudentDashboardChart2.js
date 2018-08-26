



        $.ajax({
            url: "/student/feedback/attendance",
            type: "GET",
            success: function (data) {



                  var present= data['0'];
                  var absent= data['1'];
                  var total = data['2'];

                  var presentpercent = present/total * 100;
                  var absentpercent = absent/total * 100;

                  var ctx = $('#myChart2');

                  var data = {

                      datasets: [
                          {
                              label: "Present%",
                              data: [presentpercent, absentpercent],
                              backgroundColor: ["#1dd1a1", "#ee5253"]

                          }],
                      labels: [

                          'Present%',
                          'Absent%'

                      ]

                  };

                  var chart = new Chart(ctx,{
                      type: "pie",
                      data: data,
                      options:options

                  });





            },
            error: function (data) {
                console.log(data);
            }
        });