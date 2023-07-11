package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CategoryDTO;
import kr.ezen.bbs.domain.PageDTO;

import java.util.List;

public interface CategoryService {
	// 게시글 등록
	void catReg(CategoryDTO dto);
	
	// 게시판 리스트
//	List<BoardDTO> getList();
	List<CategoryDTO> catList();
	
	// 글상세보기
//	BoardDTO view(int bid);
	CategoryDTO view(int catNum, String mode);
//
	// 글수정
	int modify(CategoryDTO dto);

	// 글삭제
	int catDelete(int catNum);


}
