package com.example.studentmanagementsystem.entity.login;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("CZ_Admin_account")
public class AdminAccount {
    private String Admno;
    private String Admpwd;

    public String getAdmno() {
        return Admno;
    }

    public void setAdmno(String admno) {
        Admno = admno;
    }

    public String getAdmpwd() {
        return Admpwd;
    }

    public void setAdmpwd(String admpwd) {
        Admpwd = admpwd;
    }

    @Override
    public String toString() {
        return "adminAccount{" +
                "Admno='" + Admno + '\'' +
                ", Admpwd='" + Admpwd + '\'' +
                '}';
    }
}
