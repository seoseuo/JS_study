package org.zerock.ex00.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

    private int startPage; // 화며에서 시작 번호
    private int endPage; // 화면에서 마지막 번호
    private boolean prev, next; //이전 다음 버튼

    private int total;  //전체 갯수
    private Criteria cri; //pageNum, amount 정보

    public PageDTO(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;

        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

        this.startPage = this.endPage - 9;

        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

        if (realEnd <= this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;

    }

}
