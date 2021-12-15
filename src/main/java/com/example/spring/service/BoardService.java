package com.example.spring.service;

import java.util.List;

import com.example.spring.domain.Board;
import com.example.spring.domain.Reply;

public interface BoardService {
	public List<Board> selectBoardList();
	
	public List<Board> selectBoardList_p(int reqPage);

	public void reg(Board board);

	public Board viewDetail(int bid);

	public void deletePost(int delid);

	public void fixdo(Board board);

	public int getPostCount();

	public void regComment(Board board);

	public List<Board> search_bid(String s, int page);
	
	public List<Board> search_btitle(String s, int page);

	public int SearchPostCount_bid(String s);

	public int SearchPostCount_btitle(String s);

	public int getbid();

	public String getfilename(int bid);
	
	public void regReply(Reply reply);

	public void reReply(Reply reply);
	
	public int getreplycount(int bid);
	
	public List<Reply> getReplys(int bId);

	public void deleteReply(int r_num); 

}
