package kr.ezen.controller;

import kr.ezen.bbs.domain.AdminDTO;
import kr.ezen.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService service;

    private Boolean adminMode;

    @GetMapping("adminLogin.do")
    public String ad_loginForm(){
        return "login/ad_login";
    }

    @PostMapping("adminLogin.do")
    public String adminLogin(AdminDTO dto, HttpServletRequest req
            , RedirectAttributes rttr, HttpSession session){
        boolean result = service.adminLogin(dto, req);
        if(!result){ // 로그인 실패
            rttr.addAttribute("result", 0);
            return "redirect:/admin/adminLogin.do"; // redirect는 GET 방식
        }
        adminMode = true;
        session.setAttribute("adminMode",adminMode);
        return "ad_main";
    }

    @GetMapping("/logout.do")
    public String adminLogout(HttpSession session){
        session.invalidate();// 세션 초기화
        return "ad_main";
    }
}
