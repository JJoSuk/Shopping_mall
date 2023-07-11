package kr.ezen.service;

import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ReplyDTO;
import kr.ezen.bbs.domain.ReplyPageDTO;
import kr.ezen.bbs.mapper.BoardMapper;
import kr.ezen.bbs.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyMapper mapper;

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public int register(ReplyDTO rDto) {
        boardMapper.updateReplyCnt(rDto.getBid(),1);
        int n = mapper.insert(rDto);
        return n;
    }

    @Override
    public int remove(int rno) {
        ReplyDTO rDto = mapper.select(rno);
        boardMapper.updateReplyCnt(rDto.getBid(),-1);
        int n = mapper.delete(rno);
        return mapper.delete(rno);
    }

    @Override
    public ReplyDTO read(int rno) {
        return mapper.select(rno);
    }

    @Override
    public int modify(ReplyDTO rDto) {
        return mapper.update(rDto);
    }

    @Override
    public ReplyPageDTO getList(int bid, int vp) {
        // bid에 해당하는 전체 댓글 수 가져오기
        int replyCnt = mapper.replyCnt(bid);
        System.out.println("replyCnt = " + replyCnt);

        ReplyPageDTO rPageDto = new ReplyPageDTO();
        // viewPage가 바뀔때마다 새롭게 셋팅
        rPageDto.setViewPage(vp);

        // 페이지별 startIndex 값을 새롭게 구함
        rPageDto.setValue(replyCnt);

        List<ReplyDTO> list = mapper.getListByBid(bid, rPageDto.getStartIndex(),
                rPageDto.getCntPerPage());
        System.out.println("list = " + list);

        rPageDto.setList(list);
        return rPageDto;
    }

    @Override
    public int replyCnt(int bid) {
        return mapper.replyCnt(bid);
    }



}
