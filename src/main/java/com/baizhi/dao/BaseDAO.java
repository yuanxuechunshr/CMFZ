package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDAO<T> {

    void save(T t);

    void update(T t);

    void delete(String id);


    T findOne(String id);

    List<T> findAll();

    //参数1:起始条数 //参数2:每页显示的记录数
    List<T> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);

    Long findTotals();
}
