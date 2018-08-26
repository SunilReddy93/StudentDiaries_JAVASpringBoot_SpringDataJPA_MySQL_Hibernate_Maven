



$.ajax({
    url: "/teacher/pie/score",
    type: "GET",
    success: function (data) {


        var goodstudents= parseInt(data['0']);
        var averagestudents= parseInt(data['1']);
        var total= parseInt(data['2']);

        var poorstudents = total - (goodstudents + averagestudents) ;

        var goodstudentspercent = goodstudents/total * 100;
        var averagestudentspercent = averagestudents/total * 100;
        var poorstudentspercent = poorstudents/total * 100;

        var ctx = $('#myChart');

        var data = {

            datasets: [
                {

                    data: [goodstudentspercent.toFixed(2), averagestudentspercent.toFixed(2), poorstudentspercent.toFixed(2)], //toFixed is used to set precision to 2 decimal
                    backgroundColor: ["#1dd1a1", "#fdcb6e", "#ee5253"]

                }],
            labels: [

                'Good Performing Students%',
                'Average Performing Students%',
                'Poor Performing Students%'

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