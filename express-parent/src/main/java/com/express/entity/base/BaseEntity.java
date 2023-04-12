package com.express.entity.base;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 *
 */
@Data
public class BaseEntity {

    @TableId
    private Integer id;
}

