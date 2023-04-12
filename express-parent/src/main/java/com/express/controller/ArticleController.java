package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.Article;
import com.express.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文章：用于内容管理系统的文章(Article)表控制层
 */
@RestController
@RequestMapping("article")
public class ArticleController extends BaseController<Article, ArticleService> {
    /**
     * 服务对象
     */
    @Autowired
    public ArticleController(ArticleService service) {
        setService(service);
    }

}


