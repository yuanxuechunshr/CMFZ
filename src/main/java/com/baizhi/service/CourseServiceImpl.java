package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    @Override
    public List<Course> findAllone() {

        return courseDao.findAllone();
    }

    @Override
    public List<Course> findAlltwo() {
        return courseDao.findAlltwo();
    }

    @Override
    public Course findOne(String id) {
        return courseDao.findOne(id);
    }

    @Override
    public void update(Course course) {
        course.setCreatTime(new Date());
        courseDao.update(course);
    }
}
