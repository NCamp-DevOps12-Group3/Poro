package com.bit.devops12.poro.dto;

public class CssDto {
    private int css_id;
    private int portfolio_id;
    private String css_url;

    public int getCss_id() {
        return css_id;
    }

    public void setCss_id(int css_id) {
        this.css_id = css_id;
    }

    public int getPortfolio_id() {
        return portfolio_id;
    }

    public void setPortfolio_id(int portfolio_id) {
        this.portfolio_id = portfolio_id;
    }

    public String getCss_url() {
        return css_url;
    }

    public void setCss_url(String css_url) {
        this.css_url = css_url;
    }

    @Override
    public String toString() {
        return "CssDto{" +
                "css_id=" + css_id +
                ", portfolio_id=" + portfolio_id +
                ", css_url='" + css_url + '\'' +
                '}';
    }
}
