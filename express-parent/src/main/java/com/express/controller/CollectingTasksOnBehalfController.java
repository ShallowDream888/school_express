package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.CollectingTasksOnBehalf;
import com.express.service.CollectingTasksOnBehalfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 代领任务：(CollectingTasksOnBehalf)表控制层
 */
@RestController
@RequestMapping("/collecting_tasks_on_behalf")
public class CollectingTasksOnBehalfController extends BaseController<CollectingTasksOnBehalf, CollectingTasksOnBehalfService> {

    /**
     * 代领任务对象
     */
    @Autowired
    public CollectingTasksOnBehalfController(CollectingTasksOnBehalfService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String, Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
