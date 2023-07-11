package kr.ezen.bbs.mapper;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CategoryDTO;
import kr.ezen.bbs.domain.PageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
	// 게시글 등록
	void catReg(CategoryDTO dto);
	
	// 게시판 리스트
//	List<BoardDTO> getList();
	List<CategoryDTO> catList();
	
	// 글상세보기
	CategoryDTO view(int catNum);
//
	// 게시글 수정
	int update(CategoryDTO dto);

	// 게시글 삭제
	int catDelete(int catNum);


}
