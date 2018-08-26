var count = $('#count');
var countMax = parseInt(count.attr('data-max'), 10);

var current = 0;

var updateCount = function () {
    current += 5000;
    count.html(current.toLocaleString());
    updateTick();

};

var updateTick = function () {
    if (current < countMax)
    {
        requestAnimationFrame(updateCount);
    }
    else
    {
        count.html(countMax.toLocaleString())
    }
};

updateCount();
