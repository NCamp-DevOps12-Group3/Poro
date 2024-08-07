package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.HtmlDto;
import com.bit.devops12.poro.dto.JavascriptDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JavascriptDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public JavascriptDao(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    public void insertJavascript(JavascriptDto javascriptDto){
        mybatis.insert("JavascriptDao.insertJs", javascriptDto);
    }

}
