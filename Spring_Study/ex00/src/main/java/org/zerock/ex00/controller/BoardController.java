package org.zerock.ex00.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.ex00.domain.BoardVO;
import org.zerock.ex00.domain.Criteria;
import org.zerock.ex00.domain.PageDTO;
import org.zerock.ex00.service.BoardService;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public void list(
            @ModelAttribute("cri") Criteria criteria,
            Model model
    ) {

        log.info("list.....");

        //List< BoardVO> list = boardService.list();
        List<BoardVO> list = boardService.getList(criteria);

        log.info(list);

        model.addAttribute("list", list);

        PageDTO pageDTO = new PageDTO(criteria, boardService.getTotal(criteria));
        model.addAttribute("pageMaker", pageDTO);

    }

    @GetMapping("/{job}/{bno}")
    public String read(
            @PathVariable(name = "job") String job,
            @PathVariable(name = "bno") Long bno,
            Model model
    ) {

        log.info("read.....");

        log.info("job : " + job);
        log.info("bno : " + bno);

        if (!(job.equals("read") || job.equals("modify"))) {
            throw new RuntimeException("Bad Request job");
        }

        BoardVO boardVO = boardService.get(bno);

        log.info("boardVO : " + boardVO);

        model.addAttribute("vo", boardVO);

        return "board/" + job;

    }

    @GetMapping("/register")
    public void register() {

        log.info("register...");

    }

    @PostMapping("/register")
    public String registerPost(
            BoardVO boardVO,
            RedirectAttributes rttr
    ) {
        log.info("boardVO : " + boardVO);

        long bno = boardService.register(boardVO);

        rttr.addFlashAttribute("result", bno);

        return "redirect:/board/list";
    }

    @PostMapping("/modify/{bno}")
    public String modify(
            @PathVariable(name = "bno") Long bno,
            BoardVO boardVO
    ) {

        log.info("modify.....");

        boardVO.setBno(bno);

        log.info("boardVO : " + boardVO);

        boardService.modify(boardVO);

        return "redirect:/board/read/" + bno;

    }

    @PostMapping("/remove/{bno}")
    public String remove(
            @PathVariable(name = "bno") Long bno,
            RedirectAttributes rttr
    ) {

        log.info("remove.....");

        BoardVO boardVO = new BoardVO();
        boardVO.setBno(bno);
        boardVO.setTitle("해당 글은 삭제 되었습니다.");
        boardVO.setContent("해당 글은 삭제 되었습니다.");
        boardVO.setWriter("unknown");

        log.info("boardVO : " + boardVO);
        boardService.modify(boardVO);

        rttr.addFlashAttribute("result", boardVO.getBno());

        return "redirect:/board/list";

    }


//    @GetMapping("/read/{bno}")
//    public String read(
//           @PathVariable(name="bno") Long bno,
//           Model model
//    ){
//
//        log.info("read.....");
//
//        log.info("bno : " + bno);
//
//        BoardVO boardVO = boardService.get(bno);
//
//        log.info("boardVO : " + boardVO);
//
//        model.addAttribute("vo", boardVO);
//
//        return "board/read";
//    }

//    @GetMapping("/modify/{bno}")
//    public String modify(
//            @PathVariable(name="bno") Long bno,
//            Model model
//    ){
//
//        log.info("modify.....");
//
//        log.info("bno : " + bno);
//
//        BoardVO boardVO = boardService.get(bno);
//
//        log.info("boardVO : " + boardVO);
//
//        model.addAttribute("vo", boardVO);
//
//        return "board/modify";
//
//    }


}
