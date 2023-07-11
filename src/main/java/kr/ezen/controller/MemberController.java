package kr.ezen.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.ezen.bbs.domain.AdminDTO;
import kr.ezen.bbs.domain.MemberDTO;
import kr.ezen.bbs.domain.ProductDTO;
import kr.ezen.bbs.mapper.MemberMapper;
import kr.ezen.service.AdminService;
import kr.ezen.service.MemberService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import util.ProdSpec;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private PasswordEncoder pwEncoder;

	@Autowired
	private JavaMailSender mailSender;

//	@Autowired
//	private MemberMapper mapper;

	@Autowired
	private MemberService service;

	@Autowired
	private AdminService adminService;
	private Boolean userBool;


	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {		
//		List<MemberDTO> memberList = dao.memberList();
		List<MemberDTO> memberList = service.memberList();
		model.addAttribute("list", memberList);
		
		return "member/memberList";
	}


	
	@RequestMapping("/memberRegister.do")
	public String memberRegister() {
		
		return "member/memberRegister";
	}
	
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberDTO dto) {
//		dao.memberInsert(dto);
		service.memberRegister(dto);
		
		return "redirect:/member/login.do";
	}
	
	@RequestMapping("/memberInfo.do")
	public String memberInfo(int no, Model model) {
//		MemberDTO dto = dao.memberInfo(no);
		MemberDTO dto = service.memberInfo(no);
		
		model.addAttribute("dto", dto);

		userBool = false;
		model.addAttribute("userBool",userBool);
		return "member/memberInfo";
	}
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberDTO dto) {
//		dao.memberUpdate(dto);
		service.memberModify(dto);
		
		return "redirect:/member/memberList.do";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete(int no) {
//		dao.deleteMember(no);
		service.memberRemove(no);
		
		return "redirect:/member/memberList.do";
	}
	
	// Message Converter API : jackson
	// ==> JSON 형식 자바객체로 변환, 또는 그 반대 변환
	
	// 비동기 전송데이터는 HTTP MSG의 body 담아서 전송한다.
	
	// @ResponseBody : 서버에서 클라이언트에 응답할 때, 자바객체를 HTTP 응답 MSG body에 변환해서
	// 클라이언트에 전송
	
	// @RequestBody : 클라이언트에서 서버로 데이터를 보낼때, HTTP 요청 MSG의 body에 담긴 값을
	// 자바객체로 변환해서 전송
	
	// 최근에는 주로 JSON형식, 예전에는 XML형식
	
	@RequestMapping("/memberAjaxList.do")
	public @ResponseBody List<MemberDTO> memberAjaxList() {		
		List<MemberDTO> memberList = service.memberList();
		return memberList;
	}
	
	@RequestMapping("/memberIdCheck.do")
	@ResponseBody
	public String memberIdCheck(@RequestParam("uid") String uid) {		
		MemberDTO dto = service.idCheck(uid);
		AdminDTO aDto = adminService.idCheck(uid);
 		if(dto !=null || "".equals(uid.trim())) {
			return "no";
		}
		if(aDto !=null || "".equals(uid.trim())) {
			return "no";
		}
		
		return "yes";
	}

	@RequestMapping("/memberEmailCheck.do")
	@ResponseBody
	public String emailCheck(@RequestParam("uEmail") String uEmail){
		System.out.println("uEmail = " + uEmail);

		// 인증코드 생성
		String uuid = UUID.randomUUID().toString().substring(0, 6);
		System.out.println("uuid = " + uuid);

		MimeMessage mail = mailSender.createMimeMessage();

		String mailContents = "<h3>이메일 주소 확인</h3></br>" +
				"<span>사용자가 본인임을 확인하려고 합니다. 다음 확인 코드를 입력하세요!!</span>"
				+"<h2>"+uuid+"</h2>";

		try {
			mail.setSubject("jh아카데미 [이메일 인증]", "utf-8");
			mail.setText(mailContents, "utf-8", "html");

			// 상대방 메일 셋팅
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail));

			mailSender.send(mail);
			return uuid;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "fail";
	}

	@GetMapping("login.do")
	public String loginForm(@RequestParam(defaultValue = "") String prevUrl
			,Model m){
		System.out.println("prevUrl = " + prevUrl);
		m.addAttribute("prevUrl",prevUrl);
		return "login/loginForm";
	}

	@PostMapping("login.do")
	public String memberLogin(@RequestParam(defaultValue = "") String prevUrl,MemberDTO dto, HttpServletRequest req
		, RedirectAttributes rttr){
		boolean result = service.memberLogin(dto, req);

		if(!result){ // 로그인 실패
			rttr.addAttribute("result", 0);
			return "redirect:/member/login.do"; // redirect는 GET 방식
		}
		if (!prevUrl.equals("")){
			return "redirect:" + prevUrl;
		}
//		return "redirect:/member/memberList.do";
		return "redirect:/";
	}

	@GetMapping("/logout.do")
	public String memberLogout(HttpSession session){
		session.invalidate();// 세션 초기화
		return "redirect:/";
	}

	@GetMapping("/idPwFind.do")
	public String idPwFind(String find, Model m){
		m.addAttribute("find", find);
		return "login/idPwFind";
	}

	@PostMapping("/findId.do")
	@ResponseBody
	public String findId(MemberDTO dto){
		System.out.println("dto.getName() = " + dto.getName());
		System.out.println("dto.getTel() = " + dto.getTel());

		String resultId= service.findId(dto);
		System.out.println("resultId = " + resultId);

		return resultId;
	}

	@PostMapping("/findPw.do")
	@ResponseBody
	public int findPw(String uid, String uEmail){
		int n = service.findPw(uid, uEmail);
		System.out.println("n = " + n);
		return n;
	}

	@GetMapping("/myProfile.do")
	public String myProfile(){
		return "member/myProfile";
	}

	@PostMapping("/pwCheck.do")
	@ResponseBody
	public String pwCheck(String pw, HttpSession session){
		System.out.println("입력된 pw = " + pw);
		String chkResult = "";
		MemberDTO dto = (MemberDTO)session.getAttribute("loginDto");

		String dbPw = dto.getPw();
		System.out.println("dbPw = " + dbPw);
		if(pwEncoder.matches(pw, dbPw)){
			chkResult="ok";
		}else{
			chkResult="no";
		}

		return chkResult;
	}

	@PostMapping("/pwChange.do")
	@ResponseBody
	public int pwChange(@RequestBody MemberDTO dto){
		String cipherPw = pwEncoder.encode(dto.getPw());
		dto.setPw(cipherPw);
		int n = service.modifyPw(dto);

		return n;
	}

	@RequestMapping("/userModify.do")
	public String userModify(@Param("id") String id, Model m){
		MemberDTO dto = service.idCheck(id);
//		MemberDTO dto = service.memberInfo(no);

		userBool = true;
		m.addAttribute("userBool",userBool);

		m.addAttribute("dto", dto);
		return "member/memberInfo";
	}


}
