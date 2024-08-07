package com.bit.devops12.poro.dto;

public class HtmlDto {
    private int html_id;
    private int portfolio_id;
    private String html_url;

    public int getHtml_id() {
        return html_id;
    }

    public void setHtml_id(int html_id) {
        this.html_id = html_id;
    }

    public int getPortfolio_id() {
        return portfolio_id;
    }

    public void setPortfolio_id(int portfolio_id) {
        this.portfolio_id = portfolio_id;
    }

    public String getHtml_url() {
        return html_url;
    }

    public void setHtml_url(String html_url) {
        this.html_url = html_url;
    }

    @Override
    public String toString() {
        return "HtmlDto{" +
                "html_id=" + html_id +
                ", portfolio_id=" + portfolio_id +
                ", html_url='" + html_url + '\'' +
                '}';
    }
}
