package com.study.project.commons.paging;

public class PageDTO {
    private int startPage, endPage;
    private boolean prev, next;

    private int total;
    private Criteria cri;

    public PageDTO(Criteria cri, int total) {
        this.total = total;
        this.cri = cri;
        this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
        this.startPage = endPage - 9;
        this.prev = this.startPage > 1;
        int realEnd = (int)( Math.ceil( (total * 1.0) / cri.getAmount()) );
        this.endPage = realEnd <= endPage? realEnd : endPage;
        this.next = this.endPage < realEnd;
    }

    @Override
    public String toString() {
        return "PageDTO{" +
                "startPage=" + startPage +
                ", endPage=" + endPage +
                ", prev=" + prev +
                ", next=" + next +
                ", total=" + total +
                ", cri=" + cri +
                '}';
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getTotal() {
        return total;
    }

    public Criteria getCri() {
        return cri;
    }
}
