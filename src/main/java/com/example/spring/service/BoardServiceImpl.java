package com.example.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.domain.Board;
import com.example.spring.mapper.BoardMapper;

@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList() {
		return boardmapper.selectBoardList();
	}
	
	@Override
	public List<Board> selectBoardList_p(int reqPage) {
		return boardmapper.selectBoardList_p(reqPage);
	}
	
	@Override
	public void reg(Board board) {
		boardmapper.reg(board);
		
	}
	@Override
	public Board viewDetail(int bid) {
		boardmapper.addhit(bid);
		return boardmapper.selectviewDetail(bid);
	}
	@Override
	public void deletePost(int delid) {
		boardmapper.deletePost(delid);
		
	}
	@Override
	public void fixdo(Board board) {
		boardmapper.fixdo(board);
		
	}
	@Override
	public int getPostCount() {
		return boardmapper.getPostCount();
	}

	
}
