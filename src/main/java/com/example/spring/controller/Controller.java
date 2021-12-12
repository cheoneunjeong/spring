package com.example.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
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
	public String deletePost(Model model, int[] delId, SecurityContextHolderAwareRequestWrapper request) {

		if (request.isUserInRole("ROLE_ADMIN")) {

			for(int delid : delId) {
				boardservice.deletePost(delid);
			}
			
			List<Board> list = boardservice.selectBoardList();
			model.addAttribute("list", list);
			
			return "/index";
		} 
		
		else return "/denied";
		
	}
	
	@RequestMapping("/viewDelete")
	public String deleteView(Model model, int bid, String bwriter, @AuthenticationPrincipal User user,
								SecurityContextHolderAwareRequestWrapper request)
	{
		if (request.isUserInRole("ROLE_ADMIN") || user.getUsername().equals(bwriter)) {

			boardservice.deletePost(bid);
			
			List<Board> list = boardservice.selectBoardList();
			model.addAttribute("list", list);
			
			return "/index";
		} 
		
		else return "/denied";
	}
	
	@RequestMapping("/fixPost")
	public String fixPost(Model model, int bid, String bwriter, @AuthenticationPrincipal User user) {
		
		if(user.getUsername().equals(bwriter)) {
		
		model.addAttribute("bid", bid);
		model.addAttribute("bwriter", bwriter);
		
		return "/fixpost";
		}
		else {
			return "/denied";
		}
	}
	
	@RequestMapping("/fixdo")
	public String fixdo(Model model, Board board) {

		boardservice.fixdo(board);
		
		List<Board> list = boardservice.selectBoardList();
		model.addAttribute("list", list);
		
		return "/index";
	}
	
	@RequestMapping("/regComment")
	public String regComment(Model model, int bid, int groups, int orders, int depth) {

		model.addAttribute("bid", bid);
		model.addAttribute("groups", groups);
		model.addAttribute("orders", orders);
		model.addAttribute("depth", depth);
		
		return "/regComment";
	}
	
	@RequestMapping("/regCommentdo")
	public String regComment(Model model, Board board, String reqPage_,
								@AuthenticationPrincipal User user) 
	{

		board.setbWriter(user.getUsername());
		boardservice.regComment(board);
		
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
	
	@RequestMapping("/search")
	public String search(Model model, String f, String search, String reqPage_) {

		List<Board> list = null;
		int postCount = 0;
		
		if(reqPage_ == null) {
			reqPage_ = "1";
			reqPage = Integer.parseInt(reqPage_);
			}
		else {
			reqPage = Integer.parseInt(reqPage_);
			page = (reqPage-1)*3;
		}
		
		String s = "%"+search+"%";
		
		if(f.equals("b_id")) {
			list = boardservice.search_bid(s, page);
			postCount = boardservice.SearchPostCount_bid(s);
		} else {
			list = boardservice.search_btitle(s, page);
			postCount = boardservice.SearchPostCount_btitle(s);
		}

		Pagination pagination = new Pagination();
		pagination.init(postCount, reqPage);
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		model.addAttribute("f", f);
		model.addAttribute("search", search);
		
		return "/s_list";
	}
	
}
