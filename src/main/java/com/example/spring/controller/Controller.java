package com.example.spring.controller;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.http.HttpRequest;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	@RequestMapping(value="/regdo", method=RequestMethod.POST)
	public String regdo(Model model, Board board, String reqPage_, 
		@AuthenticationPrincipal User user, @RequestParam("file1") MultipartFile multipartFile) throws IOException
	{

		String path = "/Users/l4-morning/Documents/work10/spring/src/main/resources/static/images/";
		String thumbPath = path+"thumb/";
		String filename = multipartFile.getOriginalFilename();
		String ext = filename.substring(filename.lastIndexOf(".")+1);
		
		File file = new File(path+filename);
		File thumbFile = new File(thumbPath+filename);
		try {
			InputStream input = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(input, file);
			
			BufferedImage imageBuf = ImageIO.read(file);
			int fixWidth = 500;
			double ratio = imageBuf.getWidth() / (double)fixWidth;
			int thumbWidth = fixWidth;
			int thumbHeight = (int)(imageBuf.getHeight() / ratio);
			BufferedImage thumbImageBf = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D g = thumbImageBf.createGraphics(); 
			Image thumbImage = imageBuf.getScaledInstance(thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
			g.drawImage(thumbImage, 0, 0, thumbWidth, thumbHeight, null);
			g.dispose();
			ImageIO.write(thumbImageBf, ext, thumbFile);
		
		} catch(IOException e) {
			FileUtils.deleteQuietly(file);
			e.printStackTrace();
		} 
		
		String writer = user.getUsername();
		board.setFile(filename);
		board.setbWriter(writer);
		boardservice.reg(board);
		
		int bid = boardservice.getbid();
		board = boardservice.viewDetail(bid);
		
		model.addAttribute("board", board);
	
		return "/viewDetail";
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
