package com.hanbit.web.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"user","context","js","css","img"})
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired MemberServiceImpl service;
	@RequestMapping("/search")
	public String find(@RequestParam("keyword")String keyword,
			@RequestParam("search_option")String option,
			@RequestParam("context")String context,
			Model model){
	
		MemberVO member= service.findById(keyword);
		logger.info("MemberController   findByID");
		System.out.println("name" + member.getName());
		System.out.println("이미지:"+member.getProfileImg());
		model.addAttribute("member",member);
		model.addAttribute("img",context+"/resources/img");
		return "admin:member/detail.tiles";
		
	}
	
	@RequestMapping(value="/login" ,method=RequestMethod.POST)
	public String login(@RequestParam("id")String id,
			@RequestParam("password")String password,
			@RequestParam("context")String context,
			Model model
			) {
	
			
		/*MemberVO member= service.login(id);*/
		logger.info("TO LOGIN ID IS {}", id);
		logger.info("TO LOGIN PASSWORD IS {}", password);
		logger.info("CONTEXT IS {}", context);
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(password);
		String sm = service.login(member);
		model.addAttribute("user",sm);
		model.addAttribute("context",context);
		model.addAttribute("js",context+"/resources/js");
		model.addAttribute("css",context+"/resources/css");
		model.addAttribute("img",context+"/resources/img");
		

		return "user:user/content.tiles";
	}
	/////  move /////////
	@RequestMapping ("/main")
	public String goMain() {
		logger.info("go to {}", "main");
		return "admin:member/content.tiles";
	}
	@RequestMapping("/regist")
	public String moveRegist() {
		logger.info("Go to regist! {}", "regist");
		return "public:member/regist.tiles";
	}
	@RequestMapping("/find_by_id")
	public String moveFind_by_id() {
		logger.info("Go to! {}", "find_by_id");
		return "user:member/find_by_id.tiles";
	}
	@RequestMapping("/update")
	public String moveUpdate() {
		logger.info("Go to! {}", "update");
		return "user:member/update.tiles";
	}
	@RequestMapping("/delete")
	public String moveDelete() {
		logger.info("Go to! go delete", "delete");
		return "user:member/delete.tiles";
	}

	@RequestMapping("/login")
	public String moveLogin() {
		logger.info("Go to!{}", "login");
		return "public:member/login.tiles";
	}
	@RequestMapping("/logout")
	public String moveLogout() {
		logger.info("Go to!{}", "logout");
		return "user:member/logout.tiles";
	}
	@RequestMapping("/list")
	public String moveList() {
		logger.info("Go to!{}", "list");
		return "admin:member/list.tiles";
	}
	@RequestMapping("/find_by")
	public String moveFind_by() {
		logger.info("Go to!{}", "find_by");
		return "admin:member/find_by.tiles";
	}
	@RequestMapping("/kaup")
	public String moveKaup() {
		logger.info("Go to!{}", "kaup");
		return "user:user/kaup.tiles";
	}
	@RequestMapping("/rock")
	public String moveRock() {
		logger.info("Go to!{}", "rock");
		return "user:user/rock.tiles";
	}
	@RequestMapping("/lotto")
	public String moveLotto() {
		logger.info("Go to!{}", "lotto");
		return "user:user/rock.tiles";
	}
	@RequestMapping("/content")
	public String moveContent() {
		logger.info("Go to!{}", "content");
		return "user:user/content.tiles";
	}
	@RequestMapping("/detail")
	public String moveDetail() {
		
		logger.info("Go to!{}", "detail");
		return "user:member/detail.tiles";
	}
	@RequestMapping("/admin_detail")
	public String moveA_detail(@RequestParam("key")String key) {
		
		logger.info("Go to!{}", "admin_detail");
		logger.info("key is {}", key);
		return "admin:member/a_detail.tiles";
	}

}
