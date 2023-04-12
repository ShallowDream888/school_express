package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.Praise;
import com.express.service.PraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 点赞：(Praise)表控制层
 *
 */
@RestController
@RequestMapping("praise")
public class PraiseController extends BaseController<Praise, PraiseService> {
    /**
     * 服务对象
     */
    @Autowired
    public PraiseController(PraiseService service) {
        setService(service);
    }

}


