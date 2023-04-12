package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.Auth;
import com.express.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 定制授权(Auth)表控制层
 */
@RestController
@RequestMapping("auth")
public class AuthController extends BaseController<Auth, AuthService> {
    /**
     * 服务对象
     */
    @Autowired
    public AuthController(AuthService service) {
        setService(service);
    }

}


