package org.zerock.ex00.mappers;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.ex00.domain.BoardVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class BoardMapperTests {

    @Autowired(required = false) // 이래야 오류를 뱉지 않는다.
    BoardMapper boardMapper;

    @Test
    public void test1(){
        log.info(boardMapper);
    }

    @Test
    public void testList() {
        boardMapper.getList().forEach(boardVO -> log.info(boardVO));
    }

}
