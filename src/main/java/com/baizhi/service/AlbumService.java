package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {
    List<Album> findAll();
    void save(Album album);
    Album findOne(String id);
}
