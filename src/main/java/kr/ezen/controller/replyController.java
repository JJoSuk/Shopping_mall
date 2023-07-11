package kr.ezen.controller;

import kr.ezen.bbs.domain.PageDTO;
import kr.ezen.bbs.domain.ReplyDTO;
import kr.ezen.bbs.domain.ReplyPageDTO;
import kr.ezen.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // @Controller + @ResponseBody
@RequestMapping("/replies")
public class replyController {

    @Autowired
    private ReplyService service;

    // 댓글 등록
    @PostMapping("/new")
    public String create(@RequestBody ReplyDTO rDto){
        int n = service.register(rDto);

        return n == 1 ? "success" : "fail";
    }


    // 댓글 삭제
    @DeleteMapping("/{rno}")
    public String remove(@PathVariable("rno") int rno){
        int n = service.remove(rno);

        return n == 1 ? "success" : "fail";
    }

    // 댓글 조회
    @GetMapping("/{rno}")
    public ReplyDTO read(@PathVariable("rno") int rno){

        return service.read(rno);
    }

    // 댓글 수정
    @PutMapping("/{rno}")
    public String update(@PathVariable("rno") int rno,
                         @RequestBody ReplyDTO rDto){
        rDto.setRno(rno);

        int n = service.modify(rDto);
        return n ==1 ? "success" : "fail";
    }

    // 특정 게시글에 대한 댓글 리스트
//    @GetMapping("/list/{bid}")
//    public List<ReplyDTO> getList(@PathVariable("bid") int bid){
//        List<ReplyDTO> list = service.getList(bid);
//
//
//        return list;
//    }

    @GetMapping("/list/{bid}/{viewPage}")
    public ReplyPageDTO getList(@PathVariable("bid") int bid,
                                  @PathVariable("viewPage") int vp){
        ReplyPageDTO rPageDto = service.getList(bid, vp);


        return rPageDto;
    }

}
