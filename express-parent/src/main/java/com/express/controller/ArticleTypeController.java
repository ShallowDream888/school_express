package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.ArticleType;
import com.express.service.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文章频道：用于汇总浏览文章，在不同频道下展示不同文章。(ArticleType)表控制层
 *
 */
@RestController
@RequestMapping("article_type")
public class ArticleTypeController extends BaseController<ArticleType, ArticleTypeService> {
    /**
     * 服务对象
     */
    @Autowired
    public ArticleTypeController(ArticleTypeService service) {
        setService(service);
    }

}


