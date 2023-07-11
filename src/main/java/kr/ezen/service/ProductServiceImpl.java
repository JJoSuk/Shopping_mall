package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ProductDTO;
import kr.ezen.bbs.mapper.BoardMapper;
import kr.ezen.bbs.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartRequest;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{



	@Autowired
	private ProductMapper mapper;
	
	@Override
	public void register(ProductDTO dto) {

		mapper.insert(dto);
	}

	@Override
//	public List<BoardDTO> getList() {
//		return mapper.getList();
//	}
	public List<ProductDTO> pList(PageDTO pDto) {
		System.out.println("pDto.getSearchType() = " + pDto.getSearchType());
		System.out.println("pDto.getKeyWord() = " + pDto.getKeyWord());
		int totalCnt = mapper.totalCnt(pDto);
		System.out.println("totalCnt = " + totalCnt);
		pDto.setValue(totalCnt, pDto.getCntPerPage());


		return mapper.pList(pDto);
	}

	public List<ProductDTO> pList2() {

		return mapper.pList2();
	}
	

	@Override
//	public BoardDTO view(int bid) {
	public ProductDTO view(int pNum, String mode) {

		return mapper.view(pNum);
	}

	@Override
	public ArrayList<ProductDTO> getProdBySpec(String pSpec) {

		return mapper.getProdBySpec(pSpec);
	}

	@Override
	public int modify(ProductDTO dto) {
		
		return mapper.update(dto);
	}

	@Override
	public int remove(int pNum) {
		
		return mapper.delete(pNum);
	}

	@Override
	public int totalCnt(PageDTO pDto) {
		
		return mapper.totalCnt(pDto);
	}

	@Override
	public ProductDTO prodView(int pNum, String m) {
		return mapper.prodView(pNum);
	}

	@Override
	public ArrayList<ProductDTO> getProdByCategory(String code) {
		return mapper.getProdByCategory(code);
	}

}