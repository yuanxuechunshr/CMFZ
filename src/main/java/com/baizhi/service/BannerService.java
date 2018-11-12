package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> findByPage(Integer page, Integer rows);
    Long findTotals();
    void delete(String id);
    void update(Banner banner);
    void save(Banner banner);
    Banner findOne(String id);
}
