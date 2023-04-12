package com.project.demo.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * 论坛：(Forum)表实体类
 *
 * @author xxx
 *@since 202X-XX-XX
 */
@TableName("forum")
@Data
@EqualsAndHashCode(callSuper = false)
public class Forum implements Serializable {

    private static final long serialVersionUID = -88817457497416984L;

    /**
     * 论坛id
     */
    @TableId(value = "forum_id", type = IdType.AUTO)
    private Integer forumId;

    /**
     * 排序
     */
    @TableField(value = "display")
    private Integer display;

    /**
     * 用户ID
     */
    @TableField(value = "user_id")
    private Integer userId;

    /**
     * 昵称：[0,16]
     */
    @TableField(value = "nickname")
    private String nickname;

    /**
     * 点赞数
     */
    @TableField(value = "praise_len")
    private Integer praise_len;

    /**
     * 访问数
     */
    @TableField(value = "hits")
    private Integer hits;

    /**
     * 标题
     */
    @TableField(value = "title")
    private String title;

    /**
     * 关键词
     */
    @TableField(value = "keywords")
    private String keywords;

    /**
     * 描述
     */
    @TableField(value = "description")
    private String description;

    /**
     * 来源地址
     */
    @TableField(value = "url")
    private String url;

    /**
     * 标签
     */
    @TableField(value = "tag")
    private String tag;

    /**
     * 封面图
     */
    @TableField(value = "img")
    private String img;

    /**
     * 正文
     */
    @TableField(value = "content")
    private String content;

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

    /**
     * 发帖人头像：
     */
    @TableField(value = "avatar")
    private String avatar;

    /**
     * 论坛分类：[0,1000]用来搜索指定类型的论坛帖
     */
    @TableField(value = "type")
    private String type;

}

