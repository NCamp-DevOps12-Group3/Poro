package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.HtmlDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HtmlDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public HtmlDao(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    public void insertHtml(HtmlDto htmlDto){
        mybatis.insert("HtmlDao.insertHtml", htmlDto);
    }
}
