package kr.ezen.bbs.mapper;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartRequest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
	// 게시글 등록
	void insert(ProductDTO dto);
	
	// 게시판 리스트
//	List<BoardDTO> getList();
	List<ProductDTO> pList(PageDTO pDto);

	List<ProductDTO> pList2();
	
	// 글상세보기
	ProductDTO view(int pNum);

	ArrayList<ProductDTO> getProdBySpec(String pSpec);
	
	// 게시글 수정
	int update(ProductDTO dto);
	
	// 게시글 삭제
	int delete(int pNum);
	
	// 전체 게시글 수
	int totalCnt(PageDTO pDto);

	ProductDTO prodView(int pNum);

	ArrayList<ProductDTO> getProdByCategory(String code);
}
