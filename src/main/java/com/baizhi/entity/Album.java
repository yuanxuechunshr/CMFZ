package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Album {
    private String id;
    private String name;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date publishDate;
    private String coverImg;
    private String star;
    private String author;
    private String broadCasts;
    private String brief;
    private List<Chapter> children;

    public Album() {
    }

    public Album(String id, String name, Date publishDate, String coverImg, String star, String author, String broadCasts, String brief, List<Chapter> children) {
        this.id = id;
        this.name = name;
        this.publishDate = publishDate;
        this.coverImg = coverImg;
        this.star = star;
        this.author = author;
        this.broadCasts = broadCasts;
        this.brief = brief;
        this.children = children;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", publishDate=" + publishDate +
                ", coverImg='" + coverImg + '\'' +
                ", star='" + star + '\'' +
                ", author='" + author + '\'' +
                ", broadCasts='" + broadCasts + '\'' +
                ", brief='" + brief + '\'' +
                ", children=" + children +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBroadCasts() {
        return broadCasts;
    }

    public void setBroadCasts(String broadCasts) {
        this.broadCasts = broadCasts;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public List<Chapter> getChildren() {
        return children;
    }

    public void setChildren(List<Chapter> children) {
        this.children = children;
    }
}
