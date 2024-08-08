package com.com.com.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApprovalController {
	
	@Inject
	private ServiceImp service;
	
	@Inject
	HttpSession session;
	
	//이동 메소드
	@RequestMapping("/")
	public String home(Model model) {
		
		session.removeAttribute("member");
		session.removeAttribute("id");
		session.removeAttribute("rank");
		
		session.invalidate();
		
		return "login";
	}
	//로그인
	@RequestMapping("login")
	public String login(Model model, LoginVo vo) {
		MemberDto login = service.login(vo);
		MemberDto check = service.loginCheck(vo.getMemId());
		
		
		if(check == null) {
			session.setAttribute("isId", false);
			return "loginResult";
		}
		else if(login == null ) {
			session.setAttribute("isLogin", false);
			return "loginResult";
		} else {
			session.setAttribute("member", login);
			session.setAttribute("id", login.getMemId());
			session.setAttribute("rank", login.getRank());
			session.setAttribute("isLogin", true);
			return "loginResult";
		}
		
	}
	//list 메소드
	@RequestMapping("board")
	public String board(Model model, HttpSession session) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		Object id = session.getAttribute("id");
		Object rank = session.getAttribute("rank");
		
		map.put("id", id);
		map.put("rank", rank);
		
		list = service.list(map);
		
		model.addAttribute("list", list);
		
		
		return "board";
	}
	
	//ajax 통신, 검새
	@RequestMapping("search")
	public String search(Model model, @RequestParam Map<String, Object> search){
		System.out.println("1:::::::::::::::");
		System.out.println(search);
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		Object id = session.getAttribute("id");
		Object rank = session.getAttribute("rank");
		
		search.put("id", id);
		search.put("rank", rank);
		
		list = service.list(search);
		
		System.out.println(search);
		System.out.println(list);
		
		model.addAttribute("list", list);
		System.out.println("3:::::::::::::::::");
		
		return "search";
	}
	
	//번호가지고 이동 메소드
	@RequestMapping("signWrite")
	public String signWrite(Model model) {
		int insertNum = service.insertNum();
		model.addAttribute("num", insertNum);
		return "signedWrite";
	}
	
	//insert (write + history)
	@RequestMapping(value="signInsert", produces="application/json; charset=UTF-8")
	public String signInsert(BoardDto dto, HistoryDto his) {
		System.out.println(dto.getSignedId());
		
		if(his.getSignedId().isEmpty()) {
			his.setSignedId(dto.getMemId());
		}
		
		int insert = service.signedInsert(dto);
		int history = service.insertHistory(his);
		
		
		
		if(insert == 0) {
			System.out.println("fail");
		} else {
			System.out.println("success");
		}
		
		if(history == 0) {
			System.out.println("fail");
		} System.out.println("success");
		
		
		return "redirect:board";
	}
	
	//view + history
	@RequestMapping("view")
	public String view(Model model, int bnum) {
		
		BoardDto view = service.view(bnum);
		List<HistoryDto> history = service.history(bnum);
		
		model.addAttribute("view", view);
		model.addAttribute("history", history);
		
		
		return "signedWrite";
	}
	
	//update 임시저장
	@RequestMapping("updateT")
	public String update(BoardDto dto, int bNum, HistoryDto his) {
		
		int upt = service.updateT(dto, bNum);
		int history = service.insertHistory(his);
		
		if(upt == 0) {
			System.out.println("fail");
		} System.out.println("success");
		
		if(history == 0) {
			System.out.println("fail");
		} System.out.println("success");
		return "redirect:board";
	}
	
	//update 결재
	@RequestMapping("updateCondition")
	public String updateCondition(BoardDto dto, int bNum, HistoryDto his) {
	
		int up = service.conditionUp(dto, bNum);
		int hist = service.insertHistory(his);
		
		if(up == 0) {
			System.out.println("fail");
		} System.out.println("success");
		
		if(hist == 0) {
			System.out.println("fail");
		} System.out.println("success");
		
		return "redirect:board";
	}

}
