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
		return "member/content.tiles";
	}
	@RequestMapping("/regist")
	public String moveRegist() {
		logger.info("Welcome MemberController! go Main", "디버깅 모드");
		return "member/regist.tiles";
	}
	@RequestMapping("/find_by_id")
	public String moveFind_by_id() {
		logger.info("Welcome MemberController! go Main", "디버깅 모드");
		return "member/find_by_id.tiles";
	}
	@RequestMapping("/update")
	public String moveUpdate() {
		logger.info("Welcome MemberController! go Main", "디버깅 모드");
		return "member/update.tiles";
	}
	@RequestMapping("/delete")
	public String moveDelete() {
		logger.info("Welcome MemberController! go Main", "디버깅 모드");
		return "member/delete.tiles";
	}
	@RequestMapping("/login")
	public String moveLogin() {
		return "member/login.tiles";
	}
	@RequestMapping("/logout")
	public String moveLogout() {
		return "member/logout.tiles";
	}
	@RequestMapping("/list")
	public String moveList() {
		return "member/list.tiles";
	}
	@RequestMapping("/find_by")
	public String moveFind_by() {
		return "member/find_by.tiles";
	}
	@RequestMapping("/count")
	public String moveCount() {
		return "member/count.tiles";
	}
}
