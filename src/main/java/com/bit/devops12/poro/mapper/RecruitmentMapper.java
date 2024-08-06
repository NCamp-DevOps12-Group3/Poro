package com.bit.devops12.poro.mapper;

import com.bit.devops12.poro.model.Recruitment;
import org.apache.ibatis.annotations.Insert;

public interface RecruitmentMapper {

    @Insert("INSERT INTO recruitment (USER_ID, COMPANY_NAME, COMPANY_ICON_URL, RECRUITMENT_URL, RECRUITMENT_TITLE, DDAY, REGDATE, MODDATE, LOCATION, CAREER, EDUCATION) " +
            "VALUES (#{userId}, #{companyName}, #{companyIconUrl}, #{recruitmentUrl}, #{recruitmentTitle}, #{dday}, NOW(), NOW(), #{location}, #{career}, #{education})")
    void insertRecruitment(Recruitment recruitment);
}
