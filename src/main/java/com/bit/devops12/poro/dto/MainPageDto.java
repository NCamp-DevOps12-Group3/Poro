package com.bit.devops12.poro.dto;

public class MainPageDto {
    private int endPage;
    private MainCriteria mainCri;
    private int total;

    public MainPageDto(MainCriteria mainCri, int total) {
        this.mainCri = mainCri;
        this.total = total;

        this.endPage = (int)(Math.ceil((total / 1.0) / mainCri.getAmount()));
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public MainCriteria getMainCri() {
        return mainCri;
    }

    public void setMainCri(MainCriteria mainCri) {
        this.mainCri = mainCri;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "NoticePageDto{" +
                "endPage=" + endPage +
                ", mainCri=" + mainCri +
                ", total=" + total +
                '}';
    }
}
