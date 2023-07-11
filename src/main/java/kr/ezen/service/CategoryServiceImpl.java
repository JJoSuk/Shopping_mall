package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CategoryDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.mapper.BoardMapper;
import kr.ezen.bbs.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryMapper mapper;
	
	@Override
	public void catReg(CategoryDTO dto) {
		mapper.catReg(dto);
	}

	@Override
	public List<CategoryDTO> catList() {

		return mapper.catList();
	}




	@Override
//	public BoardDTO view(int bid) {
	public CategoryDTO view(int catNum, String mode) {



		return mapper.view(catNum);
	}
//
	@Override
	public int modify(CategoryDTO dto) {

		return mapper.update(dto);
	}

	@Override
	public int catDelete(int catNum) {

		return mapper.catDelete(catNum);
	}



}