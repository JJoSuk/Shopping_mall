package kr.ezen.bbs.mapper;

import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ReplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {
    int insert(ReplyDTO rDto);

    int delete(int rno);

    ReplyDTO select(int rno);

    int update(ReplyDTO rDto);

    List<ReplyDTO> getListByBid(@Param("bid") int bid,
                                @Param("startIndex") int si,@Param("cntPerPage") int cp);

    // 전체 게시글 수
    int replyCnt(int bid);
}
