package com.example.studentmanagementsystem.entity;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("CZ_Class")
public class Class {
    String Clsno;
    String Clsname;
    String Mno;

    public String getClsno() {
        return Clsno;
    }

    public void setClsno(String clsno) {
        Clsno = clsno;
    }

    public String getClsname() {
        return Clsname;
    }

    public void setClsname(String clsname) {
        Clsname = clsname;
    }

    public String getMno() {
        return Mno;
    }

    public void setMno(String mno) {
        Mno = mno;
    }
}
