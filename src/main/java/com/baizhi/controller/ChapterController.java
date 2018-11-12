package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.apache.commons.io.IOUtils;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.TagException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.net.URLEncoder;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;
    @RequestMapping("/save")
    public @ResponseBody String save(Chapter chapter, MultipartFile url1, HttpServletRequest request) {

        if (url1 == null) {
            return "error";
        } else {
            try {

                String urlName = url1.getOriginalFilename();
                chapter.setUrl ("/music/" + urlName);
                //获取上传路径  相对路径 files    获取绝对路径\
                String realPath = request.getRealPath("/music");
                File filepath = new File(realPath, urlName);
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                //上传
                url1.transferTo(new File(realPath, urlName));
                chapter.setSize((float) url1.getSize() / 1024 / 1024 + "MB");
                chapter.setHour((float) getAudioLength(realPath + "/" + urlName) + "min");
                chapter.setUploadTime(new Date());
                chapterService.save(chapter);

                return "success";
            } catch (Exception e) {
                e.printStackTrace();

            }
        }

            return "error";


    }
        public static int getAudioLength(String audioPath) throws TagException, ReadOnlyFileException, CannotReadException, InvalidAudioFrameException, IOException {
            File file=new File(audioPath);
            int s=0;
            MP3File f = (MP3File)AudioFileIO.read(file);
            MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();
            s =audioHeader.getTrackLength();
            return s;
        }
    @RequestMapping("/download")
    public @ResponseBody void download(String fileName,String openStyle,HttpServletRequest request,HttpServletResponse response) throws Exception{

        //1.根据接收的文件名去服务中指定目录读取文件
        String realPath = request.getSession().getServletContext().getRealPath("/");
        //2.以文件输入流读取文件
        FileInputStream is = new FileInputStream(new File(realPath,fileName));
        //2.1 设置响应头
        response.setHeader("content-disposition", openStyle+";fileName="+URLEncoder.encode(fileName, "UTF-8"));
        //3.获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //4.使用IOUtils工具类
        IOUtils.copy(is, os);
        //5.关流
        IOUtils.closeQuietly(is);//安静关流
        IOUtils.closeQuietly(os);

    }

}
