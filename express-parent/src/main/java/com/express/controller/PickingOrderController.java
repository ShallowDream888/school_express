package com.express.controller;

import com.express.controller.base.BaseController;
import com.express.entity.PickingOrder;
import com.express.service.PickingOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 代领订单：(PickingOrder)表控制层
 *
 */
@RestController
@RequestMapping("/picking_order")
public class PickingOrderController extends BaseController<PickingOrder, PickingOrderService> {

    /**
     * 代领订单对象
     */
    @Autowired
    public PickingOrderController(PickingOrderService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(picking_order_id) AS max FROM "+"picking_order";
        Integer max = service.selectBaseCount(sql);
        sql = ("SELECT count(*) count FROM `collecting_tasks_on_behalf` INNER JOIN `picking_order` ON collecting_tasks_on_behalf.task_number=picking_order.task_number WHERE collecting_tasks_on_behalf.order_quantity < picking_order.quantity_received AND picking_order.picking_order_id="+max).replaceAll("&#60;","<");
        Integer count = service.selectBaseCount(sql);
        if(count>0){
            sql = "delete from "+"picking_order"+" WHERE "+"picking_order_id"+" ="+max;
            service.deleteBaseSql(sql);
            return error(30000,"订单已被他人接取!");
        }
        sql = "UPDATE `collecting_tasks_on_behalf` INNER JOIN `picking_order` ON collecting_tasks_on_behalf.task_number=picking_order.task_number SET collecting_tasks_on_behalf.order_quantity= collecting_tasks_on_behalf.order_quantity - picking_order.quantity_received WHERE picking_order.picking_order_id="+max;
        service.updateBaseSql(sql);
        return success(1);
    }

}
