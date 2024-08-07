package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.UserFeedsMessageDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MessageDao {
    private SqlSessionTemplate mybatis;
    @Autowired
    public MessageDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public boolean sendMessage(Map<String, Object> map) {
        mybatis.insert("MessageDao.sendMessage", map);
        return true;
    }

    public List<UserFeedsMessageDto> getMessages(Integer userId) {
        return mybatis.selectList("MessageDao.getMessages", userId);
    }

    public boolean deleteMessages(List<Integer> messageIds) {
        mybatis.delete("MessageDao.deleteMessages",messageIds);
        return true;
    }
}
