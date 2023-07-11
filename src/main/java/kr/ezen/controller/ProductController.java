package kr.ezen.controller;


//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.ezen.bbs.domain.*;
import kr.ezen.bbs.mapper.CategoryMapper;
import kr.ezen.service.BoardService;
import kr.ezen.service.CategoryService;
import kr.ezen.service.ProductService;
import kr.ezen.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import util.ProdSpec;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.util.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping("/product")
public class ProductController {

	private static ProductController instance = null;

	public static ProductController getInstance() {
		if(instance == null) {
			instance = new ProductController();
		}

		return instance;
	}
	
	@Autowired
	private ProductService service;

	@Autowired
	private CategoryService cDao;


//	@GetMapping("/list.do")
//	public String list(Model model) {
//		List<BoardDTO> list = service.getList();
//		model.addAttribute("list", list);
//
//		return "board/boardList";
//	}

	@RequestMapping("/prodList.do")
	public String list(PageDTO pDto, Model model) {
		List<ProductDTO> list = service.pList(pDto);

		model.addAttribute("dtos", list);
		model.addAttribute("pDto", pDto);

		return "product/prod_list";
	}

	@GetMapping("/prodInput.do")
	public String register(@ModelAttribute("pDto") PageDTO pDto, Model model,  HttpServletRequest request) {


		List<CategoryDTO> list = cDao.catList();
		model.addAttribute("list", list);

		ProdSpec[] pdSpecs = ProdSpec.values();
		model.addAttribute("pdSpecs", pdSpecs);

		return "product/prod_input";
	}

	@PostMapping("/prodInput.do")
	public String register(@ModelAttribute("pDto") PageDTO pDto, ProductDTO dto
			, MultipartHttpServletRequest mhr, HttpServletRequest request, Model model) throws IOException {
		String repo = "resources/fileRepo";

		// 서버의 물리경로 얻어오기										// OS에 따라 \\(윈도우) //(리눅스)
		String savePath = request.getServletContext().getRealPath("")+File.separator+repo;

//		System.out.println(savePath);
//		model.addAttribute("savePath", savePath);

		Iterator<String> iter = mhr.getFileNames();

		List<String> fileList = new ArrayList<String>();

		while(iter.hasNext()) {
			String fileParamName = iter.next();
			System.out.println("fileParamName : " + fileParamName);

			// MultipartFile : 파일 정보를 갖고 있는 객체
			MultipartFile mFile = mhr.getFile(fileParamName);

			String originName = mFile.getOriginalFilename();
			System.out.println("originName : " + originName);
			dto.setpImage(originName);

			File file = new File(savePath + "\\" + fileParamName);

			if (mFile.getSize() != 0) { // 업로드 된 경우
				if (!file.exists()) { // 파일이 존재하지 않으면 최초로 한번만 실행
					if (file.getParentFile().mkdir()) {    // savePath에 지정된 폴더(fileRepo) 생성
						file.createNewFile(); // 임시파일 생성
					} // if
				} // if

				File uploadFile = new File(savePath + "\\" + originName);

				// 중복시 파일명 대체
				if (uploadFile.exists()) {
					originName = System.currentTimeMillis() + "_" + originName;
					uploadFile = new File(savePath + "\\" + originName);
				}

				// 실제 파일 업로드하기
				mFile.transferTo(uploadFile);
				fileList.add(originName);
			}// if
		}

		service.register(dto);

		return "redirect:/product/prodList.do";
	}




//	@GetMapping("/view.do")
//	public String view(int bid, @ModelAttribute("pDto") PageDTO pDto, Model m) {
//		CategoryDTO dto = service.view(bid, "v");
//		m.addAttribute("dto", dto);
//
//		return "board/view";
//	}
	
	// 수정 폼페이지
	@RequestMapping(value="/prodUpdate.do", method=RequestMethod.GET)
	public String modifyForm(PageDTO pDto, int pNum, Model m) {
		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("list", list);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);


		ProductDTO dto = service.view(pNum, "m");
		m.addAttribute("dto", dto);
		m.addAttribute("pDto", pDto);


		return "product/prod_update";
	}
	// 게시글 수정
	@RequestMapping(value="/prodUpdate.do", method=RequestMethod.POST)
//	public String modify(@ModelAttribute("pDto") PageDTO pDto, BoardDTO dto,
	public String modify(@ModelAttribute("pDto") PageDTO pDto, ProductDTO dto
			, MultipartHttpServletRequest mhr, HttpServletRequest request, Model model) throws IOException {

		String repo = "resources/fileRepo";

		// 서버의 물리경로 얻어오기										// OS에 따라 \\(윈도우) //(리눅스)
		String savePath = request.getServletContext().getRealPath("")+File.separator+repo;

//		System.out.println(savePath);
//		model.addAttribute("savePath", savePath);

		Iterator<String> iter = mhr.getFileNames();

		List<String> fileList = new ArrayList<String>();

		while(iter.hasNext()) {
			String fileParamName = iter.next();
			System.out.println("fileParamName : " + fileParamName);

			// MultipartFile : 파일 정보를 갖고 있는 객체
			MultipartFile mFile = mhr.getFile(fileParamName);

			String originName = mFile.getOriginalFilename();
			System.out.println("originName : " + originName);
			if("".equals(originName.trim())){
				dto.setpImage(service.view(dto.getpNum(),"m").getpImage());
			}else{
				dto.setpImage(originName);
			}

			File file = new File(savePath + "\\" + fileParamName);

			if (mFile.getSize() != 0) { // 업로드 된 경우
				if (!file.exists()) { // 파일이 존재하지 않으면 최초로 한번만 실행
					if (file.getParentFile().mkdir()) {    // savePath에 지정된 폴더(fileRepo) 생성
						file.createNewFile(); // 임시파일 생성
					} // if
				} // if

				File uploadFile = new File(savePath + "\\" + originName);



				// 중복시 파일명 대체
				if (uploadFile.exists()) {
					originName = System.currentTimeMillis() + "_" + originName;
					uploadFile = new File(savePath + "\\" + originName);
				}

				// 실제 파일 업로드하기
				mFile.transferTo(uploadFile);
				fileList.add(originName);
			}// if
		}

		service.modify(dto);
		model.addAttribute("dto", dto);
//
//		rttr.addAttribute("viewPage", pDto.getViewPage());
//		rttr.addAttribute("cntPerPage", pDto.getCntPerPage());
//		rttr.addAttribute("searchType", pDto.getSearchType());
//		rttr.addAttribute("keyWord", pDto.getKeyWord());

		return "redirect:/product/prodList.do";
	}
//
	//게시글 삭제
	@GetMapping("/prodDelete.do")
	public String remove(@ModelAttribute("pDto") PageDTO pDto, int pNum,
						 RedirectAttributes rttr) {
		service.remove(pNum);
		System.out.println("~~~~~cntPerPage : " + pDto.getCntPerPage());
		rttr.addAttribute("viewPage", pDto.getViewPage());
		rttr.addAttribute("cntPerPage", pDto.getCntPerPage());

		return "redirect:/product/prodList.do";
	}





	@RequestMapping("/proList2.do")
	public ArrayList<ProductDTO> getProdBySpec(String pSpec, @ModelAttribute("pDto") PageDTO pDto) {
		ArrayList<ProductDTO> dto = service.getProdBySpec(pSpec);

//		m.addAttribute("dto", dto);
		map.put(pSpec, dto);
		return dto;
	}

	@RequestMapping("/proList.do")
	public String umain(Model m) {

		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("cDtos", list);

		List<ProductDTO> pDto = service.pList2();
		m.addAttribute("pDto", pDto);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);


		return "member/u_temp";
	}

	@RequestMapping("/categoryList.do")
	public String categoryList(String code,String catName,Model m) {

//		List<CategoryDTO> list = cDao.catList();
//		m.addAttribute("cDtos", list);
//
//		List<ProductDTO> pDto = service.pList2();
//		m.addAttribute("pDto", pDto);
//
//		ProdSpec[] pdSpecs = ProdSpec.values();
//		m.addAttribute("pdSpecs", pdSpecs);
		ArrayList<ProductDTO> pDtos = null;

		pDtos = service.getProdByCategory(code);

		m.addAttribute("pDtos", pDtos);
		m.addAttribute("catName", catName);

		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("cDtos", list);

		List<ProductDTO> pDto = service.pList2();
		m.addAttribute("pDto", pDto);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);


		return "member/u_temp.jsp?pg=categoryList";
	}

	public HashMap<String, ArrayList<ProductDTO>> map = new HashMap<String, ArrayList<ProductDTO>>();

	@RequestMapping("/specList.do")
	public String specList(String pSpec,Model m) {


		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("cDtos", list);

		List<ProductDTO> pDto = service.pList2();
		m.addAttribute("pDto", pDto);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);

		ArrayList<ProductDTO> pDtos = null;

		String specValue= ProdSpec.valueOf(pSpec).getValue();

		m.addAttribute("pSpec", pSpec);
		m.addAttribute("specValue", specValue);


		return "member/u_temp.jsp?pg=specList";
	}




	@RequestMapping("/prodView.do")
	public String prodView( Model m, int pNum) {

		List<CategoryDTO> list = cDao.catList();
		m.addAttribute("cDtos", list);

		List<ProductDTO> pDto = service.pList2();
		m.addAttribute("pDto", pDto);

		ProdSpec[] pdSpecs = ProdSpec.values();
		m.addAttribute("pdSpecs", pdSpecs);

		System.out.println("aaa");
		System.out.println("pNum = " + pNum);
		ProductDTO dto = service.view(pNum, "m");
		m.addAttribute("dto", dto);

		String specValue= ProdSpec.valueOf(dto.getpSpec()).getValue();
		m.addAttribute("pSpec",specValue);


		return "member/u_temp.jsp?pg=prodView";
	}




}
