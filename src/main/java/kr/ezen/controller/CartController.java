package kr.ezen.controller;

import kr.ezen.bbs.domain.*;
import kr.ezen.bbs.mapper.CategoryMapper;
import kr.ezen.service.CartService;
import kr.ezen.service.CategoryService;
import kr.ezen.service.MemberService;
import kr.ezen.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import util.ProdSpec;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService service;

	@Autowired
	private ProductService pService;

	@Autowired
	private CategoryService cDao;

	@Autowired
	private MemberService mService;
	
//	@GetMapping("/list.do")
//	public String list(Model model) {
//		List<BoardDTO> list = service.getList();
//		model.addAttribute("list", list);
//
//		return "board/boardList";
//	}

	@RequestMapping("/cartList.do")
	public String list( String id, Model model) {
//
		List<CategoryDTO> list = cDao.catList();
		model.addAttribute("cDtos", list);

		ProdSpec[] pdSpecs = ProdSpec.values();
		model.addAttribute("pdSpecs", pdSpecs);

		List<ProductDTO> pDto = pService.pList2();
		model.addAttribute("pDto", pDto);

//		System.out.println("id = " + id);
		ArrayList<CartDTO> cDtos= service.getCart(id);
//		System.out.println("cDtos = " + cDtos);
		for(CartDTO cDto : cDtos) {
			cDto.setTotal();
		}

		model.addAttribute("dtos", cDtos);

		return "member/u_temp.jsp?pg=cartList";
	}

	@RequestMapping("/checkout.do")
	public String chkout(String id, Model m){
		ArrayList<CartDTO> cDtos= service.getCart(id);
		for(CartDTO cDto : cDtos) {
			cDto.setTotal();
			System.out.println("cDto = " + cDto);
		}

		m.addAttribute("dtos", cDtos);

		MemberDTO mDto = mService.idCheck(id);
		m.addAttribute("mDto", mDto);

		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("cDtos", list);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);
//		System.out.println("id = " + id);
		m.addAttribute("id",id);

		return "member/u_temp.jsp?pg=checkout";
	}

	
//	@GetMapping("/cartAdd.do")
//	public String addProduct(@ModelAttribute("pDto") PageDTO pDto) {
//
//
//
//		return "redirect:/cart/cartList.do";
//	}


//	@GetMapping("/cartAdd.do")
//	public String addProduct(HttpServletRequest request) {
//
//		System.out.println("하이");
//
//			//CartDAO shopCart = (CartDAO)session.getAttribute("shopCart");
////			String id = (String)session.getAttribute("id");
//			String id = request.getParameter("id");
//			System.out.println("id :" + id);
//
//			int pNum = Integer.parseInt(request.getParameter("pNum"));
//			int pQty = Integer.parseInt(request.getParameter("pQty"));
//			String pSpec = request.getParameter("pSpec");
//
//
//			CartDTO cDto = (CartDTO) service.checkCart(id, pNum);
//
//			System.out.println("cDto" + cDto);
//
//			if(cDto == null) { // 장바구니 비었을 때
//			// 장바구니 추가
//			service.addProduct(id, pNum, pQty);
//		}else { // 장바구니에 상품이 있을 때
//			// 수량 수정
//			pQty = cDto.getPQty() + pQty;
//			service.modifyQty(pQty, cDto.getCNum());
//		}
//
//
//		System.out.println("장바구니 담기 성공!!");
//
//		return "redirect:/cart/cartList.do";
////		return "/";
//	}

	@RequestMapping("/cartAdd.do")
	public String addProduct(CartDTO dto , @Param("pNum") int pNum,@Param
			("pQty") int pQty, @Param("pSpec") String pSpec, @Param("id") String id,Model model) {

		//CartDAO shopCart = (CartDAO)session.getAttribute("shopCart");
//			String id = (String)session.getAttribute("id");

		System.out.println("id :" + id);
		System.out.println("pNum :" + pNum);
		System.out.println("pQty = " + pQty);
		CartDTO cDto = service.checkCart(id, pNum);

		System.out.println("cDto :" + cDto);

		if(cDto == null) { // 장바구니 비었을 때
			// 장바구니 추가
			System.out.println("cDto :" + cDto);
//			service.addProduct(id, pNum, pQty);
			service.addProduct(dto);


		}
		else { // 장바구니에 상품이 있을 때
			// 수량 수정
			pQty = cDto.getpQty() + pQty;
			cDto.setpQty(pQty);
			service.modifyQty(cDto);
		}

		model.addAttribute("id",id);

		System.out.println("장바구니 담기 성공!!");

		return "redirect:/cart/cartList.do";
	}

	@PostMapping("/cartModify.do")
	public String cartModify(CartDTO dto, Model m){
		service.modifyQty(dto);
		m.addAttribute("id", dto.getId());

		return "redirect:/cart/cartList.do";
	}

	//게시글 삭제
	@PostMapping("/cartDelete.do")
	public String cartDelete(Model model, @Param("id") String id, HttpServletRequest request) throws UnsupportedEncodingException {

//		System.out.println("cNum = " + cNum);
//
//		service.cartDelete(cNum);
		model.addAttribute("id", id);

		//////////////////////
		request.setCharacterEncoding("utf-8");


		// "13/14/15"
		String pNums = request.getParameter("delProdNums");
		String cNum = null;
		System.out.println("pNums = " + pNums);

		if (pNums == null) {
			if (request.getMethod().equals("POST")) {
				cNum = request.getParameter("cNum");
			}

			if (cNum == null || cNum.trim().equals("")) {
				request.setAttribute("msg", "잘못된 경로 입니다");
				return "user/u_temp.jsp?pg=u_main";
			}

			service.cartDelete(Integer.parseInt(cNum));

			return "redirect:/cart/cartList.do";

		}

		String[] pNumArr = pNums.split("/");
		ArrayList<CartDTO> cDtos = null;

		if (pNumArr.length > 0) {
			for (int i = 0; i < pNumArr.length; i++) {
				service.cartDelete(Integer.parseInt(pNumArr[i]));
			}

			cDtos = service.getCart(id);
			for(CartDTO cDto : cDtos) {
		    	  cDto.setTotal();
//				System.out.println("cDto = " + cDto);
			}
			model.addAttribute("dtos", cDtos);

		}

		return "redirect:/cart/checkout.do";
	}
}
