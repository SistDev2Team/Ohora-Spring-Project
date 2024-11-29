package kr.ohora.sl.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
    private int start;
    private int end;
    public int first;
    public int last;
    private boolean prev;
    private boolean next;
    private int total;
    private Criteria criteria;
    private int currentPage;
    private int numberPerPage = 12;
    private String searchWord;

    public PageDTO(Criteria criteria, int total) {
        this.criteria = criteria;
        this.total = total;

        this.end = (int)(Math.ceil(criteria.getCurrentPage() / (double)criteria.getNumberOfPageBlock())) * criteria.getNumberOfPageBlock();
        this.start = this.end - criteria.getNumberOfPageBlock() + 1;

        int realEndPage = (int)(Math.ceil((double)total / numberPerPage));
        if(realEndPage < this.end) this.end = realEndPage;

        this.prev = this.start > 1;
        this.next = this.end < realEndPage;
    }
}
