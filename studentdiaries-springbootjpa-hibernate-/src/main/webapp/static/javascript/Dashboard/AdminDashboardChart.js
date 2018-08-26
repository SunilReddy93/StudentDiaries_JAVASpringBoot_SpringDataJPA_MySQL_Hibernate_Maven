

$.ajax({
    url: "/admin/teacher/score",
    type: "GET",
    success : function (data) {


        var score = {

            feedbackteacherId: [],
            performance:[],
            improvement: [],
            behaviour: []

        };

        var len = data.length;

        for (var i = 0; i < len; i++) {

            score.performance[i] = data[i]['0'];
            score.behaviour[i] = data[i]['1'];
            score.improvement[i] = data[i]['2'];
            score.feedbackteacherId[i] = data[i]['3'];

        }





        var ctx = $('#myChart');

        var data = {
            labels: score.feedbackteacherId,
            datasets: [
                {

                    label: "Performance",
                    data: score.performance,
                    backgroundColor: "blue",
                    borderColor: "lightblue",
                    fill: false,
                    lineTension: 0,
                    pointRadius: 10

                },
                {

                    label: "Improvement",
                    data: score.improvement,
                    backgroundColor: "green",
                    borderColor: "lightgreen",
                    fill: false,
                    lineTension: 0,
                    pointRadius: 10

                },
                {

                    label: "Behaviour",
                    data: score.behaviour,
                    backgroundColor: "#ff3838",
                    borderColor: "#ff4d4d",
                    fill: false,
                    lineTension: 0,
                    pointRadius: 10

                }


            ]



        };


        var options = {

          title:{
              display: true,
              position: "bottom",
              text: "Line Graph indicating overall performance of maximum 10 Teacher IDs' students. Score is out of 10.",
              fontSize: 16,
              fontColor: "#333"
          }


        };

        var chart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: options
        });

    },
    error: function (data) {
        console.log(data);
    }

});