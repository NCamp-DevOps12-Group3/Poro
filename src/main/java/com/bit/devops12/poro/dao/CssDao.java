package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.CssDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CssDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public CssDao(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    public void insertCss(CssDto cssDto){
        mybatis.insert("CssDao.insertCss", cssDto);
    }
}
