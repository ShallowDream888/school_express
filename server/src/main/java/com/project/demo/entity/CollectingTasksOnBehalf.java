package com.project.demo.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 代领任务：(CollectingTasksOnBehalf)表实体类
 *
 */
@TableName("`collecting_tasks_on_behalf`")
@Data
@EqualsAndHashCode(callSuper = false)
public class CollectingTasksOnBehalf implements Serializable {

    // CollectingTasksOnBehalf编号
    @TableId(value = "collecting_tasks_on_behalf_id", type = IdType.AUTO)
    private Integer collecting_tasks_on_behalf_id;

    // 任务编号
    @TableField(value = "`task_number`")
    private String task_number;
    // 任务名称
    @TableField(value = "`task_name`")
    private String task_name;
    // 发布用户
    @TableField(value = "`publishing_users`")
    private Integer publishing_users;
    // 物品图片
    @TableField(value = "`item_picture`")
    private String item_picture;
    // 物品重量
    @TableField(value = "`item_weight`")
    private String item_weight;
    // 物品类型
    @TableField(value = "`item_type`")
    private String item_type;
    // 订单数量
    @TableField(value = "`order_quantity`")
    private String order_quantity;
    // 取货地址
    @TableField(value = "`pickup_address`")
    private String pickup_address;
    // 送货地址
    @TableField(value = "`shipping_address`")
    private String shipping_address;
    // 任务佣金
    @TableField(value = "`task_commission`")
    private String task_commission;

    // 点击数
    @TableField(value = "hits")
    private Integer hits;

    // 点赞数
    @TableField(value = "praise_len")
    private Integer praise_len;








    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;







}
