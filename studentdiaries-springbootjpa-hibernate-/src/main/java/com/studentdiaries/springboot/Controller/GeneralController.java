package com.studentdiaries.springboot.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralController {


    @RequestMapping(value = "/index")
    public String welcome()
    {
        return "index";
    }


    @RequestMapping(value = "/signup")
    public String generalSignup()
    {
        return "GeneralSignup";
    }


    @RequestMapping(value = "/about")
    public String About()
    {
        return "AboutUs";
    }

}
