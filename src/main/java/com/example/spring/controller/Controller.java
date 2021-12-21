package com.example.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.example.spring.domain.Board;
import com.example.spring.domain.Pagination;
import com.example.spring.domain.Reply;
import com.example.spring.domain.Survey;
import com.example.spring.domain.User;
import com.example.spring.service.BoardService;
import com.example.spring.service.SurveyService;
import com.example.spring.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	BoardService boardservice;
	@Autowired
	UserService userservice;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	ServletContext context;

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

	@RequestMapping(value = "/login")
	public String beforeLogin(Model model) {
		return "/login";
	}

	@RequestMapping(value = "/denied")
	public String denied(Model model) {
		return "/denied";
	}

	@RequestMapping("/boardlist")
	public String boardlist(Model model, String reqPage_, String f, String search ) {
		
		if (f == null && search == null) {
			if (reqPage_ == null) {
				reqPage_ = "1";
				reqPage = Integer.parseInt(reqPage_);
			} else {
				reqPage = Integer.parseInt(reqPage_);
				page = (reqPage - 1) * 3;
			}

			List<Board> list = boardservice.selectBoardList_p(page);

			int postCount = boardservice.getPostCount();
			Pagination pagination = new Pagination();
			pagination.init(postCount, reqPage);

			model.addAttribute("list", list);
			model.addAttribute("pagination", pagination);
		} else {

			List<Board> list = null;
			int postCount = 0;

			if (reqPage_ == null) {
				reqPage_ = "1";
				reqPage = Integer.parseInt(reqPage_);
			} else {
				reqPage = Integer.parseInt(reqPage_);
				page = (reqPage - 1) * 3;
			}

			String s = "%" + search + "%";

			if (f.equals("b_id")) {
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
		}
		return "/list";
	}

	@RequestMapping("/reg")
	public String reg() {
		
//		get absolute path :
//		ClassPathResource cp = new ClassPathResource("static" + File.separator + "images" + File.separator + "hh.jpg");
//		try {
//			System.out.println(cp.getFile().getAbsolutePath());
//			System.out.println(cp.getFilename());
//			System.out.println(cp.getFile().length());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		return "/regdo";
	}

	@RequestMapping(value = "/regdo", method = RequestMethod.POST)
	public String regdo(Model model, Board board, String reqPage_, @AuthenticationPrincipal User user)
			throws IOException {

		String path = context.getRealPath("") + "..\\resources\\static\\images\\";

//		String thumbPath = path+"thumb/";
		StringBuilder builder = new StringBuilder();

		List<MultipartFile> list = board.getFile();

		for (MultipartFile file : list) {
			if (!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				builder.append(filename);
				builder.append(",");

				File f = new File(path + filename);

				try {
					InputStream input = file.getInputStream();
					FileUtils.copyInputStreamToFile(input, f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (builder.toString().contains(",")) {
			int p = builder.toString().lastIndexOf(",");
			builder.deleteCharAt(p);

			board.setFileName(builder.toString());
		}

		String writer = user.getUsername();
		board.setbWriter(writer);

		boardservice.reg(board);

		int bid = boardservice.getbid();
		board = boardservice.viewDetail(bid);
		String filenames = boardservice.getfilename(bid);
		System.out.println(filenames);
		ArrayList<String> filename = new ArrayList<>();

		if (filenames != null) {
			if (filenames.contains(",")) {
				String[] files = filenames.split(",");
				for (String fileName : files)
					filename.add(fileName);
			} else
				filename.add(filenames);
		} else
			filename = null;

		int count = boardservice.getreplycount(bid);
		List<Reply> replys = boardservice.getReplys(bid);

		model.addAttribute("board", board);
		model.addAttribute("filename", filename);
		model.addAttribute("count", count);
		model.addAttribute("replys", replys);

		return "/viewDetail";
	}

	@RequestMapping("/viewdetail")
	public String viewDetail(Model model, int bid) {

		Board board = boardservice.viewDetail(bid);
		String filenames = boardservice.getfilename(bid);
		System.out.println(filenames);
		ArrayList<String> filename = new ArrayList<>();

		if (filenames != null) {
			if (filenames.contains(",")) {
				String[] files = filenames.split(",");
				for (String fileName : files)
					filename.add(fileName);
			} else
				filename.add(filenames);
		} else
			filename = null;

		int count = boardservice.getreplycount(bid);
		List<Reply> replys = boardservice.getReplys(bid);

		model.addAttribute("board", board);
		model.addAttribute("filename", filename);
		model.addAttribute("count", count);
		model.addAttribute("replys", replys);

		return "/viewDetail";
	}

	@RequestMapping("/deletePost")
	public String deletePost(Model model, int[] delId, SecurityContextHolderAwareRequestWrapper request) {

		if (request.isUserInRole("ROLE_ADMIN")) {

			for (int delid : delId) {
				boardservice.deletePost(delid);
			}

			List<Board> list = boardservice.selectBoardList();
			model.addAttribute("list", list);

			return "/index";
		}

		else
			return "/denied";

	}

	@RequestMapping("/viewDelete")
	public String deleteView(Model model, int bid, String bwriter, @AuthenticationPrincipal User user,
			SecurityContextHolderAwareRequestWrapper request) {
		if (request.isUserInRole("ROLE_ADMIN") || user.getUsername().equals(bwriter)) {

			boardservice.deletePost(bid);

			List<Board> list = boardservice.selectBoardList();
			model.addAttribute("list", list);

			return "/index";
		}

		else
			return "/denied";
	}

	@RequestMapping("/fixPost")
	public String fixPost(Model model, int bid, String bwriter, @AuthenticationPrincipal User user) {

		if (user.getUsername().equals(bwriter)) {

			model.addAttribute("bid", bid);
			model.addAttribute("bwriter", bwriter);

			return "/fixpost";
		} else {
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
	public String regComment(Model model, Board board, String reqPage_, @AuthenticationPrincipal User user) {

		board.setbWriter(user.getUsername());
		boardservice.regComment(board);

		if (reqPage_ == null) {
			reqPage_ = "1";
			reqPage = Integer.parseInt(reqPage_);
		} else {
			reqPage = Integer.parseInt(reqPage_);
			page = (reqPage - 1) * 3;
		}

		List<Board> list = boardservice.selectBoardList_p(page);

		int postCount = boardservice.getPostCount();
		Pagination pagination = new Pagination();
		pagination.init(postCount, reqPage);

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);

		return "/list";
	}

	@RequestMapping("/regReply")
	public String regReply(Model model, Reply reply, @AuthenticationPrincipal User user) {

		reply.setWriter(user.getUsername());
		int bId = reply.getbId();

		if (reply.getGroups() == 0)
			boardservice.regReply(reply);
		else
			boardservice.reReply(reply);

		int count = boardservice.getreplycount(bId);
		List<Reply> replys = boardservice.getReplys(bId);

		model.addAttribute("count", count);
		model.addAttribute("replys", replys);

		return "/reply";
	}

	@RequestMapping("/deleteReply")
	public String viewDetail(Model model, int r_num, int bId, String writer, @AuthenticationPrincipal User user) {

		if (user.getUsername().equals(writer)) {

			boardservice.deleteReply(r_num);

			Board board = boardservice.viewDetail(bId);
			String filenames = boardservice.getfilename(bId);
			ArrayList<String> filename = new ArrayList<>();

			if (filenames != null) {
				if (filenames.contains(",")) {
					String[] files = filenames.split(",");
					for (String fileName : files)
						filename.add(fileName);
				} else
					filename = null;
			}

			int count = boardservice.getreplycount(bId);
			List<Reply> replys = boardservice.getReplys(bId);

			model.addAttribute("board", board);
			model.addAttribute("filename", filename);
			model.addAttribute("count", count);
			model.addAttribute("replys", replys);

			return "/viewDetail";
		} else
			return "/denied";
	}

	@RequestMapping("/userlist")
	public String userlist(Model model, String page_, String[] mids , String ids,
			@AuthenticationPrincipal User user) {	
		
		if(mids != null) {
		
			String[] allId = ids.trim().split(" ");
			
			List<String> Mids= Arrays.asList(mids);
			List<String> cids_ = new ArrayList<>(Arrays.asList(allId));
			cids_.removeAll(Mids);
			String[] cids = cids_.toArray(new String[0]);
			
			for(String id : mids) {
				User u = userservice.getUser(id);
				u.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER", "ROLE_ADMIN"));
				userservice.createAuthorities(u);
			}
			for(String id : cids) {
				User u = userservice.getUser(id);
				u.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
				userservice.deleteAuth(id);
			}
		} else if(ids != null){
		
			String[] allId = ids.trim().split(" ");
			for(String id : allId) {
				User u = userservice.getUser(id);
				u.setAuthorities(AuthorityUtils.NO_AUTHORITIES);
				u.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
				userservice.deleteAuth(id);
			}
		}
		
		int p = 0;
		if(page_ == null) {
			page_ = "1";
			page = Integer.parseInt(page_);
			}
		else {
			page = Integer.parseInt(page_);
			p = (page-1)*3;
		}
		List<User> list = userservice.getuserlist(p);
		
		int userCount = userservice.getuserCount();
		Pagination pagination = new Pagination();
		pagination.init(userCount, page);

		for(User u : list) {
			String id = u.getUsername();
			UserDetails details = userservice.loadUserByUsername(id);
			if (details != null && details.getAuthorities().stream()
			      .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
				u.setU_auth(true);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		model.addAttribute("userCount", userCount);

		return "/userlist";

	}
	
	@Autowired SurveyService surveyservice;
	@RequestMapping("/surveylist")
	public String surveylist(Model model, String f, String search, String reqPage_) {

		int reqPage = 1; 
		int page = 0;
		
		if (f == null && search == null) {
			if (reqPage_ != null) {
				reqPage = Integer.parseInt(reqPage_);
				page = (reqPage - 1) * 3;
			}

			List<Survey> list = surveyservice.getsurveylist(page);

			int Count = surveyservice.getPostCount();
			Pagination pagination = new Pagination();
			pagination.init(Count, reqPage);

			model.addAttribute("list", list);
			model.addAttribute("pagination", pagination);
		
		} else {

			List<Survey> list = null;
			int Count = 0;
			
			if (reqPage_ != null) {
				reqPage = Integer.parseInt(reqPage_);
				page = (reqPage - 1) * 3;
			}
			
			String s = "%" + search + "%";

			if (f.equals("title")) {
				list = surveyservice.search_t(s, page);
				Count = surveyservice.SearchPostCount_t(s);
			} else {
				list = surveyservice.search_w(s, page);
				Count = surveyservice.SearchPostCount_w(s);
			}

			Pagination pagination = new Pagination();
			pagination.init(Count, reqPage);

			model.addAttribute("list", list);
			model.addAttribute("pagination", pagination);
			model.addAttribute("f", f);
			model.addAttribute("search", search);
		}
		
		
		return "/surveylist";
	}
	
	@RequestMapping("/regSurvey")
	public String regSurvey() {
		return "/regSurvey";
	}
	
	@RequestMapping("/survey")
	public String survey(Model model, String s_num) {
		return "/survey";
	}
	
	@RequestMapping("/selectQuestion")
	public String selectQuestion(String num_) {
		int num = 0;
		String q= null;
		
		if(num_ != null) 
			num = Integer.parseInt(num_);
		
		switch(num) {
		case 1: q = "/q1"; break;
		case 2: q = "/q2";	break;
		case 3: q = "/q3";	break;
		case 4: q = "/q4";	break;
		case 5: q = "/q5";	break;
		case 6: q = "/q6";	break;
		}
		return q;
	}
	
	@RequestMapping("/submit")
	public String submit(String s_num) {
		return "/survey";
	}

	@RequestMapping("/addquestion")
	public String addquestion() {
		return "/add";
	}
	
//	@RequestMapping("/regSurvey2")
//	public String regSurvey2(Model model, Survey survey, @AuthenticationPrincipal User user) {
//		
//		String path = context.getRealPath("")+"..\\resources\\static\\images\\";
//		
//		List<MultipartFile> list = survey.getFile();
//		
//		StringBuilder builder = new StringBuilder();
//		for(MultipartFile file : list) {
//			if(!file.isEmpty()) {
//				String filename = file.getOriginalFilename();
//				builder.append(filename);
//				builder.append(",");
//				
//				File f = new File(path+filename);
//				
//				try {
//					InputStream input = file.getInputStream();
//					FileUtils.copyInputStreamToFile(input, f);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		
//		if(builder.toString().contains(",")) {
//			int p = builder.toString().lastIndexOf(",");
//			builder.deleteCharAt(p);
//			
//			survey.setFilename(builder.toString());
//		}
//		
//		String writer = user.getUsername();
//		survey.setWriter(writer);
//		
//		StringBuilder ques = new StringBuilder();
//		if(survey.getQuestion_().length != 0) {
//			for(String q : survey.getQuestion_()) {
//				if(q!=null&& !q.isEmpty()) {
//					ques.append(q);
//					ques.append(",");
//				}
//			}
//			
//			if(ques.toString().contains(",")) {
//				int p = ques.toString().lastIndexOf(",");
//				ques.deleteCharAt(p);
//			}
//				survey.setQuestion(ques.toString());
//			
//		}
//		
//		StringBuilder ans = new StringBuilder();
//		if(survey.getAnswer_().length != 0) {
//			for(String a : survey.getAnswer_()) {
//				if(a!=null && !a.isEmpty()) {
//					ans.append(a);
//					ans.append(",");
//				}
//			}
//			if(ans.toString().contains(",")) {
//				int p = ans.toString().lastIndexOf(",");
//				ans.deleteCharAt(p);
//			}
//				survey.setAnswer(ans.toString());
//		}
//		
//		surveyservice.reg(survey);
//		
//		return "/index";
//	}
	
	@RequestMapping("/regsurvey2")
	public String regsurvey2() {
		return "/regSurvey";
	}
	
}

