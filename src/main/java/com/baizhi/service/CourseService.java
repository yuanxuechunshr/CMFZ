package com.baizhi.service;

import com.baizhi.entity.Course;

import java.util.List;

public interface CourseService {
    List<Course> findAllone();
    List<Course> findAlltwo();
    Course findOne(String id);
    void update(Course course);

}
