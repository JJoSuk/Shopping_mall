package kr.ezen.controller;


import kr.ezen.bbs.domain.CategoryDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
//	@GetMapping("/list.do")
//	public String list(Model model) {
//		List<BoardDTO> list = service.getList();
//		model.addAttribute("list", list);
//
//		return "board/boardList";
//	}

	@RequestMapping("/catList.do")
	public String list(Model model) {
		List<CategoryDTO> list = service.catList();

		model.addAttribute("list", list);

		return "category/cat_list";
	}
	
	
	@GetMapping("/catReg.do")
	public String register(@ModelAttribute("pDto") PageDTO pDto) {

		return "category/cat_input";
	}
	
	@PostMapping("/catReg.do")
	public String register(CategoryDTO dto, @ModelAttribute("pDto") PageDTO pDto
				,RedirectAttributes rttr) {
//		for(int i=1; i<=113; i++) {
//			BoardDTO bDto = new BoardDTO();
//			bDto.setSubject(i + "번째 제목입니다....");
//			bDto.setContents(i + "번째 내용입니다~~~~~");
//			bDto.setWriter("아무개" + (i%10));
//			
//			service.register(bDto);
//		}
		service.catReg(dto);
		rttr.addAttribute("cntPerPage", pDto.getCntPerPage());
		return "redirect:/category/catList.do";
	}
	

	// 수정 폼페이지
	@RequestMapping(value="/catUpdate.do", method=RequestMethod.GET)
	public String modifyForm(PageDTO pDto, int catNum, Model m) {
		CategoryDTO dto = service.view(catNum, "m");
		m.addAttribute("dto", dto);

		return "category/cat_update";
	}
	// 게시글 수정
	@RequestMapping(value="/catUpdate.do", method=RequestMethod.POST)
//	public String modify(@ModelAttribute("pDto") PageDTO pDto, BoardDTO dto,
	public String modify(CategoryDTO dto) {
		service.modify(dto);

		return "redirect:/category/catList.do";
	}

	//게시글 삭제
	@GetMapping("/catDelete.do")
	public String remove(@ModelAttribute("pDto") PageDTO pDto, int catNum,
						 RedirectAttributes rttr) {
		service.catDelete(catNum);
		System.out.println("~~~~~cntPerPage : " + pDto.getCntPerPage());
		rttr.addAttribute("viewPage", pDto.getViewPage());
		rttr.addAttribute("cntPerPage", pDto.getCntPerPage());

		return "redirect:/category/catList.do";
	}
}
