$('.teacherspage').click(function (e) {

    e.preventDefault();

    $('#main-page').load('AdminTeacherUsers.jsp', function() {
        $(this).children(':second').fadeIn('normal');
    })

});