package kr.ezen.service;

import kr.ezen.bbs.domain.BoardDTO;
import kr.ezen.bbs.domain.CartDTO;
import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.mapper.BoardMapper;
import kr.ezen.bbs.mapper.CartMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper mapper;

	@Override
	public void addProduct(CartDTO dto) {

		 mapper.addProduct(dto);
	}

	@Override
	public List<CartDTO> cartList() {
		return mapper.cartList();
	}

	@Override
	public ArrayList<CartDTO> getCart(String id) {
		return mapper.getCart(id);
	}

	@Override
	public int modifyQty(CartDTO cDto) {
		return mapper.modifyQty(cDto);
	}

	@Override
	public int cartDelete(int cNum) {
		
		return mapper.cartDelete(cNum);
	}

	@Override
	public CartDTO checkCart( String id, int pNum) {

		return mapper.checkCart(id, pNum);
	}


}