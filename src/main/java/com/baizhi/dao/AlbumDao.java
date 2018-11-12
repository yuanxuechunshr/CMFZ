package com.baizhi.dao;

import com.baizhi.entity.Album;

public interface AlbumDao extends BaseDAO {
    Album findOne(String id);
}
