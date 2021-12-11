package com.example.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.spring.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
	
	public List<Board> selectBoardList_p(int reqPage);

	public void reg1(Board board);
	
	public void reg2(Board board);

	public Board selectviewDetail(int bid);

	public void deletePost(int delid);

	public void fixdo(Board board);

	public int getPostCount();

	public void addhit(int bid);

	public void regComment(Board board);
	
	public void regComment2(Board board);
	
}
