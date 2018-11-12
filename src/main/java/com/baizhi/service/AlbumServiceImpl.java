package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements  AlbumService{
    @Autowired
    private AlbumDao albumDao;
    @Override
    public List<Album> findAll() {
        return albumDao.findAll();
    }

    @Override
    public void save(Album album) {
        album.setId(UUID.randomUUID().toString());
        albumDao.save(album);
    }

    @Override
    public Album findOne(String id) {
        return albumDao.findOne(id);
    }


}
