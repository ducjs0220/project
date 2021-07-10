package com.study.project.user.service;

import com.study.project.user.domain.UserVO;

public interface UserService {

    // 회원 가입 처리
    void register(UserVO userVO) throws Exception;

}
