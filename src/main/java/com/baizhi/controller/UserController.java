package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    //注册
    @RequestMapping("/right")
    public @ResponseBody Map<String,Object> right(User user){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            userService.Right(user);
            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;

    }
    //查询所有展示和分页
    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        Map<String, Object> results = new HashMap<String, Object>();
        List<User> users = userService.findByPage(page, rows);
        Long totals = userService.findTotals();
        results.put("total", totals);
        results.put("rows", users);

        return results;
    }
    //更新用户信息
    @RequestMapping("/update")
    public @ResponseBody Map<String, Object> update(User user) {
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            userService.update(user);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }
    //根据ID查询一个
    @RequestMapping("/findOne")
    public @ResponseBody User findOne(String id){
            User user = userService.findOne(id);
            return user;
    }
    @RequestMapping("/login")
    public String login(User user, HttpSession session, HttpServletRequest request){

        User  user1 = userService.Login(user.getUsername(),user.getPassword());
        session.setAttribute("user1",user1);
        String validationCode =(String) session.getAttribute("validationCode");
        String code=request.getParameter("code");
        if (validationCode.equals(code)) {
            if (user1 != null) {
                return "redirect:/main/main.jsp";
            }
        }
        return  "redirect:/login.jsp";
    }
}