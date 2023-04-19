package com.express.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 代领订单：(PickingOrder)表实体类
 */
@TableName("`picking_order`")
@Data
@EqualsAndHashCode(callSuper = false)
public class PickingOrder implements Serializable {

    // PickingOrder编号
    @TableId(value = "picking_order_id", type = IdType.AUTO)
    private Integer picking_order_id;

    // 任务编号
    @TableField(value = "`task_number`")
    private String task_number;
    // 任务名称
    @TableField(value = "`task_name`")
    private String task_name;
    // 发布用户
    @TableField(value = "`publishing_users`")
    private Integer publishing_users;
    // 物品重量
    @TableField(value = "`item_weight`")
    private String item_weight;
    // 物品类型
    @TableField(value = "`item_type`")
    private String item_type;
    // 取货地址
    @TableField(value = "`pickup_address`")
    private String pickup_address;
    // 送货地址
    @TableField(value = "`shipping_address`")
    private String shipping_address;
    // 任务佣金
    @TableField(value = "`task_commission`")
    private String task_commission;
    // 领取数量
    @TableField(value = "`quantity_received`")
    private String quantity_received;
    // 取货码
    @TableField(value = "`pickup_code`")
    private String pickup_code;
    // 跑腿用户
    @TableField(value = "`runner`")
    private Integer runner;
    // 姓名
    @TableField(value = "`full_name`")
    private String full_name;
    // 订单状态
    @TableField(value = "`order_status`")
    private String order_status;


    // 支付状态
    @TableField(value = "pay_state")
    private String pay_state;

    // 支付类型: 微信、支付宝、网银
    @TableField(value = "pay_type")
    private String pay_type;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;

    @TableField(value = "user_phone")
    private String user_phone;
}
