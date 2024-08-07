package com.bit.devops12.poro.dto;

public class MiniProjectPageDto {
    private int endPage;
    private MiniProjectCriteria miniProjectCri;
    private int total;

    public MiniProjectPageDto(MiniProjectCriteria miniProjectCri, int total) {
        this.miniProjectCri = miniProjectCri;
        this.total = total;

        this.endPage = (int)(Math.ceil((total / 1.0) / miniProjectCri.getAmount()));
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public MiniProjectCriteria getMiniProjectCri() {
        return miniProjectCri;
    }

    public void setMiniProjectCri(MiniProjectCriteria miniProjectCri) {
        this.miniProjectCri = miniProjectCri;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "MiniProjectPageDto{" +
                "endPage=" + endPage +
                ", miniProjectCri=" + miniProjectCri +
                ", total=" + total +
                '}';
    }
}
