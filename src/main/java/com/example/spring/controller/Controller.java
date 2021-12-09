package com.example.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring.domain.Board;
import com.example.spring.domain.Pagination;
import com.example.spring.service.BoardService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired BoardService boardservice;
	int page = 1;
	int reqPage = 0;
	
	@RequestMapping("/")
	public String home(Model model, String reqPage_) {
		
		if(reqPage_ == null) {
			reqPage_ = "0";
			reqPage = Integer.parseInt(reqPage_);
			}
		else {
			reqPage = Integer.parseInt(reqPage_);
			reqPage = (reqPage-1)*3;
		}
		
		List<Board> list = boardservice.selectBoardList_p(reqPage);
		Pagination pagination = new Pagination(page);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
	
		return "/index";
	}
	
	@RequestMapping("/reg")
	public String reg() {
		return "/regdo";
	}
	
	@RequestMapping("/regdo")
	public String regdo(Model model, Board board) {

		boardservice.reg(board);
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
	@RequestMapping("/viewdetail")
	public String viewDetail(Model model, int bid) {

		Board board = boardservice.viewDetail(bid);
		
		model.addAttribute("board", board);
		
		return "/viewDetail";
	}
	
	@RequestMapping("/deletePost")
	public String deletePost(Model model, int[] delId) {

		for(int delid : delId) {
			boardservice.deletePost(delid);
		}
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
	@RequestMapping("/viewDelete")
	public String deleteView(Model model, int bid) {

		boardservice.deletePost(bid);
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
	@RequestMapping("/fixPost")
	public String fixPost(Model model, int bid, String bwriter) {

		model.addAttribute("bid", bid);
		model.addAttribute("bwriter", bwriter);
		
		return "/fixpost";
	}
	
	@RequestMapping("/fixdo")
	public String fixdo(Model model, Board board) {

		boardservice.fixdo(board);
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
}
