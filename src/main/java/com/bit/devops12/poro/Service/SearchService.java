package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.MemberDto;

import java.util.List;
import java.util.Map;

public interface SearchService {
    Map<String, Object> searchList(String searchKeyword);
}
