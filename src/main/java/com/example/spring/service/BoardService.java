package com.example.spring.service;

import java.util.List;

import com.example.spring.domain.Board;

public interface BoardService {
	public List<Board> selectBoardList();

	public void reg(String title, String content);
}
