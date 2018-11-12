package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao extends BaseDAO {
    void Right(User user);
    User findOne(String id);
    User Login(@Param("username") String username, @Param("password") String password);
}
