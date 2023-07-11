package kr.ezen.service;

import kr.ezen.bbs.domain.AdminDTO;
import kr.ezen.bbs.domain.MemberDTO;
import kr.ezen.bbs.mapper.AdminMapper;
import kr.ezen.bbs.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper mapper;

    @Autowired
    JavaMailSender mailSender;

    @Override
    public List<AdminDTO> adminList() {
        return mapper.adminList();
    }


    @Override
    public boolean adminLogin(AdminDTO dto, HttpServletRequest req) {
        HttpSession session = req.getSession();

        // 아이디와 일치하는 회원정보를 DTO에 담아서 가져옴
        AdminDTO adloginDTO= mapper.adminLogin(dto);

        if(adloginDTO != null){ // 일치하는 아이디가 있는 경우
            String inputPw= dto.getPassword(); // 사용자가 입력한 비번
            String dbPw = adloginDTO.getPassword(); // DB 비번

            if(inputPw.equals(dbPw)){ // 비번 일치
                session.setAttribute("loginDto", adloginDTO);
                return true;
            }else{ // 비번 불일치

                return false;
            }
        }
        return false;
    }

    @Override
    public AdminDTO idCheck(String uid) {
        return mapper.idCheck(uid);
    }
}
