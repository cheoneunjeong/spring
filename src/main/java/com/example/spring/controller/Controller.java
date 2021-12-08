package com.example.spring.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring.domain.Board;
import com.example.spring.service.BoardService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired BoardService boardservice;
	
	@RequestMapping("/")
	public String home(Model model) {
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
	@RequestMapping("/reg")
	public String reg() {
		return "/regdo";
	}
	
	@RequestMapping("/regdo")
	public String regdo(Board board) {
		System.out.println("reg");
//		boardservice.reg(board);
//		List<Board> list = boardservice.selectBoardList();
//		model.addAttribute("list", list);
		
		return "/result";
	}
}
