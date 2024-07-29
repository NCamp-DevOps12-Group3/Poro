package com.bit.devops12.poro.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PortfolioDto {
    private int portfolioid;
    private int userid;
    private String cssurl;
    private String jsurl;
    private String htmlurl;
    private String thumbnailurl;
    private LocalDateTime regdate;
    private String skillname;
    private String content;
    private List<String> htmlCode;
    private List<String> cssCode;
    private List<String> jsCode;
    private String mergeCode;

    public String getMergeCode() {
        return mergeCode;
    }

    public void setMergeCode(String mergeCode) {
        this.mergeCode = mergeCode;
    }

    public List<String> getHtmlCode() {
        return htmlCode;
    }

    public void setHtmlCode(List<String> htmlCode) {
        this.htmlCode = htmlCode;
    }

    public List<String> getCssCode() {
        return cssCode;
    }


    public void setCssCode(List<String> cssCode) {
        this.cssCode = cssCode;
    }

    public List<String> getJsCode() {
        return jsCode;
    }

    public void setJsCode(List<String> jsCode) {
        this.jsCode = jsCode;
    }

    public List<String> getCssList(){
        return Arrays.stream(cssurl.split(",")).toList();
    }

    public List<String> getJsList(){
        return Arrays.stream(jsurl.split(",")).toList();
    }

    public List<String> getHtmlList(){
        return Arrays.stream(htmlurl.split(",")).toList();
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPortfolioid() {
        return portfolioid;
    }

    public void setPortfolioid(int portfolioid) {
        this.portfolioid = portfolioid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getCssurl() {
        return cssurl;
    }

    public void setCssurl(String cssurl) {
        this.cssurl = cssurl;
    }

    public String getJsurl() {
        return jsurl;
    }

    public void setJsurl(String jsurl) {
        this.jsurl = jsurl;
    }

    public String getHtmlurl() {
        return htmlurl;
    }

    public void setHtmlurl(String htmlurl) {
        this.htmlurl = htmlurl;
    }

    public String getThumbnailurl() {
        return thumbnailurl;
    }

    public void setThumbnailurl(String thumbnailurl) {
        this.thumbnailurl = thumbnailurl;
    }

    public LocalDateTime getRegdate() {
        return regdate;
    }

    public void setRegdate(LocalDateTime regdate) {
        this.regdate = regdate;
    }

    public String getSkillname() {
        return skillname;
    }

    public void setSkillname(String skillname) {
        this.skillname = skillname;
    }
}
