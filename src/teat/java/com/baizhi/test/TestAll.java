package com.baizhi.test;

import com.baizhi.dao.AdminDao;
import com.baizhi.dao.AlbumDao;
import com.baizhi.dao.BannerDao;
import com.baizhi.dao.MenuDao;
import com.baizhi.entity.*;
import com.baizhi.service.AdminService;
import com.baizhi.service.BannerService;
import com.baizhi.service.ChapterService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestAll {
    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private BannerDao bannerDao;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private AlbumDao albumDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private ChapterService chapterService;


    @Test
    public void test1(){
        Admin admin = new Admin();
        admin.setName("小王");
        admin.setUsername("xiaowang");
        admin.setPassword("123456");
        admin.setQx("1");
        adminService.Right(admin);

    }
    @Test
    public void test2(){
        Admin admin1 = adminService.Login("xiaowang", "123456");
        System.out.println(admin1);


    }
    @Test
    public  void  test3(){
        Admin admin2 = adminDao.findOne("61ac8d81-0ca7-4f97-a59a-d4f4dc1c3baf");
        System.out.println(admin2);
    }
    @Test
    public void test4(){
        List<Banner> banners = bannerDao.findByPage(0,2);
        for (Banner banner : banners) {
            System.out.println(banner);
        }

    }
    @Test
    public void  test11(){
        Banner banner = new Banner();
        banner.setId("1");
        banner.setName("修改的1");
        banner.setImgPath("1");
        banner.setStatus("55");
        banner.setDate(new Date());
        bannerService.update(banner);
    }
    @Test
    public  void test12(){
        List<Album> albums = albumDao.findAll();
        for (Album album : albums) {
            System.out.println(album);
        }

    }
    @Test
    public  void test13(){
        List<Menu> menus = menuDao.findAll();
        for (Menu menu : menus) {
            System.out.println(menu);
        }


    }
    @Test
    public void test3333(){
        Chapter chapter = new Chapter();
        chapter.setUrl("/img");
        chapter.setA_id("1");
        chapter.setName("hah");
        chapter.setHour("22");
        chapter.setSize("22");
        chapter.setUploadTime(new Date());
        chapterService.save(chapter);

    }
}

