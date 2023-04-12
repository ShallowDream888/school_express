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
 * 雇主用户：(EmployerUser)表实体类
 */
@TableName("`employer_user`")
@Data
@EqualsAndHashCode(callSuper = false)
public class EmployerUser implements Serializable {

    // EmployerUser编号
    @TableId(value = "employer_user_id", type = IdType.AUTO)
    private Integer employer_user_id;

    // 学号
    @TableField(value = "`student_number`")
    private String student_number;
    // 姓名
    @TableField(value = "`full_name`")
    private String full_name;
    // 性别
    @TableField(value = "`gender`")
    private String gender;
    // 专业
    @TableField(value = "`major`")
    private String major;
    // 院系
    @TableField(value = "`department`")
    private String department;
    // 宿舍
    @TableField(value = "`dormitory`")
    private String dormitory;


    // 用户编号
    @TableField(value = "user_id")
    private Integer userId;


    // 更新时间
    @TableField(value = "update_time")
    private Timestamp update_time;

    // 创建时间
    @TableField(value = "create_time")
    private Timestamp create_time;


}
