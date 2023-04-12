package com.project.demo.controller;

import com.project.demo.controller.base.BaseController;
import com.project.demo.entity.ForumType;
import com.project.demo.service.ForumTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。(ForumType)表控制层
 */
@RestController
@RequestMapping("forum_type")
public class ForumTypeController extends BaseController<ForumType, ForumTypeService> {
    /**
     * 服务对象
     */
    @Autowired
    public ForumTypeController(ForumTypeService service) {
        setService(service);
    }

}


