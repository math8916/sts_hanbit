package com.hanbit.web.member;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hanbit.web.member.MemberController;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@RequestMapping ("/main")
	public String goMain() {
		logger.info("Welcome MemberController! go Main", "디버깅 모드");
		return "admin:member/content.tiles";
	}
	@RequestMapping("/regist")
	public String moveRegist() {
		logger.info("Welcome MemberController regist! go regist", "디버깅 모드");
		return "public:member/regist.tiles";
	}
	@RequestMapping("/find_by_id")
	public String moveFind_by_id() {
		logger.info("Welcome MemberController! go detail", "디버깅 모드");
		return "user:member/find_by_id.tiles";
	}
	@RequestMapping("/update")
	public String moveUpdate() {
		logger.info("Welcome MemberController! go update", "디버깅 모드");
		return "user:member/update.tiles";
	}
	@RequestMapping("/delete")
	public String moveDelete() {
		logger.info("Welcome MemberController! go delete", "디버깅 모드");
		return "user:member/delete.tiles";
	}
	@RequestMapping("/login")
	public String moveLogin() {
		logger.info("Welcome MemberController! go login", "디버깅 모드");
		return "public:member/login.tiles";
	}
	@RequestMapping("/logout")
	public String moveLogout() {
		return "user:member/logout.tiles";
	}
	@RequestMapping("/list")
	public String moveList() {
		return "admin:member/list.tiles";
	}
	@RequestMapping("/find_by")
	public String moveFind_by() {
		return "admin:member/find_by.tiles";
	}
	@RequestMapping("/count")
	public String moveCount() {
		return "admin:member/count.tiles";
	}
}
