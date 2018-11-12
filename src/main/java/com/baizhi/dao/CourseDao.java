package com.baizhi.dao;

import com.baizhi.entity.Course;

import java.util.List;

public interface CourseDao extends BaseDAO {
    List<Course> findAllone();
    List<Course> findAlltwo();
    Course findOne(String id);

}
