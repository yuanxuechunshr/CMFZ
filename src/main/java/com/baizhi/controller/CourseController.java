package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/findAllone")
    public @ResponseBody List<Course> findAllone(){
        List<Course> courses = courseService.findAllone();


        return courses;

    }
    @RequestMapping("/findAlltwo")
    public @ResponseBody List<Course> findAlltwo(){
        List<Course> courses = courseService.findAlltwo();


        return courses;

    }
    @RequestMapping("/findOne")
    public @ResponseBody Course findOne(String id){
                return courseService.findOne(id);
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Course course){
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            courseService.update(course);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }

}
