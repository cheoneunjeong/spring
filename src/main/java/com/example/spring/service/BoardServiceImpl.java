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
		boardmapper.reg1(board);
		boardmapper.reg2(board);
		
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

	@Override
	public void regComment(Board board) {
		boardmapper.regComment(board);
		boardmapper.regComment2(board);
		
	}

	@Override
	public List<Board> search_bid(String s, int page) {
		return boardmapper.search_bid(s, page);
	}

	@Override
	public List<Board> search_btitle(String s, int page) {
		return boardmapper.search_btitle(s, page);
	}

	@Override
	public int SearchPostCount_bid(String s) {
		return boardmapper.SearchPostCount_bid(s);
	}

	@Override
	public int SearchPostCount_btitle(String s) {
		return boardmapper.SearchPostCount_btitle(s);
	}

}
