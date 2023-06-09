package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.Runner;
import com.express.service.RunnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 跑腿用户：(Runner)表控制层
 */
@RestController
@RequestMapping("/runner")
public class RunnerController extends BaseController<Runner, RunnerService> {

    /**
     * 跑腿用户对象
     */
    @Autowired
    public RunnerController(RunnerService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String, Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapstudent_number = new HashMap<>();
        mapstudent_number.put("student_number", String.valueOf(paramMap.get("student_number")));
        List liststudent_number = service.selectBaseList(service.select(mapstudent_number, new HashMap<>()));
        if (liststudent_number.size() > 0) {
            return error(30000, "字段学号内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
