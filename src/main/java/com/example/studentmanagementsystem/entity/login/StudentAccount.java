package com.example.studentmanagementsystem.entity.login;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("CZ_Student_account")
public class StudentAccount {
    String Sno;
    String Spwd;

    public String getSno() {
        return Sno;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public String getSpwd() {
        return Spwd;
    }

    public void setSpwd(String spwd) {
        Spwd = spwd;
    }

    @Override
    public String toString() {
        return "StudentAccount{" +
                "Sno='" + Sno + '\'' +
                ", Spwd='" + Spwd + '\'' +
                '}';
    }
}
