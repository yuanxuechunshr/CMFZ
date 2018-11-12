package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;

@Controller
@RequestMapping("/banner")
public class BannerController {

    @Autowired
    private BannerService bannerService;

    @RequestMapping("/findAll")
    public @ResponseBody
    Map<String, Object> findAll(Integer page, Integer rows) {
        Map<String, Object> results = new HashMap<String, Object>();
        List<Banner> banners = bannerService.findByPage(page, rows);
        Long totals = bannerService.findTotals();
        results.put("total", totals);
        results.put("rows", banners);

        return results;
    }

    @RequestMapping("/delete")
    public @ResponseBody
    Map<String, Object> delete(String id) {
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            bannerService.delete(id);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }

    @RequestMapping("/deleteAll")
    public @ResponseBody Map<String,Object> deleteAll(String[] ids){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            for (String id : ids) {
                bannerService.delete(id);
            }


            results.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }

        return results;
    }


    @RequestMapping("/update")
    public @ResponseBody Map<String, Object> update(Banner banner, MultipartFile imgPath1, HttpServletRequest request) {
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            String imgPathName = imgPath1.getOriginalFilename();
            banner.setImgPath("/images/"+imgPathName);
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getRealPath("/images");
            //上传
            imgPath1.transferTo(new File(realPath,imgPath1.getOriginalFilename()));
            bannerService.update(banner);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }
    @RequestMapping("/save")
    public  @ResponseBody Map<String,Object> save(Banner banner, MultipartFile imgPath1, HttpServletRequest request){

        Map<String, Object> results = new HashMap<String, Object>();
        try {
         String imgPathName = imgPath1.getOriginalFilename();
          banner.setImgPath("/images/"+imgPathName);
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getRealPath("/images");
            //上传
            imgPath1.transferTo(new File(realPath,imgPath1.getOriginalFilename()));
            bannerService.save(banner);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;
    }
    @RequestMapping("/findOne")
    public @ResponseBody Banner findOne(String id){
        Banner banner = bannerService.findOne(id);
        return banner;

    }
}
