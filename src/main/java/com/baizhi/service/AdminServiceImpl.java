package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

import static org.apache.commons.codec.digest.DigestUtils.md5Hex;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin Login(@Param("username") String username, @Param("password") String password) {

        String s = md5Hex(password);

            Admin admin = adminDao.Login(username,s);
            return  admin;


    }

    @Override
    public void update(Admin admin) {
        String s=md5Hex(admin.getPassword());
        admin.setPassword(s);
        adminDao.update(admin);
    }

    @Override
    public Admin findOne(String id) {

        return adminDao.findOne(id);
    }


    @Override
    public void Right(Admin admin) {

        String s = md5Hex(admin.getPassword());
        admin.setPassword(s);
        admin.setId(UUID.randomUUID().toString());
        adminDao.Right(admin);
    }
}
