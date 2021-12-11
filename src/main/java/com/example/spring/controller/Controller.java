package com.example.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring.domain.Board;
import com.example.spring.domain.Pagination;
import com.example.spring.domain.User;
import com.example.spring.service.BoardService;
import com.example.spring.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;
	@Autowired
    private PasswordEncoder passwordEncoder;
	private HttpSession session;
	
	
	int page = 0;
	int reqPage = 0;
	
	
	@RequestMapping("/")
	public String home() {
		return "/index";
	}
	
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	
	@RequestMapping("/signup")
	public String signup(User user) {
		
		String password = passwordEncoder.encode(user.getPassword());
		
		user.setPassword(password);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		userservice.createUser(user);
		
		userservice.createAuthorities(user);
		
		return "/login";
	}
	
	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@RequestMapping(value="/denied")
	public String denied(Model model) {
		return "/denied";
	}
	
	@RequestMapping("/boardlist")
	public String boardlist(Model model, String reqPage_) {
		
		if(reqPage_ == null) {
			reqPage_ = "1";
			reqPage = Integer.parseInt(reqPage_);
			}
		else {
			reqPage = Integer.parseInt(reqPage_);
			page = (reqPage-1)*3;
		}

		List<Board> list = boardservice.selectBoardList_p(page);
		
		int postCount = boardservice.getPostCount();
		Pagination pagination = new Pagination();
		pagination.init(postCount, reqPage);
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
	
		return "/list";
	}

	@RequestMapping("/reg")
	public String reg() {
		return "/regdo";
	}
	
	@RequestMapping("/regdo")
	public String regdo(Model model, Board board, String reqPage_, @AuthenticationPrincipal User user) {

		String writer = user.getUsername();

		board.setbWriter(writer);
		boardservice.reg(board);
		
		if(reqPage_ == null) {
			reqPage_ = "1";
			reqPage = Integer.parseInt(reqPage_);
			}
		else {
			reqPage = Integer.parseInt(reqPage_);
			page = (reqPage-1)*3;
		}

		List<Board> list = boardservice.selectBoardList_p(page);
		
		int postCount = boardservice.getPostCount();
		Pagination pagination = new Pagination();
		pagination.init(postCount, reqPage);
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
	
		return "/list";
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
