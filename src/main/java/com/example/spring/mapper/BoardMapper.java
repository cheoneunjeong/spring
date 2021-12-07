package com.example.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.spring.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();

	public void reg(String title, String content);

}
