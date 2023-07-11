package kr.ezen.service;

import kr.ezen.bbs.domain.AdminDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AdminService {
    List<AdminDTO> adminList();

    boolean adminLogin(AdminDTO dto, HttpServletRequest req);

    AdminDTO idCheck(String uid);

}
