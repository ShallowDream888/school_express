package com.express.service;

import com.express.dao.UserMapper;
import com.express.entity.User;
import com.express.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户账户：用于保存用户登录信息(User)表服务接口
 *
 */
@Service
public class UserService extends BaseService<User> {

    @Autowired
    UserMapper userMapper;

    public String selectExamineState(String sourceTable, Integer userId) {
        return userMapper.selectExamineState(sourceTable,userId);
    }
}


