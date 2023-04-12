package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.Forum;
import com.express.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 论坛：(Forum)表控制层
 */
@RestController
@RequestMapping("forum")
public class ForumController extends BaseController<Forum, ForumService> {
    /**
     * 服务对象
     */
    @Autowired
    public ForumController(ForumService service) {
        setService(service);
    }

}


