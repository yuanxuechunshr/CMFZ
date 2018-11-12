package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findByPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return bannerDao.findByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return bannerDao.findTotals();
    }

    @Override
    public void delete(String id) {
        bannerDao.delete(id);
    }

    @Override
    public void update(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    public void save(Banner banner) {
        banner .setId(UUID.randomUUID().toString());
        banner.setDate(new Date());
        bannerDao.save(banner);
    }

    @Override
    public Banner findOne(String id) {
        return bannerDao.findOne(id);
    }
}
