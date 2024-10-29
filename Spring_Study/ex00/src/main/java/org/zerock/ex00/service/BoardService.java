package org.zerock.ex00.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.ex00.domain.BoardVO;
import org.zerock.ex00.domain.Criteria;
import org.zerock.ex00.mappers.BoardMapper;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class BoardService {

    private final BoardMapper boardMapper;

    public Long register(BoardVO boardVO) {

        log.info("register....." + boardVO);

        int count = boardMapper.insert(boardVO);

        return boardVO.getBno();

    }

    public List<BoardVO> list() {

        return boardMapper.getList();

    }

    public List<BoardVO> getList(Criteria criteria) {

        return boardMapper.getPage(criteria);

    }

    public int getTotal(Criteria criteria) {

        return boardMapper.getTotal(criteria);

    }

    public BoardVO get(long bno) {

        return boardMapper.select(bno);

    }

    public boolean modify(BoardVO boardVO) {

        return boardMapper.update(boardVO) == 1;

    }

    public boolean delete(long bno) {

        return true;

    }


}
