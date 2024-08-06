package com.bit.devops12.poro.mapper;

import com.bit.devops12.poro.model.SkillTag;
import org.apache.ibatis.annotations.Insert;

public interface SkillTagMapper {
    @Insert("INSERT INTO skilltag (SKILLNAME) VALUES (#{skillName})")
    void insertSkillTag(SkillTag skillTag);
}
