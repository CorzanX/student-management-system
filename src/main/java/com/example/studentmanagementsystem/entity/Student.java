package com.example.studentmanagementsystem.entity;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("CZ_Students")
public class Student {
    String Sno;
    String Sname;
    String Ssex;
    String Sarea;
    Integer Sage;
    Integer Scredits;
    String Clsno;

    public String getSno() {
        return Sno;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getSsex() {
        return Ssex;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }

    public String getSarea() {
        return Sarea;
    }

    public void setSarea(String sarea) {
        Sarea = sarea;
    }

    public Integer getSage() {
        return Sage;
    }

    public void setSage(Integer sage) {
        Sage = sage;
    }

    public Integer getScredits() {
        return Scredits;
    }

    public void setScredits(Integer scredits) {
        Scredits = scredits;
    }

    public String getClsno() {
        return Clsno;
    }

    public void setClsno(String clsno) {
        Clsno = clsno;
    }

    @Override
    public String toString() {
        return "Student{" +
                "Sno='" + Sno + '\'' +
                ", Sname='" + Sname + '\'' +
                ", Ssex='" + Ssex + '\'' +
                ", Sarea='" + Sarea + '\'' +
                ", Sage=" + Sage +
                ", Scredits=" + Scredits +
                ", Clsno='" + Clsno + '\'' +
                '}';
    }
}
