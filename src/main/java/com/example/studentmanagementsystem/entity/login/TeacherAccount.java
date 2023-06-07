package com.example.studentmanagementsystem.entity.login;

import com.baomidou.mybatisplus.annotation.TableName;

@TableName("CZ_Teacher_account")
public class TeacherAccount {
    String Tno;
    String Tpwd;

    public String getTno() {
        return Tno;
    }

    public void setTno(String tno) {
        Tno = tno;
    }

    public String getTpwd() {
        return Tpwd;
    }

    public void setTpwd(String tpwd) {
        Tpwd = tpwd;
    }

    @Override
    public String toString() {
        return "TeacherAccount{" +
                "Tno='" + Tno + '\'' +
                ", Tpwd='" + Tpwd + '\'' +
                '}';
    }
}
