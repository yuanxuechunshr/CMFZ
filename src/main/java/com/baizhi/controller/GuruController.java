package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/guru")
public class   GuruController {

    @Autowired
    private GuruService guruService;
    @RequestMapping("/findAll")
    public @ResponseBody  Map<String,Object> findAll(Integer page, Integer rows){
        Map<String, Object> results = new HashMap<String, Object>();
        List<Guru> gurus = guruService.findByPage(page, rows);
        Long totals = guruService.findTotals();
        results.put("total", totals);
        results.put("rows", gurus);

        return results;

    }
    @RequestMapping("/deleteAll")
    public @ResponseBody Map<String,Object> deleteAll(String[] ids){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            for (String id : ids) {
                guruService.delete(id);
            }


            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }

        return results;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Guru guru, MultipartFile headPic1, HttpServletRequest request){
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            String headPicName = headPic1.getOriginalFilename();
            guru.setHeadPic("/images/"+headPicName);
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getRealPath("/images");
            //上传
            headPic1.transferTo(new File(realPath,headPic1.getOriginalFilename()));
            guruService.save(guru);

            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }
    @RequestMapping("/findOne")
    public @ResponseBody Guru findOne(String id){
        Guru guru = guruService.findOne(id);
        return guru;
    }
    @RequestMapping("/update")
    public @ResponseBody Map<String, Object> update(Guru guru, MultipartFile headPic1, HttpServletRequest request) {
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            String imgPathName = headPic1.getOriginalFilename();
            guru.setHeadPic("/images/"+imgPathName);
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getRealPath("/images");
            //上传
            headPic1.transferTo(new File(realPath,headPic1.getOriginalFilename()));
            guruService.update(guru);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }
}
