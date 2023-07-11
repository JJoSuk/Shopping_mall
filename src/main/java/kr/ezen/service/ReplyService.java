package kr.ezen.service;

import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ReplyDTO;
import kr.ezen.bbs.domain.ReplyPageDTO;

import java.util.List;

public interface ReplyService {
    int register(ReplyDTO rDto);

    int remove(int rno);

    ReplyDTO read(int rno);


    int modify(ReplyDTO rDto);

    ReplyPageDTO getList(int bid, int vp);

    // 전체 게시글 수
    int replyCnt(int bid);
}
