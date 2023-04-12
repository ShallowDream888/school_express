package com.project.demo.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。(ForumType)表实体类
 *
 * @author xxx
 *@since 202X-XX-XX
 */
@TableName("forum_type")
@Data
@EqualsAndHashCode(callSuper = false)
public class ForumType implements Serializable {

    private static final long serialVersionUID = -89845695959527153L;

    /**
     * 分类ID：[0,10000]
     */
    @TableId(value = "type_id", type = IdType.AUTO)
    private Integer typeId;

    /**
     * 分类名称：[2,16]
     */
    @TableField(value = "name")
    private String name;

    /**
     * 描述：[0,255]描述该分类的作用
     */
    @TableField(value = "description")
    private String description;

    /**
     * 外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置
     */
    @TableField(value = "url")
    private String url;

    /**
     * 上级分类ID：[0,32767]
     */
    @TableField(value = "father_id")
    private Integer fatherId;

    /**
     * 分类图标：
     */
    @TableField(value = "icon")
    private String icon;

    /**
     * 创建时间：
     */
    @TableField(value = "create_time")
    private Timestamp createTime;

    /**
     * 更新时间：
     */
    @TableField(value = "update_time")
    private Timestamp updateTime;

}

