package com.baizhi.dao;

import com.baizhi.entity.Guru;

public interface GuruDao extends BaseDAO{
    Guru findOne(String id);

}
