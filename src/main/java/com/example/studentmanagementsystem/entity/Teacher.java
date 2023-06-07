package com.example.studentmanagementsystem.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.models.auth.In;

@TableName("CZ_Teachers")
public class Teacher {
    String Tno;
    String Tname;
    String Tsex;
    Integer Tage;
    String Tjobtitle;
    String Tphone;

    public String getTno() {
        return Tno;
    }

    public void setTno(String tno) {
        Tno = tno;
    }

    public String getTname() {
        return Tname;
    }

    public void setTname(String tname) {
        Tname = tname;
    }

    public String getTsex() {
        return Tsex;
    }

    public void setTsex(String tsex) {
        Tsex = tsex;
    }

    public Integer getTage() {
        return Tage;
    }

    public void setTage(Integer tage) {
        Tage = tage;
    }

    public String getTjobtitle() {
        return Tjobtitle;
    }

    public void setTjobtitle(String tjobtitle) {
        Tjobtitle = tjobtitle;
    }

    public String getTphone() {
        return Tphone;
    }

    public void setTphone(String tphone) {
        Tphone = tphone;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "Tno='" + Tno + '\'' +
                ", Tname='" + Tname + '\'' +
                ", Tsex='" + Tsex + '\'' +
                ", Tage=" + Tage +
                ", Tjobtitle='" + Tjobtitle + '\'' +
                ", Tphone='" + Tphone + '\'' +
                '}';
    }
}
