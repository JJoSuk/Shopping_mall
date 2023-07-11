package kr.ezen.bbs.mapper;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CartDTO;
import kr.ezen.bbs.domain.PageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface CartMapper {
	// 게시글 등록
	void addProduct(CartDTO dto);
	
	// 게시판 리스트
	List<CartDTO> cartList();

	ArrayList<CartDTO> getCart(String id);

	
	// 게시글 수정
	int modifyQty(CartDTO cDto);
	
	// 게시글 삭제
	int cartDelete(int cNum);

	CartDTO checkCart(@Param("id")String id,@Param("pNum") int pNum);

}
