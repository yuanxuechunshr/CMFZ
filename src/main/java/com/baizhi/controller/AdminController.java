package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.service.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/right")
    public @ResponseBody Map<String,Object> right(Admin admin){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            adminService.Right(admin);
            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;

    }
    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session,HttpServletRequest request){

        Admin  admin1 = adminService.Login(admin.getUsername(),admin.getPassword());
         session.setAttribute("admin1",admin1);
        String validationCode =(String) session.getAttribute("validationCode");
        String code=request.getParameter("code");


        if (validationCode.equals(code)) {
            if (admin1 != null) {
                return "redirect:/main/main.jsp";
            }
        }
        return  "redirect:/login.jsp";
    }

    @RequestMapping("/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/adminOut")
    public String adminOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login.jsp";


    }
    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Admin admin){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            adminService.update(admin);
            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }
    @RequestMapping("/findOne")
    public @ResponseBody Admin queryOne(String id){
        Admin admin = adminService.findOne(id);

        return admin;
    }


    }

