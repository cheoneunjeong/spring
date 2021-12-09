package com.example.spring.service;

import java.util.List;

import com.example.spring.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();
	
	public List<Board> selectBoardList_p(int reqPage);

	public void reg(Board board);

	public Board viewDetail(int bid);

	public void deletePost(int delid);

	public void fixdo(Board board);

	public int getPostCount();

}
