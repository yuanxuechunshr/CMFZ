package com.baizhi.entity;

import java.util.List;

public class Menu {
    private String id;
    private String name;
    private String iconCls;
    private String href;
    private String parentld_id;
    private List<Menu> children;

    public Menu() {
    }

    public Menu(String id, String name, String iconCls, String href, String parentld_id, List<Menu> children) {
        this.id = id;
        this.name = name;
        this.iconCls = iconCls;
        this.href = href;
        this.parentld_id = parentld_id;
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", href='" + href + '\'' +
                ", parentld_id='" + parentld_id + '\'' +
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

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getParentld_id() {
        return parentld_id;
    }

    public void setParentld_id(String parentld_id) {
        this.parentld_id = parentld_id;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
