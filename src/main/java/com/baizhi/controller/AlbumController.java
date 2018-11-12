package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
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
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;
    @RequestMapping("/findAll")
    public @ResponseBody List<Album> findAll(){
        List<Album> albums = albumService.findAll();


        return albums;

    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Album album,MultipartFile coverImg1, HttpServletRequest request){
        Map<String, Object> results = new HashMap<String, Object>();
        System.out.println("运行到这");
        try {
            String CoverImgName = coverImg1.getOriginalFilename();
            album.setCoverImg("/images/"+CoverImgName);
            //获取上传路径  相对路径 files    获取绝对路径
            String realPath = request.getRealPath("/images");
            //上传
            coverImg1.transferTo(new File(realPath,coverImg1.getOriginalFilename()));
            albumService.save(album);

            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }

        return results;

    }
    @RequestMapping("/findOne")
    public @ResponseBody Album findOne(String id){
    Album album = albumService.findOne(id);
    return album;
    }

}
