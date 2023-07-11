package kr.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InterceptorTestController {
    @GetMapping("/itcMain")
    public String Main(){
        return "interceptorTest";
    }

    @GetMapping("/itc01")
    public String test1(){
        System.out.println("interceptor Test 01");
        return "itc01";
    }

    @GetMapping("/itc02")
    public String test2(){
        System.out.println("interceptor Test 02");
        return "itc02";
    }

    @GetMapping("aa/itc03")
    public String test3(){
        System.out.println("interceptor Test 03");
        return "itc03";
    }

    @GetMapping("aa/itc04")
    public String test4(){
        System.out.println("interceptor Test 04");
        return "itc04";
    }



}
