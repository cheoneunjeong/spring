package com.example.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.spring.domain.Board;
import com.example.spring.domain.Reply;

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

	public List<Board> search_bid(@Param("s") String s, @Param("page") int page);

	public List<Board> search_btitle(@Param("s") String s, @Param("page") int page);

	public int SearchPostCount_bid(String s);

	public int SearchPostCount_btitle(String s);

	public int getbid();
	
	public String getfilename(int bid);
	
	public void regReply(Reply reply);

	public void regReply2(Reply reply);
	
	public void reReply(Reply reply);
	
	public void reReply2(Reply reply);
	
	public int getreplycount(int bid);
	
	public List<Reply> getReplys(int bId);

	public void deleteReply(int r_num);

}
