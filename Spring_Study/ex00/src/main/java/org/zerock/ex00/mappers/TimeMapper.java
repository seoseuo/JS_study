package org.zerock.ex00.mappers;


import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

    @Select("SELECT NOW()")
    String getTime();
    String getTime2();
}
