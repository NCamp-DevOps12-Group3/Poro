package com.bit.devops12.poro.dto;

public class UserFeedsPageDto {
    private int endPage;
    private Criteria cri;
    private int total;

    public UserFeedsPageDto(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;
        this.endPage=(int)(Math.ceil(total/1.0/ cri.getAmount()));

    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public Criteria getCri() {
        return cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
