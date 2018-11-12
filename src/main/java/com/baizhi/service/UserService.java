package com.baizhi.service;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    List<User> findByPage(Integer page, Integer rows);
    Long findTotals();
    void update(User user);
    User findOne(String id);
    void Right(User user);
     User Login(@Param("username") String username, @Param("password") String password);

}
