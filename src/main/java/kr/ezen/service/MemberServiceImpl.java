package kr.ezen.service;

import kr.ezen.bbs.domain.MemberDTO;
import kr.ezen.bbs.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper mapper;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    private PasswordEncoder pwEncoder;

    @Override
    public List<MemberDTO> memberList() {
        return mapper.memberList();
    }

    @Override
    public int memberRegister(MemberDTO dto) {
        String inputPw = dto.getPw();
        String cipherPw = pwEncoder.encode(inputPw);
        dto.setPw(cipherPw);

        return mapper.memberInsert(dto);
    }

    @Override
    public int memberRemove(int no) {
        return mapper.memberDelete(no);
    }

    @Override
    public MemberDTO memberInfo(int no) {
        return mapper.memberInfo(no);
    }

    @Override
    public int memberModify(MemberDTO dto) {
        return mapper.memberUpdate(dto);
    }

    @Override
    public MemberDTO idCheck(String uid) {
        return mapper.idCheck(uid);
    }

    @Override
    public boolean memberLogin(MemberDTO dto, HttpServletRequest req) {
        HttpSession session = req.getSession();

        // 아이디와 일치하는 회원정보를 DTO에 담아서 가져옴
        MemberDTO loginDTO= mapper.memberLogin(dto);

//        if(loginDTO != null){ // 일치하는 아이디가 있는 경우
//            String inputPw= dto.getPw(); // 사용자가 입력한 비번
//            String dbPw = loginDTO.getPw(); // DB 비번
//
//            if(inputPw.equals(dbPw)){ // 비번 일치
//                session.setAttribute("loginDto", loginDTO);
//                return true;
//            }else{ // 비번 불일치
//                return false;
//            }
//        }
        if(loginDTO != null){ // 일치하는 아이디가 있는 경우
            String inputPw= dto.getPw(); // 사용자가 입력한 비번
            String dbPw = loginDTO.getPw(); // DB 비번

            if(pwEncoder.matches(inputPw, dbPw)){ // 비번 일치
                session.setAttribute("loginDto", loginDTO);
                return true;
            }else{ // 비번 불일치
                return false;
            }
        }
        return false;
    }

    @Override
    public String findId(MemberDTO dto) {
        String resultId= mapper.findId(dto);

        return resultId;
    }

    @Override
    public int findPw(String uid, String uEmail) {
        // 임시비밀번호
        String tempPw = UUID.randomUUID().toString().substring(0,6);
        MimeMessage mail = mailSender.createMimeMessage();

        String mailContents = "<h3>임시 비밀번호 발급</h3></br>"
                +"<h2>"+tempPw+"</h2>"
                +"<p>로그인 후 마이페이지에서 비밀번호를 변경해주면 됩니다.</p>";

        try {
            mail.setSubject("jh아카데미 [임시 비밀번호]", "utf-8");
            mail.setText(mailContents, "utf-8", "html");

            // 상대방 메일 셋팅
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail));

            mailSender.send(mail);

        } catch (Exception e) {
            e.printStackTrace();
        }
        String cipherPw = pwEncoder.encode(tempPw);
        int n = mapper.findPw(uid, uEmail, cipherPw);

        return n;
    }

     @Override
    public int modifyPw(MemberDTO dto) {
        int n = mapper.updatePw(dto);
        return n;
    }
}
