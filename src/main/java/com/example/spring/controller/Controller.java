package com.example.spring.controller;

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
		return "/reg";
	}
	
	@RequestMapping("/reg.do")
	public String regdo(Model model, String title, String content) {
		
		
//		boardservice.reg();
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
}
