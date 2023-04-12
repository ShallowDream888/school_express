package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.UserGroup;
import com.express.service.UserGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户组：用于用户前端身份和鉴权(UserGroup)表控制层
 */
@RestController
@RequestMapping("user_group")
public class UserGroupController extends BaseController<UserGroup, UserGroupService> {
    /**
     * 服务对象
     */
    @Autowired
    public UserGroupController(UserGroupService service) {
        setService(service);
    }

}


