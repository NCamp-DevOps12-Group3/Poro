package com.bit.devops12.poro.dto;

public class UserFeedsPageDto {
    private int endPage;
    private Criteria cri;
    private int total;
    private int userid;
    private String pageType;

    @Override
    public String toString() {
        return "UserFeedsPageDto{" +
                "endPage=" + endPage +
                ", cri=" + cri +
                ", total=" + total +
                ", userid=" + userid +
                ", pageType='" + pageType + '\'' +
                '}';
    }

    public String getPageType() {
        return pageType;
    }

    public void setPageType(String pageType) {
        if (pageType == null || pageType.equals("")){
            this.pageType = "home";
        }
        else if (pageType.equals("coperation")){
            this.pageType = "coperation";
        }
        else if (pageType.equals("otherporfolio")){
            this.pageType = "otherporfolio";
        }
        else {
            this.pageType="home";
        }
        this.pageType = pageType;
    }

    public UserFeedsPageDto(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;
        this.endPage=(int)(Math.ceil(total/1.0/ cri.getAmount()));
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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
