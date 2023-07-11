package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CartDTO;
import kr.ezen.bbs.domain.PageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface CartService {
	// 게시글 등록
	void addProduct(CartDTO dto);
	
	// 게시판 리스트
	List<CartDTO> cartList();

	ArrayList<CartDTO> getCart(String id);
	
	// 글수정
	int modifyQty(CartDTO cDto);
	
	// 글삭제
	int cartDelete(int cNum);

	CartDTO checkCart( String id, int pNum);
	

}
