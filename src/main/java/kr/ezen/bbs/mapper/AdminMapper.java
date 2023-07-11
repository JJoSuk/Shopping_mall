package kr.ezen.bbs.mapper;

import kr.ezen.bbs.domain.AdminDTO;
import kr.ezen.bbs.domain.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AdminMapper {
	List<AdminDTO> adminList();

	AdminDTO adminLogin(AdminDTO dto);

	AdminDTO idCheck(String uid);

}
