package com.bit.devops12.poro.dto;

public class JavascriptDto {
    private int javascript_id;
    private int portfolio_id;
    private String javascript_url;

    public int getJavascript_id() {
        return javascript_id;
    }

    public void setJavascript_id(int javascript_id) {
        this.javascript_id = javascript_id;
    }

    public int getPortfolio_id() {
        return portfolio_id;
    }

    public void setPortfolio_id(int portfolio_id) {
        this.portfolio_id = portfolio_id;
    }

    public String getJavascript_url() {
        return javascript_url;
    }

    public void setJavascript_url(String javascript_url) {
        this.javascript_url = javascript_url;
    }

    @Override
    public String toString() {
        return "JavascriptDto{" +
                "javascript_id=" + javascript_id +
                ", portfolio_id=" + portfolio_id +
                ", javascript_url='" + javascript_url + '\'' +
                '}';
    }
}
