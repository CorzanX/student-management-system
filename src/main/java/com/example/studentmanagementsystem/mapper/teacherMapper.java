package com.example.studentmanagementsystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface teacherMapper {
    @Select("SELECT * " +
            " FROM CZ_Teachers" +
            " WHERE  Tno = CONCAT(#{Tno}, '') ")
    List<Map<String, Object>> getTeacherInfo(String Tno);

    List<Map<String, Object>> getTeacherCrs(String Tno);
}
