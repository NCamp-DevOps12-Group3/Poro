package com.bit.devops12.poro.service;

import com.bit.devops12.poro.mapper.RecruitmentMapper;
import com.bit.devops12.poro.model.Recruitment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecruitmentService {

    @Autowired
    private RecruitmentMapper recruitmentMapper;

    public void saveRecruitment(Recruitment recruitment) {
        recruitmentMapper.insertRecruitment(recruitment);
    }
}
