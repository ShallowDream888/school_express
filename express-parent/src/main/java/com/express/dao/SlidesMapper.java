package com.express.dao;

import java.util.List;

import com.express.dao.base.BaseMapper;
import com.express.entity.Slides;

/**
 * 轮播图：Mapper接口
 *
 */
public interface SlidesMapper extends BaseMapper<Slides>
{
    /**
     * 查询轮播图：
     *
     * @param slidesId 轮播图：ID
     * @return 轮播图：
     */
    Slides selectSlidesById(Integer slidesId);

    /**
     * 查询轮播图：列表
     *
     * @param slides 轮播图：
     * @return 轮播图：集合
     */
    List<Slides> selectSlidesList(Slides slides);

    /**
     * 新增轮播图：
     *
     * @param slides 轮播图：
     * @return 结果
     */
    int insertSlides(Slides slides);

    /**
     * 修改轮播图：
     *
     * @param slides 轮播图：
     * @return 结果
     */
    int updateSlides(Slides slides);

    /**
     * 删除轮播图：
     *
     * @param slidesId 轮播图：ID
     * @return 结果
     */
    int deleteSlidesById(Integer slidesId);

    /**
     * 批量删除轮播图：
     *
     * @param slidesIds 需要删除的数据ID
     * @return 结果
     */
    int deleteSlidesByIds(Integer[] slidesIds);
}
