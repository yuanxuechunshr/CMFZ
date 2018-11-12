package com.baizhi.dao;

import com.baizhi.entity.Banner;

public interface BannerDao extends BaseDAO{
    Banner findOne(String id);
}
