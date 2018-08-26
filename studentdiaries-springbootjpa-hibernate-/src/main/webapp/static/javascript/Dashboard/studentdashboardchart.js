

    $.ajax({
        url: "/student/feedback/scores",
        type: "GET",
        success : function (data) {


            var score = {

                SQLDatefeedbakcdate2: [],
                performance:[],
                attendance:[],
                improvement: [],
                behaviour: []

            };

            var len = data.length;

            for (var i = 0; i < len; i++) {
                
                score.SQLDatefeedbakcdate2[i] = data[i].feedbackDate;

                score.performance[i] = data[i].performance;
                score.behaviour[i] = data[i].behaviour;
                score.improvement[i] = data[i].improvement;
                
            }





            var ctx = $('#myChart');

            var data = {
                labels: score.SQLDatefeedbakcdate2.reverse(),//reverse to display chart flow in asc order
                datasets: [
                    {

                        label: "Performance",
                        data: score.performance.reverse(),
                        backgroundColor: "blue",
                        borderColor: "lightblue",
                        fill: false,
                        lineTension: 0,
                        pointRadius: 10

                    },
                    {

                        label: "Improvement",
                        data: score.improvement.reverse(),
                        backgroundColor: "green",
                        borderColor: "lightgreen",
                        fill: false,
                        lineTension: 0,
                        pointRadius: 10

                    },
                    {

                        label: "Behaviour",
                        data: score.behaviour.reverse(),
                        backgroundColor: "#ff3838",
                        borderColor: "#ff4d4d",
                        fill: false,
                        lineTension: 0,
                        pointRadius: 10

                    }


                ]



            };

            var chart = new Chart(ctx, {
                type: 'line',
                data: data,
                options: {}
            });

        },
        error: function (data) {
            console.log(data);
        }

    });




















