<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Muli" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/static/mycss/style.css">
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/panda.ico" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>



    <title>Welcome to StudentDiaries</title>
</head>
<body oncontextmenu="return false;">

<!-- HEADER -->
<header id="main-header">

    <nav class="navbar navbar-expand-md navbar-light bg-white fixed-top">
        <a class="navbar-brand" href="/index"><span>Student</span>Diaries</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about/#services">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about/#contact">Contact Us</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="/admin/login">Admin</a>
                        <a class="dropdown-item" href="/teacher/login">Teacher</a>
                        <a class="dropdown-item" href="/student/login">Student</a>
                    </div>
                </li>
            </ul>

        </div>
    </nav>

</header>


<!--CAROUSAL-->
<section id="carousel">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 ">
                <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval = 4000>
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="first-slide img-fluid w-100" src="/static/images/pic1_3.jpg" alt="First slide">
                            <div class="container">
                                <div class="carousel-caption text-right caption">
                                    <h3>Welcome to StudentDiaries.</h3>

                                    <p><a class="btn btn-lg btn-primary" href="/signup" role="button">Sign up today</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="second-slide img-fluid w-100" src="/static/images/pic1_4.jpg" alt="Second slide">
                            <div class="container">
                                <div class="carousel-caption text-right caption">
                                    <h3>Business Solutions.</h3>

                                    <p><a class="btn btn-lg btn-primary" href="AboutUs.jsp" role="button">Learn more</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="third-slide img-fluid w-100" src="/static/images/pic1_7.jpg" alt="Third slide">
                            <div class="container">
                                <div class="carousel-caption text-right caption">
                                    <h3>Education Solutions</h3>

                                    <p><a class="btn btn-lg btn-primary" href="AboutUs.jsp" role="button">Learn More</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>




            </div>
        </div>
    </div>
</section>
<br><br><br>


<!--SHOWCASE-->
<section id="showcase">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="showcase-left">
                    <img class='img-fluid w-100' src="/static/images/pic2.jpg">
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="showcase-right">
                    <h1>Student Record Management made simple!</h1>
                    <p>Random Text. A package for Sublime Text that will generate random strings of arbitrary length and character sets. Installation. Package Control. Random Text is available via Will Bond's Package Control. Using Git. Go to your Sublime Text Packages directory and clone the repository: git clone ...</p>
                    <a class="btn btn-primary btn-lg showcase-btn" href="AboutUs.jsp">Read More</a>
                </div>
            </div>
        </div>
    </div>
</section>
<br><br>






<!--TESTIMONIAL-->
<section id="testimonial">
    <div class="container">
        <h1>Testimonials</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
            consequat.</p>
        <p class="customer">- Sunil Reddy</p>
    </div>

</section>
<br><br><br>

<!--INFORMATION-->
<section id="info1">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-6">
                <div class="showcase-left">
                    <img class='img-fluid w-100' src="/static/images/pic3.jpg ">
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="info-right">
                    <h1>Get to know</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

                    <a class="btn btn-lg btn-primary info-btn" href="/about">Read More</a>
                </div>
            </div>
        </div>
        <br><br>
        <hr>
    </div>
</section>

<br><br>
<!--INFORMATION 2 -->
<section id="info2">
    <div class="container">
        <div class="row info-content">
            <div class="col-sm-6 col-md-6">
                <div class="info-left">
                    <h1>Pricing</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="info-right">
                    <h1>Portfolio</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>


                </div>
            </div>
        </div>
        <br><br>
        <hr>
    </div>
</section>
<br><br>


<!--FEATURES -->
<section id="features">
    <div class="container">
        <div class="row features-content">
            <div class="col-md-3 col-md-3 text-center">
                <a href="/about/#services" style="text-decoration: none;"><i class="fa fa-dashboard"></i><br>
                    <h1>Features</h1></a><br>
                <a >Account Profile</a><br>
                <a >Enterprise Services</a><br>
                <a >Free Services</a><br>

            </div>
            <div class="col-md-3 col-md-3 text-center">
                <a href="/about/#portfolio" style="text-decoration: none;"><i class="fa fa-question-circle-o"></i><br>
                    <h1>Portfolio</h1></a><br>
                <a>Business</a><br>
                <a>Education</a><br>
                <a>Government</a><br>

            </div>
            <div class="col-md-3 col-md-3 text-center">
                <a href="/about" style="text-decoration: none;"><i class="fa fa-rocket"></i><br><h1>About</h1></a><br>
                <a >Chairman & CEO</a><br>
                <a >Team</a><br>
                <a >Terms & Policy</a><br>


            </div>
            <div class="col-md-3 col-md-3 text-center">
                <a href="/about/#contact" style="text-decoration: none;"><i class="fa fa-phone"></i><br><h1>Support</h1></a><br>
                <a >+91-863-545-1230</a><br>
                <a >support@studentdiaries.com</a><br>
                <a >1800-156-654</a><br>


            </div>
        </div>
        <br><br>
        <hr>
    </div>
</section>
<br><br>


<section id="footer">
    <div class="container">
        <footer class="container">
            <p class="float-right"><a href="#main-header"> Back to top</a></p>
            <p class="float-right"><a href="/about/#contact">Contact Us</a></p>
            <p>&copy; StudentDiaries, Inc. 2017-2018 &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>
</section>

<!--FIREBASE -->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script
        src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>


<script>
    window.sr = ScrollReveal();
    sr.reveal('.navbar',{
        duration: 2000,
        origin: 'bottom'
    });

    sr.reveal('#carousel',{
        duration: 2000,
        origin: 'top',
        distance: '300px'
    });


    sr.reveal('.showcase-left',{
        duration: 2000,
        origin: 'top',
        distance: '100px',
        viewFactor:0.4
    });

    sr.reveal('.showcase-right',{
        duration: 2000,
        origin: 'top',
        distance: '100px',
        viewFactor: 0.4
    });

    sr.reveal('.showcase-btn',{
        duration: 2000,
        delay: 1200,
        origin: 'bottom'
    });

    sr.reveal('#testimonial div',{
        duration: 2000,
        origin: 'bottom',
        viewFactor: 0.4
    });

    sr.reveal('.info-left',{
        duration: 2000,
        distance: '100px',
        origin: 'top',
        viewFactor: 0.2
    })

    sr.reveal('.info-right',{
        duration: 2000,
        distance: '100px',
        origin: 'top',
        viewFactor: 0.2
    });

    sr.reveal('#features',{
        duration: 2000,
        distance: '100px',
        origin: 'top',
        viewFactor: 0.2
    });

</script>

<script>
    $(function() {
        // Smooth Scrolling
        $('a[href*="#"]:not([href="#"])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
</script>



</body>
</html>