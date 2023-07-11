package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ProductDTO;
import org.springframework.web.multipart.MultipartRequest;

import java.util.ArrayList;
import java.util.List;

public interface ProductService {

	// 게시글 등록
	void register(ProductDTO dto);
	
	// 게시판 리스트
//	List<BoardDTO> getList();
	List<ProductDTO> pList(PageDTO pDto);

	List<ProductDTO> pList2();
	
	// 글상세보기
//	BoardDTO view(int bid);
	ProductDTO view(int pNum, String mode);

	ArrayList<ProductDTO> getProdBySpec(String pSpec);
	
	// 글수정
	int modify(ProductDTO dto);
	
	// 글삭제
	int remove(int pNum);

	
	// 전체 게시글 수
	int totalCnt(PageDTO pDto);

	ProductDTO prodView(int pNum, String m);

	ArrayList<ProductDTO> getProdByCategory(String code);
}
