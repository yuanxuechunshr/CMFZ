package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private String id;
    private Integer phoneNum;
    private String username;
    private String password;
    private String city;
    private String name;
    private  String sex;
    private String sign;
    private String headImg;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date addtime;
    private String marking1;
    private String marking2;
    private String c1_id;
    private String c2_id;
    private String start;


    public User() {
    }

    public User(String id, Integer phoneNum, String username, String password, String city, String name, String sex, String sign, String headImg, Date addtime, String marking1, String marking2, String c1_id, String c2_id, String start) {
        this.id = id;
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.city = city;
        this.name = name;
        this.sex = sex;
        this.sign = sign;
        this.headImg = headImg;
        this.addtime = addtime;
        this.marking1 = marking1;
        this.marking2 = marking2;
        this.c1_id = c1_id;
        this.c2_id = c2_id;
        this.start = start;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", phoneNum=" + phoneNum +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", city='" + city + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", sign='" + sign + '\'' +
                ", headImg='" + headImg + '\'' +
                ", addtime=" + addtime +
                ", marking1='" + marking1 + '\'' +
                ", marking2='" + marking2 + '\'' +
                ", c1_id='" + c1_id + '\'' +
                ", c2_id='" + c2_id + '\'' +
                ", start='" + start + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(Integer phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getMarking1() {
        return marking1;
    }

    public void setMarking1(String marking1) {
        this.marking1 = marking1;
    }

    public String getMarking2() {
        return marking2;
    }

    public void setMarking2(String marking2) {
        this.marking2 = marking2;
    }

    public String getC1_id() {
        return c1_id;
    }

    public void setC1_id(String c1_id) {
        this.c1_id = c1_id;
    }

    public String getC2_id() {
        return c2_id;
    }

    public void setC2_id(String c2_id) {
        this.c2_id = c2_id;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }
}
