package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

import static org.apache.commons.codec.digest.DigestUtils.md5Hex;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Override
    public User Login(String username, String password) {
        String s = md5Hex(password);
        User user = userDao.Login(username,s);
        return user;
    }

    @Autowired
    private UserDao userDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findByPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return userDao.findByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return userDao.findTotals();
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User findOne(String id) {
        return userDao.findOne(id);
    }

    @Override
    public void Right(User user) {
        String s = md5Hex(user.getPassword());
        user.setPassword(s);
        user.setId(UUID.randomUUID().toString());
        userDao.Right(user);

    }
}
