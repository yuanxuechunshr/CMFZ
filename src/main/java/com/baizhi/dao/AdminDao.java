package com.baizhi.dao;

import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    void Right(Admin admin);
    Admin Login(@Param("username") String username, @Param("password") String password);
    void update(Admin admin);
    Admin findOne(String id);
}
