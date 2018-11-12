package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService {
    List<Guru> findByPage(Integer page,Integer rows);
    Long findTotals();
    void save(Guru guru);
    void update(Guru guru);
    void delete(String id);
    Guru findOne(String id);


}
